package com.webdesign.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
	
	@Autowired
	MessageSource resources;
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
		this.userService.saveOrUpdateUser(userDetail);
		return "redirect:/registration";
	 }

	@RequestMapping("/login")
	public String login()
	{
		
		return "login";
	}
	
	@RequestMapping("/loginfailed")
	public String loginerror(Model model) {
 
		//String errormessage = resources.getMessage("login.error", null, null);
		model.addAttribute("error", "true");
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
	
	@RequestMapping("/welcome")
	public String welcome()
	{
		return "welcome";
	}
	
	@RequestMapping("/adminRegister")
	public String adminRegister(Model model)
	{
		
		model.addAttribute("adminRegister", new UserDetail());
		return "adminRegister";
		
	}
	
	@RequestMapping("/addAdmin")
	public String addAdmin(@ModelAttribute("adminRegister") UserDetail userDetail)
	{
		this.userService.saveOrUpdateAdmin(userDetail);
		return "redirect:/adminRegister";
	}
}
