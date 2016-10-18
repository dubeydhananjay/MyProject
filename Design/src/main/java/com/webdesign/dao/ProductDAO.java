package com.webdesign.dao;

import com.webdesign.model.Product;


public interface ProductDAO {
	public void createProduct(Product product);
	public String listProduct();
	public Product getById(int productId);
	public void delete(int productId);

}
