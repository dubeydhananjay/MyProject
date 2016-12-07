package com.webdesign.dao;

import com.webdesign.model.Category;

import java.util.List;

public interface CategoryDAO
{
	public boolean createCategory(Category category);
	public List<Category> listCategory();
	public Category getById(int categoryId);
	public String listCategories();
	public Category getByName(String categoryName);
	public boolean delete(int categoryId);
	
}
