package com.webdesign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.UserDAOImpl;
import com.webdesign.model.BillingAddress;
import com.webdesign.model.ShippingAddress;
import com.webdesign.model.UserDetail;


@Service
@Transactional
public class UserService {
	@Autowired
private UserDAOImpl  userDAOImpl;
@Transactional
public void saveOrUpdateUser(UserDetail userDetail)
{
	userDAOImpl.saveOrUpdateUser(userDetail);
}
@Transactional
public List<UserDetail> userDetailList() 
{
	return this.userDAOImpl.userDetailList();
}
@Transactional
public void addShippingAddress(ShippingAddress shippingAddress)
{
	 this.userDAOImpl.addShippingAddress(shippingAddress);
}
@Transactional
public void addBillingAddress(BillingAddress billingAddress)
{
	this.userDAOImpl.addBillingAddress(billingAddress);
}

@Transactional
public void saveOrUpdateAdmin(UserDetail userDetail)
{
	this.userDAOImpl.saveOrUpdateAdmin(userDetail);
	
}

@Transactional
public UserDetail getByName(String username)
{
	return this.userDAOImpl.getByName(username);
}

@Transactional
public ShippingAddress getShippingAddressById(int userId)
{
	return this.userDAOImpl.getShippingAddressById(userId);
}

@Transactional
public BillingAddress getBillingAddressById(int userId)
{
	return this.userDAOImpl.getBillingAddressById(userId);
}
}
