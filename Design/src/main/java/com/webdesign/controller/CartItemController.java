package com.webdesign.controller;

import java.util.Date;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.model.CartItem;
import com.webdesign.service.CartItemService;
import com.webdesign.service.ProductService;
import com.webdesign.service.UserService;

@Controller
public class CartItemController 
{
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private ProductService productService; 
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/buynow-{productId}")
	public String addToBuyNow(@ModelAttribute("cartItem") CartItem cartItem, @PathVariable("productId") int productId, @RequestParam("userId") int userId,  HttpSession session )
	{
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		userId=userService.getByName(username).getUserId();
		cartItem.setUserId(userId);
		cartItem.setProductId(productId);
		session.setAttribute("productId", productId);
		productId = (Integer) session.getAttribute("productId");
		  
		cartItem.setCartId(userId);
		cartItem.setFlag(false);
		String productName=productService.getById(productId).getProductName();
		cartItem.setProductName(productName);
		cartItem.setAmount(productService.getById(productId).getProductPrice());
		cartItem.setQuantity("1");
		Date date = new Date();
		cartItem.setOrderDate(date);
		this.cartItemService.addToBuyNow(cartItem);
		this.productService.productSubtract(productId);
		session.setAttribute("cartItemId", cartItem.getCartItemId());
		int cartItemId = (Integer)session.getAttribute("cartItemId");
		return "redirect:/cartlist-"+cartItemId;
		
	}

	
	@RequestMapping("/cartlist-{cartItemId}")
	public String cartList(Model model, @ModelAttribute("cartItem") CartItem cartItem, @PathVariable("cartItemId") int cartItemId, HttpSession session )
	{
		cartItemId = (Integer)session.getAttribute("cartItemId");
		session.setAttribute("cartItemId", cartItem.getCartItemId());
		
		Gson pGson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		CartItem newcartItem = cartItemService.getByCartItemId(cartItemId);
		 String cartJson=pGson.toJson(newcartItem);
		 //System.out.println("here"+cartJson);
		 model.addAttribute("cartItemList", cartJson);
		 model.addAttribute("listCartItem", cartItemService.getByCartItemId(cartItemId));
		return "cartItem";
		
	}
	
	 @RequestMapping("/checkout-{productId}")
	  public String getCartCheckOut(@ModelAttribute("cartItem") CartItem cartItem, @PathVariable("productId") int productId,HttpSession session)
	  {
		  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		  String username=authentication.getName();
		  int userId=userService.getByName(username).getUserId();
		  session.setAttribute("userId", userId);
		  session.setAttribute("productId", productId);
		  productId = (Integer) session.getAttribute("productId");
		  
		  return "redirect:/cart?userId="+userId;
	  }

}
