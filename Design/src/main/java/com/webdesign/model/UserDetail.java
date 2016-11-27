package com.webdesign.model;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.annotations.Expose;
@SuppressWarnings("serial")
@Entity
public class UserDetail implements Serializable{

	@Id
	private int userId;
	@Expose
	private String username;
	@Expose
	private String firstname;
	@Expose
	private String lastname;
	@Expose
	private String password;
	@Expose
	private String contactNo;
	@Expose
	private String alternateContactNo;
	@Expose
	private String emailId;
	@Expose
	private int roleId;
	@Expose
	private int cartId;
	@Transient
	private MultipartFile uploadFiles;
	
	
	@OneToOne
	@JoinColumn(name ="shippingAddressId")
	public ShippingAddress shippingAddress;
	
	@OneToOne
	@JoinColumn(name ="billingAddressId")
	public BillingAddress billingAddress;
	
	
	
	@OneToOne
	@JoinColumn(name ="cartId" ,nullable=false,insertable=false, updatable=false)
	public Cart cart;
	
	@OneToOne
	@JoinColumn(name ="userId" ,nullable=false,insertable=false, updatable=false)
	private User user;

	@OneToOne
	@JoinColumn(name ="userId" ,nullable=false,insertable=false, updatable=false)
	private UserRole userRole;
	
	@OneToOne
	@JoinColumn(name="supplierAddressId")
	public Supplier supplier;

	
	public MultipartFile getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(MultipartFile uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getAlternateContactNo() {
		return alternateContactNo;
	}

	public void setAlternateContactNo(String alternateContactNo) {
		this.alternateContactNo = alternateContactNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public BillingAddress getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(BillingAddress billingAddress) {
		this.billingAddress = billingAddress;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	
}
