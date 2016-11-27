package com.webdesign.controller;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.model.SubCategoryModel;
import com.webdesign.model.UserDetail;
import com.webdesign.service.CategoryService;
import com.webdesign.service.ProductService;
import com.webdesign.service.SubCategoryService;
import com.webdesign.service.UserService;

@Controller
public class DesignController {
@Autowired
	private CategoryService categoryService;

@Autowired
private ProductService productService;
@Autowired
private SubCategoryService subCategoryService;
@Autowired
private UserService userService;


@RequestMapping(value={"/","home"})
	public String getHome(Model model) {
		model.addAttribute("categoriesList" ,this.categoryService.listCategory());
		model.addAttribute("productList",this.productService.listProduct());
		model.addAttribute("subCategoriesList", this.subCategoryService.subCategoryList());
		model.addAttribute("productViewList", this.productService.productViewList());
		return "index";
	}
	
	@RequestMapping("/exception")
	public ModelAndView errorPage(Principal username)
	{
		ModelAndView model=new ModelAndView();
		model.setViewName("exception");
		return model;
		
	}
	
	@RequestMapping("/userprofile")
	public ModelAndView getPages(String username, @ModelAttribute("userDetail")UserDetail userDetail){

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		username=authentication.getName();
		ModelAndView model = new ModelAndView("userprofile");
		UserDetail newuserDetail = this.userService.getByName(username);
		Gson pGson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String pJson = pGson.toJson(newuserDetail);
		
		model.addObject("listUser",pJson);
		/*String path="C://Users//Dhananjay//Documents//Eclipse_Proj//Design//src//main//webapp//resources//image";
		
        path=path+String.valueOf("//"+userDetail.getUsername()+".jpg");
        MultipartFile file=newuserDetail.getUploadFiles();
        File imageFile = new File(path);
		if (!file.isEmpty()) 
        {
			try
                {
                	
                	byte[] bytes = file.getBytes();
                	FileOutputStream fileOutputStream = new FileOutputStream(imageFile);
    				BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
    				bufferedOutputStream.write(bytes);
    				bufferedOutputStream.close();
                    
                     } catch (IOException e) 
                {
                    e.printStackTrace();
                }
         }
		else System.out.println("no file");

*/		
		
		
		
				return model;

	}
	@RequestMapping(value="/getTags", method=RequestMethod.GET)
	public @ResponseBody String getTags(@RequestParam String subCategoryName) {

		return simulateSearchResult(subCategoryName);

	}

	private String simulateSearchResult(String subCategoryName) {

		List<SubCategoryModel> result = new ArrayList<SubCategoryModel>();
		List<SubCategoryModel> data = subCategoryService.listSubCategory();
		Gson pGson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String pJson = null;
		// iterate a list and filter by tagName
		for (SubCategoryModel subCategory : data) {
			if (subCategory.getSubCategoryName().contains(subCategoryName)) {
				
				result.add(subCategory);
				
			}
		}
		pJson=pGson.toJson(result);
		
		return pJson;
	}



}
