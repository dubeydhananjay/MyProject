package com.webdesign.dao;

import com.webdesign.model.Category;

import java.util.List;

import javax.transaction.SystemException;

public interface CategoryDAO
{
	public boolean createCategory(Category category);
	public List<Category> listCategory();
	public Category getById(int categoryId);
	public String listCategories();
	public Category getByName(String categoryName) throws IllegalStateException, SystemException;
	public boolean delete(int categoryId);
	
}
