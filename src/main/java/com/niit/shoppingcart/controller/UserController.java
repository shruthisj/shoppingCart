package com.niit.shoppingcart.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingCartBackEnd.dao.UserDAO;
import com.niit.shoppingCartBackEnd.model.User;
@Controller
public class UserController {
private static final Logger log=LoggerFactory.getLogger(UserController.class);
@Autowired
private UserDAO userDAO;
@Autowired
private User user;

@RequestMapping("/")
public String getLanding()
{
	//m.addAttribute("user", new User());
	
	System.out.println("Landing Page is loading.....");
	return "index";
}

@RequestMapping("/admin")
public String getAdmin()
{
	//m.addAttribute("user", new User());
	
	System.out.println("Admin Page.........");
	return "admin";
}

@RequestMapping("/register")
public ModelAndView register(Model m)
{
	m.addAttribute("user", new User());
	ModelAndView mv=new ModelAndView("register");
	return mv;
}

@RequestMapping(value="register_add",method=RequestMethod.POST)
public String addUser(Model model,@Valid @ModelAttribute("user")User user)
{
	user.setRole("User_Role");
	userDAO.addUser(user);
	ModelAndView mv=new ModelAndView("/");
	mv.addObject("success", "üser added successfully");
	return "redirect:/";
}
}
