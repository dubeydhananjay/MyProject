package com.webdesign.controller;

import org.springframework.stereotype.Controller;


//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.model.Category;
import com.webdesign.service.CategoryService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
//import javax.enterprise.inject.Model;
import org.springframework.validation.annotation.Validated;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class CategoryController
{
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping( "/categories")
	public String listCategories(Model model) {
		
		model.addAttribute("categories", new Category());
		model.addAttribute("categoriesList", this.categoryService.listCategories());
		model.addAttribute("listCategories", this.categoryService.listCategory());
		return "categories";
	}
	@RequestMapping("/category")
	
	public String addcategory(@Validated @ModelAttribute("categories") Category category, BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
			model.addAttribute("categoriesList", this.categoryService.listCategories());
			return "/categories";
		}
		else
		{
		categoryService.createCategory(category);
		return "redirect:/categories";
		}
	}
	@RequestMapping("/editCategory-{categoryId}")
	public String editCategory(Model model,@PathVariable("categoryId") int categoryId)
	{
		model.addAttribute("categoriesList", this.categoryService.listCategories());
		model.addAttribute("categories", this.categoryService.getById(categoryId));
		return "categories";
	}
	@RequestMapping("/deleteCategory-{categoryId}")
	public String deleteCategory(@PathVariable("categoryId") int categoryId, Model model)
	{
		
		this.categoryService.delete(categoryId);
		return "redirect:/categories";
	}

}
