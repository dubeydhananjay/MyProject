package com.webdesign.handler;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
	public UserDetail userDetail;
	@Autowired
	private MailSender mailSender;
	
	
	public UserDetail initFlow()
	{
		return new UserDetail();
	}
	
	public String validateDetails(UserDetail userDetail,MessageContext messageContext){
		String status = "success";
		String emailPattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";

		if(userDetail.getUsername().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"username").defaultText("UserName cannot be Empty").build());
			status="failure";
		}
		if(userDetail.getEmailId().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"emailId").defaultText("Email cannot be Empty").build());
			
			status = "failure";
		}
		else if(userDetail.getEmailId().matches(emailPattern))
		{
			status="success";
			
		}
		else{
			messageContext.addMessage(new MessageBuilder().error().source(
		
				"emailId").defaultText("Invalid Email format").build());
			status="failure";
		}
		if(userDetail.getFirstname().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source(
					"firstname").defaultText("First name cannot be Empty").build());
			status="failure";
		}
		if(userDetail.getLastname().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source(
					"lastname").defaultText("Last name cannot be Empty").build());
			status="failure";
		}
		
		
		
		if(userDetail.getPassword().isEmpty()|| (userDetail.getPassword().length()<6 && !userDetail.getPassword().isEmpty())){
			if(userDetail.getPassword().length()<6 && !userDetail.getPassword().isEmpty())
			{
				messageContext.addMessage(new MessageBuilder().error().source("password").defaultText(" It Should Be Minimum 6 Characters").build());
				status="failure";
			}
			else
			{
				messageContext.addMessage(new MessageBuilder().error().source("password").defaultText("	Password cannot be empty").build());
				status="failure";
			}
			
			
		}
		if(userDetail.getContactNo().isEmpty() || (userDetail.getContactNo().length()!=10 && !userDetail.getContactNo().isEmpty()) ){
			if(userDetail.getContactNo().length()!=10 && !userDetail.getContactNo().isEmpty() )
			{
				messageContext.addMessage(new MessageBuilder().error().source("contactNo").defaultText(" It Should be 10 digits").build());
				status="failure";
			}
			else
			{
				messageContext.addMessage(new MessageBuilder().error().source("contactNo").defaultText("Contact No cannot be empty").build());
				status="failure";
			}
			
		}
		
		return status;
	}
	
	public String duplicateUser(UserDetail userDetail, MessageContext messageContext)
	{
		
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
	
		public String addShippingAddress(ShippingAddress shippingAddress)
		{
			this.shippingAddress.setCity(shippingAddress.getCity());
			this.shippingAddress.setDistrict(shippingAddress.getDistrict());
			this.shippingAddress.setLandmark(shippingAddress.getLandmark());
			this.shippingAddress.setPinCode(shippingAddress.getPinCode());
			this.shippingAddress.setState(shippingAddress.getState());
			this.shippingAddress.setStreetAddress1(shippingAddress.getStreetAddress1());
			this.shippingAddress.setStreetAddress2(shippingAddress.getStreetAddress2());
			return "success";
		}
	
		public String addBillingAddress(BillingAddress billingAddress)
		{
			this.billingAddress.setCity(billingAddress.getCity());
			this.billingAddress.setDistrict(billingAddress.getDistrict());
			this.billingAddress.setLandmark(billingAddress.getLandmark());
			this.billingAddress.setPinCode(billingAddress.getPinCode());
			this.billingAddress.setState(billingAddress.getState());
			this.billingAddress.setStreetAddress1(billingAddress.getStreetAddress1());
			this.billingAddress.setStreetAddress2(billingAddress.getStreetAddress2());
			return "success";
		}
	

		 public String validateShippingDetails(ShippingAddress shippingAddress,MessageContext messageContext){
				String status = "success";
				
				if(shippingAddress.getStreetAddress1().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"streetAddress1").defaultText("please fill your address").build());
					status = "failure";
				}
				if(shippingAddress.getStreetAddress2().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"streetAddress2").defaultText("please fill your address").build());
					status = "failure";
				}
				if(shippingAddress.getCity().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"city").defaultText("please fill your city").build());
					status = "failure";
				}
				if(shippingAddress.getDistrict().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"District").defaultText("please fill your district").build());
					status = "failure";
				}
				if(shippingAddress.getPinCode().isEmpty()|| (shippingAddress.getPinCode().length()<6 && !shippingAddress.getPinCode().isEmpty())){
				if(shippingAddress.getPinCode().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"pinCode").defaultText("please fill your pin code").build());
					status = "failure";
				}
				else 
				{
					messageContext.addMessage(new MessageBuilder().error().source(
							"pinCode").defaultText("It should be 6 digits").build());
					status = "failure";
					
				}
			}
				
				if(shippingAddress.getLandmark().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"landmark").defaultText("please fill your landmark").build());
					status = "failure";
				}
				
				if(shippingAddress.getState().isEmpty()){
					messageContext.addMessage(new MessageBuilder().error().source(
							"state").defaultText("please fill your state").build());
					status = "failure";
				}
				return status;
			}

		
	public String addSupplierAddress(Supplier supplier)
	{
		this.supplier.setSupplierCity(supplier.getSupplierCity());
		this.supplier.setSupplierCompanyAddress1(supplier.getSupplierCompanyAddress1());
		this.supplier.setSupplierCompanyAddress2(supplier.getSupplierCompanyAddress2());
		this.supplier.setSupplierCompanyName(supplier.getSupplierCompanyName());
		this.supplier.setSupplierCompanyURL(supplier.getSupplierCompanyURL());
		this.supplier.setSupplierDistrict(supplier.getSupplierDistrict());
		this.supplier.setSupplierPinCode(supplier.getSupplierPinCode());
		this.supplier.setSupplierState(supplier.getSupplierState());

				return "success";
	}
	
	public String validateSupplierDetails(Supplier supplier,MessageContext messageContext){
		String status = "success";
		
		if(supplier.getSupplierCompanyName().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierCompanyName").defaultText("please provide your company name").build());
			status = "failure";
		}
		if(supplier.getSupplierCompanyAddress1().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierCompanyAddress1").defaultText("please provide your address").build());
			status = "failure";
		}
		if(supplier.getSupplierCompanyAddress2().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierCompanyAddress2").defaultText("please provide your address").build());
			status = "failure";
		}
		
		if(supplier.getSupplierCity().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierCity").defaultText("please provide your city").build());
			status = "failure";
		}
		if(supplier.getSupplierDistrict().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierDistrict").defaultText("please provide your district").build());
			status = "failure";
		}
		if(supplier.getSupplierPinCode().isEmpty()|| (supplier.getSupplierPinCode().length()<6 && !supplier.getSupplierPinCode().isEmpty())){
		if(supplier.getSupplierPinCode().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierPinCode").defaultText("please provide your pin code").build());
			status = "failure";
		}
		else
		{
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierPinCode").defaultText("It should be 6 digits").build());
			status = "failure";
		}
		}
		if(supplier.getSupplierState().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"supplierState").defaultText("please provide your state").build());
			status = "failure";
		}
		
		return status;
	}
	
	
		public String saveOrUpdateUser(UserDetail userDetail, ShippingAddress shippingAddress,BillingAddress billingAddress,MessageContext messageContext )
		{
			try
			{
			userService.saveOrUpdateUser(userDetail);
			userDetail.setUsername(userDetail.getUsername().trim());
			
			shippingAddress.setUserDetail(userDetail);
			userDetail.setShippingAddress(shippingAddress);
			this.shippingAddress.setUserDetail(userDetail);
			//this.userService.savOrUpdateUser(userDetail);
			
			billingAddress.setUserDetail(userDetail);
			userDetail.setBillingAddress(billingAddress);
			this.billingAddress.setUserDetail(userDetail);
			
			userService.addBillingAddress(billingAddress);
			userService.addShippingAddress(shippingAddress);
			
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(userDetail.getEmailId());
			email.setSubject("Welocme to ORGANIC SOUL");
			email.setText("Thank you for creating account at our website. Enjoy your shopping!!!\nUsername: "+userDetail.getUsername()+"\nPassword: "+userDetail.getPassword());
			
			mailSender.send(email);
			}
			catch (Exception e) {
				
				messageContext.addMessage(new MessageBuilder().error().build());
				return "failure";
			}
			
			return "success";
		}
	
	
	
	public String saveOrUpdateSupplier(UserDetail userDetail, Supplier supplier)
	{
		
		newSupplierService.saveOrUpdateSupplier(userDetail);
		supplier.setUserDetail(userDetail);
		userDetail.setSupplier(supplier);
		this.supplier.setUserDetail(userDetail);
		newSupplierService.addSupplierAddress(supplier);
		//newSupplierService.savOrUpdateSupplier(userDetail);
	
		return "success";
	}

}

