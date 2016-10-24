package com.webdesign.dao;

import java.util.List;

import com.webdesign.model.ProductSpecification;



public interface ProductSpecificationDAO {
	public void createProductSpecifcation(ProductSpecification productSpecifcation);
	public List<ProductSpecification> listProductSpecification();

}
