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
import com.niit.shoppingCartBackEnd.model.Category;
@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	Category category;
	@RequestMapping("/category")
	public ModelAndView category(Model m)
	{
		m.addAttribute("category", category);
		
		ModelAndView mv = new ModelAndView("category");
		mv.addObject("categoryList", categoryDAO.list());
		return mv;
		
	}

	@RequestMapping(value="category_add",method=RequestMethod.POST)
	public String addCategory(Model model,@Valid @ModelAttribute("category")Category category)
	{
		
		categoryDAO.addCategory(category);
		System.out.println("category added");
		return "redirect:/category";
	}
	
	@RequestMapping("category_delete-{id}")
	public String deleteCategory(@PathVariable("id") String id)
	{
		
		categoryDAO.deleteCategory(id);
		System.out.println("category added");
		return "redirect:/category";
	}
	
	@RequestMapping("category_edit-{id}")
	public String editCategory(@PathVariable("id") String id, Model model)
	{
		
		model.addAttribute("category",this.categoryDAO.getCategory(id));
		model.addAttribute("categoryList", this.categoryDAO.list());
		System.out.println("category added");
		return "category";
	}
	

}
