package com.webdesign.daoimpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.webdesign.dao.ProductDAO;

import com.webdesign.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public void createProduct(Product product) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}

	public String listProduct() {
		@SuppressWarnings({  "unchecked" })
		List<Product> productList=this.sessionFactory.getCurrentSession().createQuery("from Product").getResultList();
		//return categoryList;
		Gson gson = new Gson();
		String json = gson.toJson( productList);
		return json;
		
	}

	public Product getById(int productId) {
		String editQuery="from Product where productId= "+productId;
		@SuppressWarnings({  "unchecked" })
		List<Product> productList=this.sessionFactory.getCurrentSession().createQuery(editQuery).getResultList();
	    if(productList!=null && !productList.isEmpty())
	    	return productList.get(0);
	    else return null;
	}

	public void delete(int productId) {
		Product  removeProduct  = new Product() ;
		removeProduct.setProductId(productId);
		this.sessionFactory.getCurrentSession().delete(removeProduct);
		
	}

}
