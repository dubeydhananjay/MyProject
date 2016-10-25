package com.webdesign.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class ProductSpecification implements Serializable {
@Id
@Expose
private int productId;
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


@OneToOne
@JoinColumn(name="productId")
public Product product;

public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public int getProductId() {
	return productId;
}
public void setProductId(int productId) {
	this.productId = productId;
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

}
