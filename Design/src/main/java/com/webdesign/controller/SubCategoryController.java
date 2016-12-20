package com.webdesign.controller;

import javax.transaction.SystemException;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webdesign.model.Category;
//import com.webdesign.daoimpl.CategoryDAOImpl;
//import com.webdesign.model.Category;
import com.webdesign.model.SubCategoryModel;
import com.webdesign.service.CategoryService;
import com.webdesign.service.SubCategoryService;

@Controller
public class SubCategoryController 
{

	@Autowired
	private SubCategoryService subCategoryService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping( "/subCategories")
	public String listSubCategories(Model model) {
		
		model.addAttribute("subCategory", new SubCategoryModel());
		model.addAttribute("categoryList", this.categoryService.listCategory());
		model.addAttribute("subCategoriesList", this.subCategoryService.subCategoryList());
		return "subCategories";
	}
@RequestMapping("/addsubCategory")
	
	public String addSubCategory(@Validated @ModelAttribute("subCategory") SubCategoryModel subCategory, BindingResult result, Model model) throws IllegalStateException, SystemException
	{
	if(result.hasErrors())
	{
		model.addAttribute("categoryList", this.categoryService.listCategory());
		model.addAttribute("subCategoriesList", this.subCategoryService.subCategoryList());
		return "/subCategories";
	}
	else
	{
		categoryService.getByName(subCategory.getCategory().getCategoryName());
		Category category=categoryService.getByName(subCategory.getCategory().getCategoryName());
		categoryService.createCategory(category);
		subCategory.setCategory(category);
		subCategory.setCategoryId(category.getCategoryId());
		this.subCategoryService.createSubCategory(subCategory);
		return "redirect:/subCategories";
	}
	
	}
@RequestMapping(value="/editSubCategory-{subCategoryId}", method=RequestMethod.GET)
public String editSubCategory(Model model,@PathVariable("subCategoryId") int subCategoryId)
{
	model.addAttribute("categoryList", this.categoryService.listCategory());
	model.addAttribute("subCategoriesList", this.subCategoryService.subCategoryList());
	model.addAttribute("subCategories", this.subCategoryService.getById(subCategoryId));
	return "subCategories";
}
@RequestMapping(value="/deleteSubCategory-{subCategoryId}", method=RequestMethod.GET)
public String deleteSubCategory(@PathVariable("subCategoryId") int subCategoryId)
{
	this.subCategoryService.delete(subCategoryId);
	return "redirect:/subCategories";
}

}

