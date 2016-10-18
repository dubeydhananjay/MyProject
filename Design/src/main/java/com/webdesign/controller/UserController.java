package com.webdesign.controller;

import org.springframework.beans.factory.annotation.Autowired;

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
		return "registration";
	}
	
	@RequestMapping("/addRegistration")
	 public String addUser(@ModelAttribute("registration") UserDetail userDetail)
	 {
		this.userService.savOrUpdateUser(userDetail);
		return "redirect:/registration";
	 }

}
