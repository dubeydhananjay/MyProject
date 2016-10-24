package com.webdesign.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.dao.ProductSpecificationDAO;

import com.webdesign.model.ProductSpecification;

@Repository
public class ProductSpecificationDAOImpl implements ProductSpecificationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void createProductSpecifcation(ProductSpecification productSpecifcation) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(productSpecifcation);
		
	}

	public List<ProductSpecification> listProductSpecification() {
		@SuppressWarnings("unchecked")
		List<ProductSpecification> productSpecificationList=this.sessionFactory.getCurrentSession().createQuery("from ProductSpecification").getResultList();
		return productSpecificationList;
	}
	public String listProductSpecifications()
	{
		@SuppressWarnings("unchecked")
		List<ProductSpecification> productSpecificationList=this.sessionFactory.getCurrentSession().createQuery("from ProductSpecification").getResultList();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(productSpecificationList);
		return json;
	}
	
	
}
