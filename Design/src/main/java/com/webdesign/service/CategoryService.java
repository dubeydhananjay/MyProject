package com.webdesign.service;

import java.util.List;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.CategoryDAOImpl;
import com.webdesign.model.Category;

@Service
@Transactional
public class CategoryService
{
	@Autowired
	private CategoryDAOImpl categoryDAO;

	@Transactional
	public void createCategory(Category category)
	{
		categoryDAO.createCategory(category);
	}
@Transactional
   public String listCategories()
   {
	return this.categoryDAO.listCategories();
   }
@Transactional
public List<Category> listCategory()
{
	return this.categoryDAO.listCategory();
}
@Transactional
public Category getByName(String categoryName)
{
	return this.categoryDAO.getByName(categoryName);
}
@Transactional
public Category getById(int categoryId)
{
	return this.categoryDAO.getById(categoryId);
}
@Transactional
public void delete(int categoryId)
{
	categoryDAO.delete(categoryId);
}
}
