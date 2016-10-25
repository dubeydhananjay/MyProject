package com.webdesign.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@Entity
public class Cart implements Serializable{
	@Id
	private int cartId;
	private int userId;
	

	@OneToOne
	@JoinColumn(name ="userId" ,nullable=false,insertable=false, updatable=false)
	public User user;


	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	
}
