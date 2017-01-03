package com.webdesign.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.dao.SubCategoryDao;

import com.webdesign.model.SubCategoryModel;


@Repository
public class SubCategoryDAOImpl extends AbstractDaoImpl implements SubCategoryDao 
{
	@Autowired
	private SessionFactory sessionFactory;
	public void createSubCategory(SubCategoryModel subCategory) {
		
		getCurrentSession().saveOrUpdate(subCategory);
	}

	public String subCategoryList() {
		@SuppressWarnings({  "unchecked" })
		List<SubCategoryModel> listSubCategories=getCurrentSession().createQuery("from SubCategoryModel").getResultList();
		//return categoryList;
		Gson gs=new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String subcategoriesjson=gs.toJson(listSubCategories);
		return subcategoriesjson;
		
	}
	public List<SubCategoryModel> listSubCategory() {
		@SuppressWarnings({  "unchecked" })
		List<SubCategoryModel> subCategoryList=getCurrentSession().createQuery("from SubCategoryModel").getResultList();
		return subCategoryList;
		
	}
	public SubCategoryModel getByName(String subCategoryName)
	{
		String query=" from SubCategoryModel where subCategoryName= '"+subCategoryName+"'";
		@SuppressWarnings({  "unchecked" })
		List<SubCategoryModel> subCategoryList=getCurrentSession().createQuery(query).getResultList();
	    if(subCategoryList!=null && !subCategoryList.isEmpty())
	    	return subCategoryList.get(0);
	    else return null;
	}
	public SubCategoryModel getById(int subCategoryId)
	{
		String editQuery="from SubCategoryModel where subCategoryId= "+subCategoryId;
		@SuppressWarnings({  "unchecked" })
		List<SubCategoryModel> subCategoryList=getCurrentSession().createQuery(editQuery).getResultList();
	    if(subCategoryList!=null && !subCategoryList.isEmpty())
	    	return subCategoryList.get(0);
	    else return null;
	
	}
	public void delete(int subCategoryId)
	{
		SubCategoryModel removeSubCategory = new SubCategoryModel();
		removeSubCategory.setSubCategoryId(subCategoryId);
		getCurrentSession().delete(removeSubCategory);
	}
}

