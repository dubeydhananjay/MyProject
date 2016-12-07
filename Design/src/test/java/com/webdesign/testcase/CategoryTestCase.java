package com.webdesign.testcase;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.webdesign.daoimpl.CategoryDAOImpl;
import com.webdesign.model.Category;
import com.webdesign.service.CategoryService;

public class CategoryTestCase {
	
	@Autowired
	static AnnotationConfigApplicationContext  context;
	
	@Autowired
	 static Category category;
	
	@Autowired
	static CategoryDAOImpl categoryDAOImpl;
		
	@Autowired
	CategoryService categoryService;
	
	@BeforeClass
	public static void init()
	{
		context = new AnnotationConfigApplicationContext("src//main//webapp//WEB_INF//application-context.xml");
		context.scan("com.webdesign");
		//context.refresh();
		
		 categoryDAOImpl =(CategoryDAOImpl) context.getBean("categoryDAOImpl"); 
		
		 category =  (Category) context.getBean("category");
	}
	
	@Test
	public void createCategoryTestCase()
	{
		category.setCategoryId(category.getCategoryId());
		category.setCategoryName("Acne and Pimples");
		category.setCategoryDescription("Acne and Pimples");
		
		boolean status=categoryDAOImpl.createCategory(category);
		Assert.assertEquals("create category test case", true, status);
	}
	
	
	@Test
	public void deleteCategoryTestCase()
	{
		
		Boolean status=categoryDAOImpl.delete(category.getCategoryId());
		Assert.assertEquals("delete category test case", true, status);
	}
	
	@Test
	public void listCategoriesTestCase()
	{
		List<Category> listCategory = categoryService.listCategory();
		for(Category c:listCategory)
		{
			Assert.assertEquals(c.getCategoryId(),category.getCategoryId());
			Assert.assertEquals(c.getCategoryName(), category.getCategoryName());
			Assert.assertEquals(c.getCategoryDescription(), category.getCategoryDescription());
		}
	}
	
	@Test
	public void getByIdTestCase()
	{
		Category newcategory = categoryService.getById(category.getCategoryId());
		Assert.assertEquals(newcategory.getCategoryName(), category.getCategoryName());
		Assert.assertEquals(newcategory.getCategoryDescription(), category.getCategoryDescription());
	}
	
	
	
	
}
