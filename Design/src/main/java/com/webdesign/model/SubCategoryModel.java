package com.webdesign.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;

//import org.springframework.beans.factory.annotation.Autowired;


@Entity
public class SubCategoryModel 
{
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int subCategoryId;
	@NotEmpty(message="SubCategory Name cannot be empty")
	private String subCategoryName;
	@NotEmpty(message="SubCategory Name cannot be empty")
	private String subCategoryPrice;
	private int categoryId;
	
	@ManyToOne
    @JoinColumn(name ="categoryId" ,nullable=false,insertable=false, updatable=false)
	private Category category;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	public String getSubCategoryPrice() {
		return subCategoryPrice;
	}
	
	
	public void setSubCategoryPrice(String subCategoryPrice) {
		this.subCategoryPrice = subCategoryPrice;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	

}
