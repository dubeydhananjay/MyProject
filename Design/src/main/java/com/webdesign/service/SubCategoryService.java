package com.webdesign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.webdesign.daoimpl.SubCategoryDAOImpl;

import com.webdesign.model.SubCategoryModel;
@Service
@Transactional
public class SubCategoryService
{
	@Autowired
	private SubCategoryDAOImpl subCategoryDAO;

	@Transactional
	public void createSubCategory(SubCategoryModel subCategory)
	{
		this.subCategoryDAO.createSubCategory(subCategory);
	}
@Transactional
   public String subCategoryList()
   {
	return this.subCategoryDAO.subCategoryList();
   }

@Transactional
public List<SubCategoryModel> listSubCategory()
{
	return this.subCategoryDAO.listSubCategory();
}
@Transactional
public SubCategoryModel getByName(String subCategoryName)
{
	return this.subCategoryDAO.getByName(subCategoryName);
}
@Transactional
public SubCategoryModel getById(int subCategoryId)
{
	return this.subCategoryDAO.getById(subCategoryId);
}
@Transactional
public void delete(int subCategoryId)
{
	subCategoryDAO.delete(subCategoryId);
}

}
