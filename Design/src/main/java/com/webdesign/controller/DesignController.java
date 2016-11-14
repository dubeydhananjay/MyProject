package com.webdesign.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webdesign.service.CategoryService;
import com.webdesign.service.ProductService;

@Controller
public class DesignController {
@Autowired
	private CategoryService categoryService;

@Autowired
private ProductService productService;


@RequestMapping(value={"/","home"})
	public String getHome(Model model) {
		model.addAttribute("categoriesList" ,this.categoryService.listCategory());
		model.addAttribute("productList",this.productService.listProduct());
		return "index";
	}
	
	@RequestMapping("/exception")
	public ModelAndView errorPage(Principal username)
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("exception");
		return model;
		
	}

}
