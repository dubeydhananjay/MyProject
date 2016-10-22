package com.webdesign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webdesign.service.CategoryService;

@Controller
public class DesignController {
@Autowired
	private CategoryService categoryService;
	@RequestMapping(value={"/","home"})
	public String getHome(Model model) {
		model.addAttribute("categoriesList" ,this.categoryService.listCategory());
		return "index";
	}

}
