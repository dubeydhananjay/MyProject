package com.webdesign.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.model.CartItem;
import com.webdesign.model.ShippingAddress;
import com.webdesign.service.CartItemService;
import com.webdesign.service.ProductService;
import com.webdesign.service.UserService;

@Controller
public class CartItemController {
	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	@RequestMapping("/buynow-{productId}")
	public String addToBuyNow(@ModelAttribute("cartItem") CartItem cartItem, @PathVariable("productId") int productId,
			@RequestParam("userId") int userId, HttpSession session) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		userId = userService.getByName(username).getUserId();
		cartItem.setUserId(userId);
		cartItem.setProductId(productId);
		session.setAttribute("productId", productId);
		productId = (Integer) session.getAttribute("productId");

		cartItem.setCartId(userId);
		cartItem.setFlag(false);
		String productName = productService.getById(productId).getProductName();
		cartItem.setProductName(productName);
		cartItem.setAmount(productService.getById(productId).getProductPrice());
		cartItem.setQuantity(1);
		Date date = new Date();
		cartItem.setOrderDate(date);
		this.cartItemService.addToBuyNow(cartItem);
		// this.productService.productSubtract(productId);
		session.setAttribute("cartItemId", cartItem.getCartItemId());
		int cartItemId = (Integer) session.getAttribute("cartItemId");
		List<CartItem> buynowList = cartItemService.cartListByCartItemId(cartItemId);
		session.setAttribute("buynowList", buynowList);
		return "redirect:/cartlist-" + cartItemId;

	}

	@RequestMapping("/cartlist-{cartItemId}")
	public String cartList(Model model, @ModelAttribute("cartItem") CartItem cartItem,
			@PathVariable("cartItemId") int cartItemId, HttpSession session) {

		cartItemId = (Integer) session.getAttribute("cartItemId");
		session.setAttribute("cartItemId", cartItem.getCartItemId());
		session.setAttribute("checkout", "buynow");
		Gson pGson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		CartItem newcartItem = cartItemService.getByCartItemId(cartItemId);
		String cartJson = pGson.toJson(newcartItem);
		// System.out.println("here"+cartJson);
		model.addAttribute("cartItemList", cartJson);
		model.addAttribute("listCartItem", cartItemService.getByCartItemId(cartItemId));
		return "cartItem";

	}

	@RequestMapping("/addCart-{productId}")
	public String addToCart(@ModelAttribute("cartItem") CartItem cartItem, @PathVariable("productId") int productId,
			 Model model, HttpSession session) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		int userId = userService.getByName(username).getUserId();
		cartItem.setUserId(userId);
		cartItem.setCartId(userId);
		cartItem.setFlag(false);
		cartItem.setProductId(productId);

		cartItem.setProductName(productService.getById(productId).getProductName());
		// cartItem.setProductPrice(productService.getById(productId).getProductPrice());
		cartItem.setAmount(productService.getById(productId).getProductPrice());
		Date systemdate = new Date();
		cartItem.setOrderDate(systemdate);
		// cartItem.setProductDiscount(productService.getById(productId).getProductDiscount());

		cartItem.setQuantity(1);

		cartItemService.addToBuyNow(cartItem);

		// productService.productSubtract(productId);

		session.setAttribute("cartItemId", cartItem.getCartItemId());
		session.setAttribute("productId" + cartItem.getCartItemId(), cartItem.getProductId());

		return "redirect:/cartList";

	}

	@RequestMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		session.setAttribute("checkout", "cartList");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		int userId = userService.getByName(username).getUserId();
		List<CartItem> cartItem = cartItemService.cartList(userId);
		session.setAttribute("mycartList", cartItem);
		for (CartItem k : cartItem) {
			session.setAttribute("productId" + k.getCartItemId(), k.getProductId());
		}
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(cartItem);
		model.addAttribute("cartList", json);
		return "cartList";
	}

	@RequestMapping("/orderList")
	public String orderList(Model model, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		int userId = userService.getByName(username).getUserId();
		List<CartItem> p = cartItemService.orderedList(userId);
		for (CartItem k : p) {
			session.setAttribute("productId" + k.getCartItemId(), k.getProductId());
		}
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String j = gson.toJson(p);
		model.addAttribute("orderedlist", j);
		return "orderlist";
	}

	@RequestMapping("/delete-{cartItemId}")
	public String deleteCart(@PathVariable("cartItemId") int cartItemId, CartItem cartItem, HttpSession session) {

		this.cartItemService.delete(cartItemId);

		return "redirect:/cartList";
	}

	@RequestMapping("/checkoutCart")
	public String checkOut(@ModelAttribute("cartItem") CartItem cartItem, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		int userId = userService.getByName(username).getUserId();
		session.setAttribute("userId", userId);
		return "redirect:/cart?userId=" + userId;
	}

	@SuppressWarnings({ "unchecked" })
	@RequestMapping("/updateflag")
	public String updateFlag(HttpSession session, CartItem cartItem) {

		List<CartItem> cart = (List<CartItem>) session.getAttribute("mycartList");
		if (cart == null || session.getAttribute("checkout") == "buynow") {

			cartItemService.setFlag((Integer) session.getAttribute("cartItemId"));
			productService.productSubtract((Integer) session.getAttribute("productId"));
			// cartItemService.delete((Integer)
			// session.getAttribute("cartItemId"));
		} else if (session.getAttribute("checkout") == "cartList") {
			for (CartItem c : cart) {
				cartItemService.setFlag(c.getCartItemId());
				productService.productSubtract(c.getProductId());
				// cartItemService.delete(c.getCartItemId());
			}
		}

		return "redirect:/receipt";

	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/receipt")
	public ModelAndView receipt(HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		int userId = userService.getByName(username).getUserId();

		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		ModelAndView model = new ModelAndView("receipt");
		List<CartItem> order = (List<CartItem>) session.getAttribute("mycartList");
		if (order == null || session.getAttribute("checkout") == "buynow") {
			List<CartItem> k = (List<CartItem>) session.getAttribute("buynowList");

			String rjson = gson.toJson(k);
			model.addObject("placedOrder", rjson);

		} else if (session.getAttribute("checkout") == "cartList") {
			List<CartItem> k = (List<CartItem>) session.getAttribute("mycartList");

			String rjson = gson.toJson(k);
			model.addObject("placedOrder", rjson);

		}
		String sjson = gson.toJson(userService.getShippingAddressById(userId));
		model.addObject("listshippingaddress", sjson);
		return model;

	}

}
