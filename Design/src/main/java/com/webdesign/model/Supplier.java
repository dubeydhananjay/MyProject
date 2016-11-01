package com.webdesign.model;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@SuppressWarnings("serial")
@Entity
public class Supplier implements Serializable 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int supplierAddressId;
	private String supplierCompanyName;
	private String supplierCompanyURL;
	private String supplierCompanyAddress1;
	private String supplierCompanyAddress2;
	
	private String supplierCity;
	private String supplierDistrict;
	private String supplierPinCode;
	private String supplierState;
    
	@ManyToOne
	public UserDetail userDetail;
	
	public UserDetail getUserDetail() {
		return userDetail;
	}
	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}
	public int getSupplierAddressId() {
		return supplierAddressId;
	}
	public void setSupplierAddressId(int supplierAddressId) {
		this.supplierAddressId = supplierAddressId;
	}
	public String getSupplierCompanyName() {
		return supplierCompanyName;
	}
	public void setSupplierCompanyName(String supplierCompanyName) {
		this.supplierCompanyName = supplierCompanyName;
	}
	public String getSupplierCompanyURL() {
		return supplierCompanyURL;
	}
	public void setSupplierCompanyURL(String supplierCompanyURL) {
		this.supplierCompanyURL = supplierCompanyURL;
	}
	public String getSupplierCompanyAddress1() {
		return supplierCompanyAddress1;
	}
	public void setSupplierCompanyAddress1(String supplierCompanyAddress1) {
		this.supplierCompanyAddress1 = supplierCompanyAddress1;
	}
	public String getSupplierCompanyAddress2() {
		return supplierCompanyAddress2;
	}
	public void setSupplierCompanyAddress2(String supplierCompanyAddress2) {
		this.supplierCompanyAddress2 = supplierCompanyAddress2;
	}
	
	public String getSupplierCity() {
		return supplierCity;
	}
	public void setSupplierCity(String supplierCity) {
		this.supplierCity = supplierCity;
	}
	public String getSupplierDistrict() {
		return supplierDistrict;
	}
	public void setSupplierDistrict(String supplierDistrict) {
		this.supplierDistrict = supplierDistrict;
	}
	public String getSupplierPinCode() {
		return supplierPinCode;
	}
	public void setSupplierPinCode(String supplierPinCode) {
		this.supplierPinCode = supplierPinCode;
	}
	public String getSupplierState() {
		return supplierState;
	}
	public void setSupplierState(String supplierState) {
		this.supplierState = supplierState;
	}
	
	
}
