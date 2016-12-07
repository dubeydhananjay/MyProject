package com.webdesign.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.NotEmpty;

import com.google.gson.annotations.Expose;

//import org.springframework.beans.factory.annotation.Autowired;


@SuppressWarnings("serial")
@Entity
public class SubCategoryModel  implements Serializable
{
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Expose
	private int subCategoryId;
	@NotEmpty(message="SubCategory Name cannot be empty")
	@Expose
	private String subCategoryName;
	
	@Expose
	private int categoryId;
	
	
	@ManyToOne
    @JoinColumn(name ="categoryId" ,nullable=false,insertable=false, updatable=false)
	private Category category;
	
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL,mappedBy="subCategory")
	private Set<Product> product;
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
	
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set<Product> getProduct() {
		return product;
	}
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	

}
