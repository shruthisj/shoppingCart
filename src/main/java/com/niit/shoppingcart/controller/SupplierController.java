package com.niit.shoppingcart.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.niit.shoppingCartBackEnd.dao.SupplierDAO;
import com.niit.shoppingCartBackEnd.model.Supplier;
@Controller
public class SupplierController {
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	Supplier supplier;
	@RequestMapping("/supplier")
	public ModelAndView category(Model m)
	{
		m.addAttribute("supplier", supplier);
		
		ModelAndView mv = new ModelAndView("supplier");
		mv.addObject("supplierList", supplierDAO.list());
		return mv;
		
	}

	@RequestMapping(value="supplier_add",method=RequestMethod.POST)
	public String addCategory(Model model,@Valid @ModelAttribute("supplier")Supplier supplier)
	{
		
		supplierDAO.addSupplier(supplier);
		System.out.println("supplier added");
		return "redirect:/supplier";
	}
	@RequestMapping("supplier_delete-{id}")
	public String deleteSupplier(@PathVariable("id") String id)
	{
		
		supplierDAO.deleteSupplier(id);
		System.out.println("supplier deleted");
		return "redirect:/supplier";
	}
	
	@RequestMapping("supplier_edit-{id}")
	public String editSupplier(@PathVariable("id") String id, Model model)
	{
		
		model.addAttribute("supplier",this.supplierDAO.getSupplier(id));
		model.addAttribute("supplierList", this.supplierDAO.list());
		System.out.println("supplier added");
		return "supplier";
	}
	

}

