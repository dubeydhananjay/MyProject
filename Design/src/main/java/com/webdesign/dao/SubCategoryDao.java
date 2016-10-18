package com.webdesign.dao;
import com.webdesign.model.SubCategoryModel;

public interface SubCategoryDao
{
	public void createSubCategory(SubCategoryModel subCategory);
	public String subCategoryList();
	public SubCategoryModel getById(int subCategoryId);
	public void delete(int subCategoryId);

}
