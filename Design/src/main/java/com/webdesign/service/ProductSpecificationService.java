package com.webdesign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.ProductSpecificationDAOImpl;
import com.webdesign.model.ProductSpecification;

@Service
@Transactional
public class ProductSpecificationService {
	@Autowired
	private ProductSpecificationDAOImpl productSpecificationDAOImpl;
	@Transactional
	public void createProductSpecifcation(ProductSpecification productSpecifcation)
	{
		this.productSpecificationDAOImpl.createProductSpecifcation(productSpecifcation);
	}
	@Transactional
	public List<ProductSpecification> listProductSpecification() 
	{
		return this.productSpecificationDAOImpl.listProductSpecification();
		 
	}
	@Transactional
	public String listProductSpecifications()
	{
		return this.productSpecificationDAOImpl.listProductSpecifications();
	}
}
