package com.webdesign.daoimpl;

import java.util.Iterator;
import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.dao.CategoryDAO;

import com.webdesign.model.Category;
@Repository
public class CategoryDAOImpl extends AbstractDaoImpl implements CategoryDAO
{
	private static final Logger logger =  LoggerFactory.getLogger(CategoryDAOImpl.class);
	
@Autowired
	private SessionFactory sessionFactory;

	public boolean createCategory(Category category) 
	{
		
		try
		{
			getCurrentSession().saveOrUpdate(category);
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
		List<Category> categoryList=getCurrentSession().createQuery("from Category").getResultList();
		//return categoryList;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(categoryList);
		return json;
	}

	public List<Category> listCategory() {
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=getCurrentSession().createQuery("from Category").getResultList();
		return categoryList;
	}
	@SuppressWarnings({  "rawtypes", "unchecked", "deprecation" })
	public Category getByName(String categoryName) throws IllegalStateException, SystemException
	{
		Session session =getCurrentSession();
		Category category=null;
		Transaction tx=null;
		try
		{
			tx=(Transaction) session.beginTransaction();
			Criteria c=session.createCriteria(Category.class).add(Restrictions.eq("categoryName", categoryName));
			List cat = c.list();
			for(Iterator<Category> iterator = cat.iterator();iterator.hasNext(); )
			{
				category = iterator.next();
				
			}
			tx.commit();
		}
		catch(Exception he)
		{
			if(tx!=null) tx.rollback();
			he.printStackTrace();
		}
		finally
		{
			session.close();
			
		}
		return category;
		/*String query=" from Category where categoryName= '"+categoryName+"'";
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=this.sessionFactory.getCurrentSession().createQuery(query).getResultList();
	    if(categoryList!=null && !categoryList.isEmpty())
	    	return categoryList.get(0);
	    else return null;*/
	}
	public Category getById(int categoryId)
	{
		String editQuery="from Category where categoryId= "+categoryId;
		@SuppressWarnings({  "unchecked" })
		List<Category> categoryList=getCurrentSession().createQuery(editQuery).getResultList();
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
		getCurrentSession().delete(removeCategory);
		
		return true;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return false;
		}
		}
	
	
 
}
