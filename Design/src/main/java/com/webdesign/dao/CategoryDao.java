package com.webdesign.dao;

import com.webdesign.model.Category;

public interface CategoryDao 
{
	public void createCategory(Category category);
	public String listCategories();

}
