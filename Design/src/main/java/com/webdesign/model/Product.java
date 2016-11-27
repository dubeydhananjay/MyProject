package com.webdesign.model;
import javax.persistence.Id;




import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.annotations.Expose;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@SuppressWarnings("serial")
@Entity
public class Product implements Serializable {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
@Expose
private int productId;
@NotEmpty(message="Product name cannot be empty")
@Expose
private String productName;
@Expose
private int subCategoryId;
@Expose
private int userId;
@Transient
private MultipartFile uploadFiles;
@Expose
private String productWeight;
@Expose
private String productSize;
@Expose
private String aromaType;
@Expose
private String soapType;
@Expose
private String skintype;
@Expose
private String organic;
@Expose
private int productPrice;
@Expose
private int productQuantity;
@Expose
private Date productDate;


public int getProductQuantity() {
	return productQuantity;
}

public void setProductQuantity(int productQuantity) {
	this.productQuantity = productQuantity;
}

public Date getProductDate() {
	return productDate;
}

public void setProductDate(Date productDate) {
	this.productDate = productDate;
}

public int getProductPrice() {
	return productPrice;
}

public void setProductPrice(int productPrice) {
	this.productPrice = productPrice;
}

public String getProductWeight() {
	return productWeight;
}

public void setProductWeight(String productWeight) {
	this.productWeight = productWeight;
}

public String getProductSize() {
	return productSize;
}

public void setProductSize(String productSize) {
	this.productSize = productSize;
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

public String getOrganic() {
	return organic;
}

public void setOrganic(String organic) {
	this.organic = organic;
}

public MultipartFile getUploadFiles() {
	return uploadFiles;
}

public void setUploadFiles(MultipartFile uploadFiles) {
	this.uploadFiles = uploadFiles;
}

@ManyToOne
@JoinColumn(name ="subCategoryId" ,nullable=false,insertable=false, updatable=false)
SubCategoryModel subCategory;

@ManyToOne
@JoinColumn(name ="userId" ,nullable=false,insertable=false, updatable=false)
public UserDetail userDetail;

public UserDetail getUserDetail() {
	return userDetail;
}

public void setUserDetail(UserDetail userDetail) {
	this.userDetail = userDetail;
}

public int getProductId() {
	return productId;
}

public void setProductId(int productId) {
	this.productId = productId;
}

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}

public int getSubCategoryId() {
	return subCategoryId;
}

public void setSubCategoryId(int subCategoryId) {
	this.subCategoryId = subCategoryId;
}



public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public SubCategoryModel getSubCategory() {
	return subCategory;
}

public void setSubCategory(SubCategoryModel subCategory) {
	this.subCategory = subCategory;
}


}
