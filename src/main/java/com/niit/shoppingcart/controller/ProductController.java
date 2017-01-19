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

import com.niit.shoppingCartBackEnd.dao.CategoryDAO;
import com.niit.shoppingCartBackEnd.dao.ProductDAO;
import com.niit.shoppingCartBackEnd.dao.SupplierDAO;
import com.niit.shoppingCartBackEnd.model.Category;
import com.niit.shoppingCartBackEnd.model.Product;
import com.niit.shoppingCartBackEnd.model.Supplier;
@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	Product product;
	@Autowired
	Category category;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	Supplier supplier;
	@Autowired
	SupplierDAO supplierDAO;
	
	
	@RequestMapping("/product")
	public String category(Model m)
	{
		m.addAttribute("product", product);
		m.addAttribute("productList", productDAO.list());
		m.addAttribute("category", category);
		m.addAttribute("categoryList", categoryDAO.list());
		m.addAttribute("supplier", supplier);
		m.addAttribute("supplierList", supplierDAO.list());
		
		//ModelAndView mv = new ModelAndView("product");
		//mv.addObject("productList", productDAO.list());
		
		return "product";
		
	}

	@RequestMapping(value="product_add",method=RequestMethod.POST)
	public String addProduct(Model model,@Valid @ModelAttribute("product")Product product)
	{
		Category category = categoryDAO.getCategoryName(product.getCategory().getName());
		product.setCategory(category);
		product.setCategory_id(category.getId());
		
		Supplier supplier = supplierDAO.getSupplierName(product.getSupplier().getName());
		product.setSupplier(supplier);
		product.setSupplier_id(supplier.getId());
		
		
		
		productDAO.addProduct(product);
		System.out.println("product added");
		return "redirect:/product";
	}
	
	@RequestMapping("product_delete-{id}")
	public String deleteProduct(@PathVariable("id") String id)
	{
		
		productDAO.deleteProduct(id);
		System.out.println("product deleted");
		return "redirect:/product";
	}
	
	@RequestMapping("product_edit-{id}")
	public String editProduct(@PathVariable("id") String id, Model model)
	{
		
		model.addAttribute("product",this.productDAO.getProduct(id));
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		model.addAttribute("productList", this.productDAO.list());
		System.out.println("product added");
		return "product";
	}
	
 
}

