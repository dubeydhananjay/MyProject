package com.webdesign.handler;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.model.BillingAddress;
import com.webdesign.model.ShippingAddress;
import com.webdesign.model.Supplier;
import com.webdesign.model.UserDetail;
import com.webdesign.service.NewSupplierService;
import com.webdesign.service.UserService;

@Component
public class DemoHandler {
	@Autowired
	public ShippingAddress shippingAddress;
	@Autowired
	public BillingAddress billingAddress;
	@Autowired
	public Supplier supplier;
	@Autowired
	public UserService userService;
	@Autowired
	public NewSupplierService newSupplierService;
	@Autowired
	private SessionFactory sessionFactory; 
	public UserDetail initFlow()
	{
		return new UserDetail();
	}
	
	public String validateDetails(UserDetail userDetail,MessageContext messageContext){
		String status = "success";
		String emailPttern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";

		if(userDetail.getUsername().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"username").defaultText("UserName cannot be Empty").build());
			status = "failure";
		}
		if(userDetail.getEmailId().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"emailId").defaultText("Email cannot be Empty").build());
			
			status = "failure";
		}
		else if(userDetail.getEmailId().matches(emailPttern))
		{
			return "success";
			
		}
		else{
			messageContext.addMessage(new MessageBuilder().error().source(
		
				"emailId").defaultText("Invalid Email format").build());
			return "failure";
		}
		if(userDetail.getFirstname().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"firstname").defaultText("First name cannot be Empty").build());
			status = "failure";
		}
		if(userDetail.getLastname().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"lastname").defaultText("Last name cannot be Empty").build());
			status = "failure";
		}
		if(userDetail.getContactNo().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"contactNo").defaultText("Contact no cannot be Empty").build());
			status = "failure";
		}
		if(userDetail.getPassword().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"password").defaultText("Password cannot be Empty").build());
			status = "failure";
		}
		
		return status;
	}
	
	public String duplicateUser(UserDetail userDetail, MessageContext messageContext)
	{
		//UserDetail userDetail= new UserDetail(); 
		String status="success";
		List<UserDetail> userDetailList =userService.userDetailList();
		for(UserDetail k:userDetailList)
		{
			if(k.getUsername().equals(userDetail.getUsername()) && k.getEmailId().equals(userDetail.getEmailId()))
			{
				messageContext.addMessage(new MessageBuilder().error().source(
						"username").defaultText("username already exists").build());
				
				messageContext.addMessage(new MessageBuilder().error().source(
						"emailId").defaultText("email id already exists").build());
				status="failure";
			}
			
			else if(k.getUsername().equals(userDetail.getUsername()))
					{
				messageContext.addMessage(new MessageBuilder().error().source(
						"username").defaultText("username already exists").build());
				status="failure";
					}
			else if(k.getEmailId().equals(userDetail.getEmailId()))
			{
				messageContext.addMessage(new MessageBuilder().error().source(
						"emailId").defaultText("email id already exists").build());
				status="failure";
			}
		}
		return status;
			
	}
	@Transactional
		public String addShippingAddress()
		{
			this.shippingAddress.setCity(shippingAddress.getCity());
			this.shippingAddress.setDistrict(shippingAddress.getDistrict());
			this.shippingAddress.setLandmark(shippingAddress.getLandmark());
			this.shippingAddress.setPinCode(shippingAddress.getPinCode());
			this.shippingAddress.setState(shippingAddress.getState());
			this.shippingAddress.setStreetAddress1(shippingAddress.getStreetAddress1());
			this.shippingAddress.setStreetAddress2(shippingAddress.getStreetAddress2());
			
			this.sessionFactory.getCurrentSession().saveOrUpdate(shippingAddress);
			return "success";
		}
	@Transactional
		public String addBillingAddress()
		{
			this.billingAddress.setCity(billingAddress.getCity());
			this.billingAddress.setDistrict(billingAddress.getDistrict());
			this.billingAddress.setLandmark(billingAddress.getLandmark());
			this.billingAddress.setPinCode(billingAddress.getPinCode());
			this.billingAddress.setState(billingAddress.getState());
			this.billingAddress.setStreetAddress1(billingAddress.getStreetAddress1());
			this.billingAddress.setStreetAddress2(billingAddress.getStreetAddress2());
			
			this.sessionFactory.getCurrentSession().saveOrUpdate(billingAddress);
			return "success";
		}
	
	@Transactional
	public String addSupplierAddress()
	{
		this.supplier.setSupplierCity(supplier.getSupplierCity());
		this.supplier.setSupplierCompanyAddress1(supplier.getSupplierCompanyAddress1());
		this.supplier.setSupplierCompanyAddress2(supplier.getSupplierCompanyAddress2());
		this.supplier.setSupplierCompanyName(supplier.getSupplierCompanyName());
		this.supplier.setSupplierCompanyURL(supplier.getSupplierCompanyURL());
		this.supplier.setSupplierDistrict(supplier.getSupplierDistrict());
		this.supplier.setSupplierPinCode(supplier.getSupplierPinCode());
		this.supplier.setSupplierState(supplier.getSupplierState());
		
		this.sessionFactory.getCurrentSession().saveOrUpdate(supplier);
		return "success";
	}
	@Transactional
		public String saveOrUpdateUser(UserDetail userDetail)
		{
			this.shippingAddress.setUserDetail(userDetail);
		    userDetail.setShippingAddress(shippingAddress);
			//this.userService.savOrUpdateUser(userDetail);
			
			this.billingAddress.setUserDetail(userDetail);
			userDetail.setBillingAddress(billingAddress);
			this.userService.savOrUpdateUser(userDetail);
			
			return "success";
		}
	
	
	@Transactional
	public String savOrUpdateSupplier(UserDetail userDetail)
	{
		this.supplier.setUserdetail(userDetail);
		userDetail.setSupplier(supplier);
		this.newSupplierService.savOrUpdateSupplier(userDetail);
	
		return "success";
	}

}

