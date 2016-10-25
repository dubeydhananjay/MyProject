package com.webdesign.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webdesign.model.BillingAddress;
import com.webdesign.model.ShippingAddress;
import com.webdesign.model.UserDetail;
import com.webdesign.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/registration")
	public String listUser(Model model)
	{
		UserDetail userDetail = new UserDetail();
		ShippingAddress shippingAddress = new  ShippingAddress();
		BillingAddress billingAddress = new BillingAddress();
		
		userDetail.setShippingAddress(shippingAddress);
		userDetail.setBillingAddress(billingAddress);
		model.addAttribute("registration", userDetail);
		return "redirect:/reg";
	}
	
	@RequestMapping("/addRegistration")
	 public String addUser(@ModelAttribute("registration") UserDetail userDetail)
	 {
		this.userService.savOrUpdateUser(userDetail);
		return "redirect:/registration";
	 }

	@RequestMapping("/login")
	public String login()
	{
		
		return "login";
	}
	
	@RequestMapping("/perform_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication!=null)
		{
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		
		return "redirect:/";
	}
}
