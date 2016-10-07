package com.webdesign.service;

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
	

}
