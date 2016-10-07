package com.webdesign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webdesign.model.Category;
import com.webdesign.service.CategoryService;
import org.springframework.ui.Model;
//import javax.enterprise.inject.Model;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class CategoryController
{
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value="/categories", method = RequestMethod.GET)
	public String categories(Model model)
	{
		
		
		model.addAttribute("categories", new Category()); 
		return "categories";
	}
	@RequestMapping("/add/categories")
	
	public String addcategory(@ModelAttribute("categories") Category category)
	{
		
		categoryService.createCategory(category);
		return "redirect:/categories";
	}

}
//@ModelAttribute("categories") Category category