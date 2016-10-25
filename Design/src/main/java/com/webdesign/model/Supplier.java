package com.webdesign.model;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;

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
	private int supplierId;
	@NotEmpty(message="Supplier Name cannot be empty")
    private String supplierName;
	@NotEmpty(message="Supplier Address cannot be empty")
	private String supplierAddress;
	
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierAddress() {
		return supplierAddress;
	}
	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}
    
}
