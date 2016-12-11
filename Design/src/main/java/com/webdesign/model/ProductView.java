package com.webdesign.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.google.gson.annotations.Expose;

@Entity
public class ProductView {
	@Id
	@Expose
	private int productId;
	@Expose
	private int userId;
	@Expose
	private int supplierAddressId;
	@Expose
	private String productName;
	@Expose
	private String categoryName;
	@Expose
	private String subCategoryName;
	@Expose
	private String productWeight;
	@Expose
	private String organic;
	@Expose
	private String productSize;
	@Expose
	private String aromaType;
	@Expose
	private String soapType;
	@Expose
	private String skintype;
	@Expose
	private int productQuantity;

	
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public String getAromaType() {
		return aromaType;
	}
	public void setAromaType(String aromaType) {
		this.aromaType = aromaType;
	}
	public String getSoapType() {
		return soapType;
	}
	public void setSoapType(String soapType) {
		this.soapType = soapType;
	}
	public String getSkintype() {
		return skintype;
	}
	public void setSkintype(String skintype) {
		this.skintype = skintype;
	}
	@Expose
	private String username;
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
	public int getSupplierAddressId() {
		return supplierAddressId;
	}
	public void setSupplierAddressId(int supplierAddressId) {
		this.supplierAddressId = supplierAddressId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	public String getProductWeight() {
		return productWeight;
	}
	public void setProductWeight(String productWeight) {
		this.productWeight = productWeight;
	}
	public String getOrganic() {
		return organic;
	}
	public void setOrganic(String organic) {
		this.organic = organic;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSupplierCompanyName() {
		return supplierCompanyName;
	}
	public void setSupplierCompanyName(String supplierCompanyName) {
		this.supplierCompanyName = supplierCompanyName;
	}
	private String supplierCompanyName;

}
