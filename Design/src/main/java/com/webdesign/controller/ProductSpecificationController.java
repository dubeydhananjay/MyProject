package com.webdesign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.webdesign.model.Product;
import com.webdesign.model.ProductSpecification;
import com.webdesign.service.ProductService;
import com.webdesign.service.ProductSpecificationService;

@Controller
public class ProductSpecificationController {
	@Autowired
	private ProductSpecificationService productSpecificationService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productSpecification")
	public String createProductSpecifcation(Model model)
	{
		model.addAttribute("productSpecification", new ProductSpecification());
		model.addAttribute("listProducts", this.productService.listProducts());
		model.addAttribute("listProductSpecification", this.productSpecificationService.listProductSpecification());
		model.addAttribute("listProductSpecifications",this.productSpecificationService.listProductSpecifications());
		return "productSpecification";
	}
	
	@RequestMapping("/addproductSpecification")
	public String addProductSpecifcation(@ModelAttribute("productSpecification") ProductSpecification productSpecifcation)
	{
		
		Product product=productService.getByName(productSpecifcation.getProduct().getProductName());
		productService.createProduct(product);
		productSpecifcation.setProduct(product);
		productSpecifcation.setProductId(product.getProductId());
		this.productSpecificationService.createProductSpecifcation(productSpecifcation);
		return "redirect:/productSpecification";
	}

}

