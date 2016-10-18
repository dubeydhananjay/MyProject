package com.webdesign.daoimpl;

import java.util.List;


/*import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Session;*/
//import org.h2.engine.Session;
import org.hibernate.SessionFactory;
//import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.webdesign.dao.CategoryDao;
import com.webdesign.model.Category;
@Repository
public class CategoryDAOImpl implements CategoryDao
{
	
@Autowired
	private SessionFactory sessionFactory;
//private static final Logger logger = LoggerFactory.getLogger(CategoryDAOImpl.class);

 
	public void createCategory(Category category) 
	{
		
	sessionFactory.getCurrentSession().saveOrUpdate(category);
		
	}

	public String listCategories() {
		
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=this.sessionFactory.getCurrentSession().createQuery("from Category").getResultList();
		//return categoryList;
		Gson gson = new Gson();
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
	public void delete(int categoryId)
	{
		Category removeCategory = new Category();
		removeCategory.setCategoryId(categoryId);
		this.sessionFactory.getCurrentSession().delete(removeCategory);
	}
 
}
