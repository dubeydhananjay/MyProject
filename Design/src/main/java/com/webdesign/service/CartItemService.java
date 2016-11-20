package com.webdesign.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.CartIemDAOImpl;
import com.webdesign.model.CartItem;

@Service
@Transactional
public class CartItemService {
	
	@Autowired
	private CartIemDAOImpl cartIemDAOImpl;
@Transactional	
public void addToBuyNow(CartItem cartItem)
{
	this.cartIemDAOImpl.addToBuyNow(cartItem);
}


@Transactional
public CartItem getByCartItemId(int cartItemId)
{
	return this.cartIemDAOImpl.getByCartItemId(cartItemId);
	
}

@Transactional
public void delete(int cartItemId)
{
	this.cartIemDAOImpl.delete(cartItemId);
}

@Transactional
public void setFlag(int cartItemId)
{
	this.cartIemDAOImpl.setFlag(cartItemId);
}
}
