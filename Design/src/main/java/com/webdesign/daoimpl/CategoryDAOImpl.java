package com.webdesign.daoimpl;

import java.util.List;


import org.hibernate.HibernateException;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.dao.CategoryDAO;

import com.webdesign.model.Category;
@Repository
public class CategoryDAOImpl implements CategoryDAO
{
	private static final Logger logger =  LoggerFactory.getLogger(CategoryDAOImpl.class);
	
@Autowired
	private SessionFactory sessionFactory;

	public boolean createCategory(Category category) 
	{
		
		try
		{
			this.sessionFactory.getCurrentSession().saveOrUpdate(category);
			return true;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return false;
		}
		
	}

	public String listCategories() {
		
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=this.sessionFactory.getCurrentSession().createQuery("from Category").getResultList();
		//return categoryList;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(categoryList);
		return json;
	}

	public List<Category> listCategory() {
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=this.sessionFactory.getCurrentSession().createQuery("from Category").getResultList();
		return categoryList;
	}
	public Category getByName(String categoryName)
	{
		String query=" from Category where categoryName= '"+categoryName+"'";
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=this.sessionFactory.getCurrentSession().createQuery(query).getResultList();
	    if(categoryList!=null && !categoryList.isEmpty())
	    	return categoryList.get(0);
	    else return null;
	}
	public Category getById(int categoryId)
	{
		String editQuery="from Category where categoryId= "+categoryId;
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=this.sessionFactory.getCurrentSession().createQuery(editQuery).getResultList();
	    if(categoryList!=null && !categoryList.isEmpty())
	    	return categoryList.get(0);
	    else return null;
	
	}
	public boolean delete(int categoryId)
	{
		try
		{
			
			
		Category removeCategory = new Category();
		removeCategory.setCategoryId(categoryId);
		this.sessionFactory.getCurrentSession().delete(removeCategory);
		
		return true;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return false;
		}
		}
	
	
 
}
