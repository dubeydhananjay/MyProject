package com.webdesign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.ProductDAOImpl;
import com.webdesign.model.Product;
import com.webdesign.model.ProductView;


@Service
@Transactional
public class ProductService
{
	@Autowired
	private ProductDAOImpl productDAO;

	@Transactional
	public void createProduct(Product product)
	{
		productDAO.createProduct(product);
	}
@Transactional
   public String listProduct()
   {
	return this.productDAO.listProduct();
   }
@Transactional
public Product getById(int productId)
{
	return this.productDAO.getById(productId);
}
@Transactional
public void delete(int productId)
{
	productDAO.delete(productId);
}
@Transactional
public Product getByName(String productName)
{
	return this.productDAO.getByName(productName);
}
@Transactional
public List<Product> listProducts()
{
	return this.productDAO.listProducts();
}

@Transactional
public List<ProductView> listProductView()
{
	return this.productDAO.listProductView();
}

@Transactional
public String productViewList()
{
	return this.productDAO.productViewList();
}

@Transactional
public ProductView getProductViewById(int productId)
{
	return this.productDAO.getProductViewById(productId);
}

@Transactional
public void productSubtract(int productId)
{
	this.productDAO.productSubtract(productId);
}

@Transactional
public void productAdd(int productId)
{
	this.productDAO.productAdd(productId);
}

@Transactional
public String likeProducts()
{
	return productDAO.likeProducts();
	
}

}

