package com.webdesign.controller;



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
import com.webdesign.model.Wishlist;
import com.webdesign.service.ProductService;
import com.webdesign.service.UserService;
import com.webdesign.service.WishlistService;

import java.util.List;

@Controller
public class WishlistController 
{
	
	@Autowired
	private WishlistService wishlistService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/wishlist-{productId}")
	public String addToWishlist(@ModelAttribute("wishlist") Wishlist wishlist, @PathVariable("productId") int productId,  HttpSession session )
	{
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		int userId=userService.getByName(username).getUserId();
		wishlist.setUserId(userId);
		wishlist.setProductId(productId);
		session.setAttribute("productId", productId);
		productId = (Integer) session.getAttribute("productId");
		 
		wishlist.setCartId(userId);
		wishlist.setFlag(false);
		String productName=productService.getById(productId).getProductName();
		wishlist.setProductName(productName);
		wishlist.setAmount(productService.getById(productId).getProductPrice());
		wishlist.setQuantity("1");
		
		
		this.wishlistService.addToWishlist(wishlist);;
		
		return "redirect:/";
		
	}

	@RequestMapping("/mywishlist")
	public String cartList(Model model, @ModelAttribute("wishlist") Wishlist wishlist, HttpSession session )
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		int userId=userService.getByName(username).getUserId();
		List<Wishlist> newwishlist =wishlistService.getByUserId(userId);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		
		String wishlistJson = gson.toJson(newwishlist);

		 model.addAttribute("wishlist", wishlistJson);
		 
		return "userwishlist";
		
	}
}
