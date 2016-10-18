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
import com.webdesign.service.SupplierService;
@Controller
public class SupplierController 
{
	@Autowired
	private SupplierService supplierService;
	@RequestMapping( "/suppliers")
	public String listCategories(Model model) {
		model.addAttribute("suppliers", new Supplier());
		model.addAttribute("suppliersList", this.supplierService.listSupplier());
		return "suppliers";
	}
	@RequestMapping("/supplier")
	
	public String addcategory(@Validated @ModelAttribute("suppliers") Supplier supplier, BindingResult result, Model model)
	{
	if(result.hasErrors())
	{
		model.addAttribute("suppliersList", this.supplierService.listSupplier());
		return "/suppliers";
	}
	else 
	{
		supplierService.createSupplier(supplier);
		return "redirect:/suppliers";
	}
	}
	@RequestMapping(value="/editSupplier-{supplierId}", method=RequestMethod.GET)
	public String editSupplier(Model model,@PathVariable("supplierId") int supplierId)
	{
		
		model.addAttribute("suppliers", this.supplierService.getById(supplierId));
		return "suppliers";
	}
	@RequestMapping(value="/deleteSupplier-{supplierId}", method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId") int supplierId)
	{
		this.supplierService.delete(supplierId);
		return "redirect:/suppliers";
	}
}
