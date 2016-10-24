package com.webdesign.daoimpl;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson( productList);
		return json;
		
	}
	
	public List<Product> listProducts()
	{
		@SuppressWarnings({  "unchecked" })
		List<Product> productList=this.sessionFactory.getCurrentSession().createQuery("from Product").getResultList();
		return productList;
		
		
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

	public Product getByName(String productName)
	{
		String editQuery="from Product where productName= '"+productName+"'";
		@SuppressWarnings({  "unchecked" })
		List<Product> productsList=this.sessionFactory.getCurrentSession().createQuery(editQuery).getResultList();
	    if(productsList!=null && !productsList.isEmpty())
	    	return productsList.get(0);
	    else return null;
	}
}
