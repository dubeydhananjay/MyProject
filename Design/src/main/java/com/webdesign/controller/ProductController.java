package com.webdesign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webdesign.model.Supplier;
import com.webdesign.model.Product;
import com.webdesign.model.SubCategoryModel;

import com.webdesign.service.ProductService;
import com.webdesign.service.SubCategoryService;
import com.webdesign.service.SupplierService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private SupplierService supplierService;
	/*@Autowired
	private SubCategoryController subCategoryController;*/
	@Autowired
	private SubCategoryService subCategoryService;
	
	@RequestMapping( "/products")
	public String listProducts(Model model) {
		model.addAttribute("products", new Product());
		model.addAttribute("subCategoryList",subCategoryService.listSubCategory());
		
		model.addAttribute("supplierList", supplierService.listSuppliers());
		model.addAttribute("productsList", this.productService.listProduct());
		return "products";
	}
	@RequestMapping("/product")
	
	public String addcategory(@Validated @ModelAttribute("products") Product product, BindingResult result, Model model )
	{
		if(result.hasErrors())
		{
			model.addAttribute("subCategoryList",subCategoryService.listSubCategory());
			model.addAttribute("supplierList", supplierService.listSuppliers());
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
		
		
		Supplier supplier=supplierService.getByName(product.getSupplier().getSupplierName());
		supplierService.createSupplier(supplier);
		product.setSupplier(supplier);
		product.setSupplierId(supplier.getSupplierId());
		
		productService.createProduct(product);
		return "redirect:/products";
	}
	}
	@RequestMapping(value="/editProduct-{productId}", method=RequestMethod.GET)
	public String editProduct(Model model,@PathVariable("productId") int productId)
	{
		
		model.addAttribute("subCategoryList",subCategoryService.listSubCategory());
		
		model.addAttribute("supplierList", supplierService.listSuppliers());
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
}
