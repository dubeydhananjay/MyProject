package com.webdesign.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


import org.hibernate.validator.constraints.NotEmpty;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class Category implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Expose
	private int categoryId;
	@NotEmpty(message="Category Name is Required")
	
	@Expose
	private String categoryName;
	@NotEmpty(message="Category Description is Required")
	@Expose
	private String categoryDescription;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy="category", cascade=CascadeType.ALL)
	private Set<SubCategoryModel> subCategory;
	 
	public Set<SubCategoryModel> getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(Set<SubCategoryModel> subCategory) {
		this.subCategory = subCategory;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
		}
