package com.webdesign.model;
import javax.persistence.Id;


import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Product {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private int productId;
@NotEmpty(message="Product name cannot be empty") 
private String productName;
private int subCategoryId;
private int supplierId;
@Transient
private MultipartFile uploadFiles;



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
@JoinColumn(name ="supplierId" ,nullable=false,insertable=false, updatable=false)
Supplier supplier;

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

public int getSupplierId() {
	return supplierId;
}

public void setSupplierId(int supplierId) {
	this.supplierId = supplierId;
}

public SubCategoryModel getSubCategory() {
	return subCategory;
}

public void setSubCategory(SubCategoryModel subCategory) {
	this.subCategory = subCategory;
}

public Supplier getSupplier() {
	return supplier;
}

public void setSupplier(Supplier supplier) {
	this.supplier = supplier;
}


}
