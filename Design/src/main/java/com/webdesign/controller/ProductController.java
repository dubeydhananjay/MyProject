package com.webdesign.controller;

import java.io.BufferedOutputStream;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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

	public String addcategory(@Validated @ModelAttribute("products") Product product, BindingResult result, Model model, MultipartFile file,HttpServletRequest request) throws  IOException
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
		this.productService.createProduct(product);
		
		String path="C://Users//Dhananjay//Documents//Eclipse_Proj//Design//src//main//webapp//image";
		file=product.getUploadFiles();
        path=path+String.valueOf("//"+product.getProductId()+".jpg");
        File imageFile = new File(path);
		if ( !file.isEmpty()) 
        {
			try
                {
                	//file.transferTo(imageFile);
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
	
	
	/*@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	
	public String uploadFileHandler(@RequestParam("name") String name, @RequestParam("file") Product product) {

		if (!product.getUploadFiles().isEmpty()) {
			try {
				byte[] bytes = ((MultipartFile) product.getUploadFiles()).getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("C://Users//Dhananjay//Documents//Eclipse_Proj//Design//src//main//webapp//image");
				//String rootPath = "C:\\Users\\Dhananjay\\Documents\\Eclipse_Proj\\Design\\src\\main\\webapp\\image";
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				
				return "You successfully uploaded file=" + name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}
		
	}*/

}
