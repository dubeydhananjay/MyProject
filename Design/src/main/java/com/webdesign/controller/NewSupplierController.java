package com.webdesign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webdesign.model.BillingAddress;
import com.webdesign.model.ShippingAddress;
import com.webdesign.model.UserDetail;
import com.webdesign.service.NewSupplierService;


@Controller
public class NewSupplierController {
	@Autowired
	private NewSupplierService newSupplierService;
	@RequestMapping("/newsuppliers")
	public String listUser(Model model)
	{
		UserDetail userDetail = new UserDetail();
		ShippingAddress shippingAddress = new  ShippingAddress();
		BillingAddress billingAddress = new BillingAddress();
		
		userDetail.setShippingAddress(shippingAddress);
		userDetail.setBillingAddress(billingAddress);
		model.addAttribute("newsupplier", userDetail);
		return "newsuppliers";
	}
	
	@RequestMapping("/newsupplier")
	 public String addUser(@ModelAttribute("newsupplier") UserDetail userDetail)
	 {
		this.newSupplierService.saveOrUpdate(userDetail);
		return "redirect:/registration";
	 }



}
