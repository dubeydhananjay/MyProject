package com.webdesign.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CartItem {
	@Id
	private int cartId;
	private int productId;
	private int userId;
	private boolean flag;
	
	@ManyToOne
	@JoinColumn(name="cartId",nullable=false,insertable=false, updatable=false)
	private Cart cart;
	
	@ManyToOne
	@JoinColumn(name="productId" ,nullable=false,insertable=false, updatable=false)
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="userId" ,nullable=false,insertable=false, updatable=false)
	private UserDetail userDetail;
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	

}
