package com.webdesign.controller;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.webdesign.model.UserDetail;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.model.Product;
import com.webdesign.model.ProductView;
import com.webdesign.model.SubCategoryModel;
import com.webdesign.service.CategoryService;
import com.webdesign.service.NewSupplierService;
import com.webdesign.service.ProductService;

import com.webdesign.service.SubCategoryService;


@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SubCategoryService subCategoryService;
	@Autowired
	private NewSupplierService newSupplierService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping( "/products")
	public String listProducts(Model model) {
		model.addAttribute("products", new Product());
		model.addAttribute("subCategoryList",subCategoryService.listSubCategory());
		
		model.addAttribute("listSupplier",this.newSupplierService.listSupplier());
		model.addAttribute("productsList", this.productService.listProduct());
		return "products";
	}
	
	@RequestMapping("/product")

	public String addcategory(@Validated @ModelAttribute("products") Product product, BindingResult result, Model model, MultipartFile file) throws  IOException
	{
		if(result.hasErrors())
		{
			//model.addAttribute("listProductSpecifications",this.productSpecificationService.listProductSpecifications());
			model.addAttribute("subCategoryList",subCategoryService.listSubCategory());
			model.addAttribute("listSupplier",this.newSupplierService.listSupplier());
			model.addAttribute("productsList", this.productService.listProduct());
			return "/products";
		}
		else
		{
		//subCategoryController.addSubCategory(subCategory);
		SubCategoryModel subCategory=subCategoryService.getByName(product.getSubCategory().getSubCategoryName());
		subCategoryService.createSubCategory(subCategory);
		product.setSubCategory(subCategory);
		product.setSubCategoryId(subCategory.getSubCategoryId());
		
		UserDetail userDetail=newSupplierService.getByName(product.getUserDetail().getUsername());
		newSupplierService.saveOrUpdateSupplier(userDetail);
		product.setUserDetail(userDetail);
		product.setUserId(userDetail.getUserId());
		
		Date date = new Date();
		product.setProductDate(date);
		productService.createProduct(product);
		
		String path="C://Users//Dhananjay//Documents//Eclipse_Proj//Design//src//main//webapp//resources//image";
		file=product.getUploadFiles();
        path=path+String.valueOf("//"+product.getProductId()+".jpg");
        File imageFile = new File(path);
		if ( !file.isEmpty()) 
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
		
		return "redirect:/products";
		}
			
	}
	@RequestMapping(value="/editProduct-{productId}", method=RequestMethod.GET)
	public String editProduct(Model model,@PathVariable("productId") int productId)
	{
		
		model.addAttribute("subCategoryList",subCategoryService.listSubCategory());
		model.addAttribute("listSupplier",this.newSupplierService.listSupplier());
		
		model.addAttribute("productsList", this.productService.listProduct());
		model.addAttribute("products", this.productService.getById(productId));
		return "products";
	}
	@RequestMapping(value="/deleteProduct-{productId}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId") int productId)
	{
		this.productService.delete(productId);
		return "redirect:/products";
	}
	

	@RequestMapping("/viewproduct-{productId}-product")
	public ModelAndView productData(@ModelAttribute("product") @PathVariable("productId")  int productId, ProductView productView) {
		Gson pGson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		productView=productService.getProductViewById(productId);
		String pJson=pGson.toJson(productView);
		
		ModelAndView model = new ModelAndView("viewproduct");
		model.addObject("productView", pJson);
		
		return model;
		
	}
	
	@RequestMapping("/allproducts")
	public ModelAndView allProductData(@ModelAttribute("product") ProductView productView) {
		
		ModelAndView model = new ModelAndView("allproducts");
		model.addObject("productViewList", this.productService.productViewList());
		model.addObject("listCategories", this.categoryService.listCategory());
		model.addObject("listSubCategories", this.subCategoryService.listSubCategory());
		model.addObject("subCategoriesList", this.subCategoryService.subCategoryList());
		return model;
		
	} 


}
