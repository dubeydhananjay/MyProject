package com.webdesign.dao;

import com.webdesign.model.Category;

import java.util.List;

public interface CategoryDao 
{
	public void createCategory(Category category);
	public List<Category> listCategory();
	public Category getById(int categoryId);

}
