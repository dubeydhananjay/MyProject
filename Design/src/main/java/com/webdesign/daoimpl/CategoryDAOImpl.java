package com.webdesign.daoimpl;

import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webdesign.dao.CategoryDao;
import com.webdesign.model.Category;
@Repository
public class CategoryDAOImpl implements CategoryDao
{
	
@Autowired
	private SessionFactory sessionFactory;
 
	public void createCategory(Category category) 
	{
		
		sessionFactory.getCurrentSession().saveOrUpdate(category);
		
	}

	public String listCategories() {
		
		return null;
	}
	

}
