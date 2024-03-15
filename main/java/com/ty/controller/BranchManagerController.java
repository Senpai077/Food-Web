package com.ty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ty.dto.FoodProduct;
import com.ty.dto.Menu;
import com.ty.dto.User;
import com.ty.service.FoodProductService;
import com.ty.service.MenuService;
import com.ty.service.UserService;
import com.ty.util.Role;

@Controller
public class BranchManagerController {

	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private FoodProductService foodProductService;
	@RequestMapping("/signupstaff")
	public ModelAndView signUp(@SessionAttribute(name = "userlogin") User userlogin ) {
		ModelAndView modelAndView = new ModelAndView("signup.jsp");
		modelAndView.addObject("user", new User());
		return modelAndView;

	}

	@RequestMapping("/saveuserstaff")
	public ModelAndView saveUser(@ModelAttribute User user,@SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("branchmanager.jsp");
		if(user.getRole().equals(Role.STAFF)) {
		userService.saveService(user);
		}
		return modelAndView;
	}
	@RequestMapping("/findstaff")
	public ModelAndView findAllUser(@SessionAttribute(name = "userlogin") User userlogin) {
		List<User> allUser = userService.getUserByRole("Staff");
		ModelAndView modelAndView = new ModelAndView("viewuser.jsp");
		modelAndView.addObject("users", allUser);
		modelAndView.addObject("userlogin", userlogin);

		return modelAndView;
	}
	@RequestMapping("/createmenu")
	public ModelAndView name(@SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("createmenu.jsp");
		List<User> branchmanagers = userService.getUserByRole("BranchManager");
		modelAndView.addObject("branchManagers", branchmanagers);
		modelAndView.addObject("menu", new Menu());
		return modelAndView;
	}
	@RequestMapping("/savemenu")
	public ModelAndView saveBranch(@ModelAttribute Menu menu,@SessionAttribute(name = "userlogin") User userlogin) {
		Menu existingMenu = menuService.getMenuServiceByUserId(userlogin.getId());
		
		ModelAndView modelAndView = new ModelAndView("branchmanager.jsp");
		if(existingMenu==null)
		menuService.createMenuService(menu);
		return modelAndView;
	}
	@RequestMapping("/viewmenu")
	public ModelAndView viewMenu(@SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("viewmenu.jsp");
		Menu menu = menuService.getMenuServiceByUserId(userlogin.getId());
		modelAndView.addObject("menu", menu);
		return modelAndView;
	}
	
	@RequestMapping("/creatproduct")
	public ModelAndView createProduct(@SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("createfoodproduct.jsp");
		List<Menu> allMenu = menuService.getAllMenu();
		modelAndView.addObject("menu", allMenu);
		modelAndView.addObject("foodProduct", new FoodProduct());
		return modelAndView;
	}
	@RequestMapping("/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute FoodProduct foodProduct,@SessionAttribute(name = "userlogin") User userlogin) {
		foodProductService.createFoodProduct(foodProduct);
		 return new ModelAndView("redirect:/viewmenu");
	}
	
	@RequestMapping("/editproduct")
	public ModelAndView editUser(int id,@SessionAttribute(name = "userlogin") User userlogin) {
		FoodProduct foodProduct=foodProductService.getFoodProductById(id);
		ModelAndView modelAndView = new ModelAndView("editfoodproduct.jsp");
		modelAndView.addObject("foodproduct", foodProduct);

		return modelAndView;
	}

	@RequestMapping("/updatemenu")
	public ModelAndView updateUser(@ModelAttribute FoodProduct foodProduct,@SessionAttribute(name = "userlogin") User userlogin) {
		foodProductService.updateFoodProduct(foodProduct);
         ModelAndView modelAndView=new ModelAndView("display.jsp");
          return new ModelAndView("redirect:/viewmenu");
		
	}

	@RequestMapping("/deletemenu")
	public ModelAndView deletUser(int id,@SessionAttribute(name = "userlogin") User userlogin) {
		boolean result = foodProductService.deleteFoodProduct(foodProductService.getFoodProductById(id));
		ModelAndView modelAndView=new ModelAndView("display.jsp");
		if (result) {
			  return new ModelAndView("redirect:/viewmenu");
		}
		modelAndView.addObject("errorMessage", "User not found.");
		return modelAndView;
	}
	
}
