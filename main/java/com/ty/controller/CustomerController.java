package com.ty.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ty.dto.FoodOrder;
import com.ty.dto.FoodProduct;
import com.ty.dto.Item;
import com.ty.dto.Menu;
import com.ty.dto.User;
import com.ty.service.FoodOrderService;
import com.ty.service.FoodProductService;
import com.ty.service.MenuService;
import com.ty.service.UserService;

@Controller
public class CustomerController {
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private FoodOrderService foodOrderService;
	@Autowired
	private FoodProductService foodProductService;

	@RequestMapping("/createfoodordercus")
	public ModelAndView createfoodOrder(@SessionAttribute("staff") User user) {
		
		ModelAndView modelAndView = new ModelAndView("createfoodorder.jsp");
		modelAndView.addObject("foodOrder", new FoodOrder());
		Menu menu = menuService.getMenuServiceByUserId(6);
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("items", menu);
		modelAndView.addObject("staff", user);
		
		return modelAndView;
	}

	@RequestMapping("/savefoodOrdercus")
	public ModelAndView saveFoodOrder(@ModelAttribute FoodOrder foodOrder, @RequestParam("order_items") List<String> itemId,HttpServletRequest request,@SessionAttribute("staff") User user) {
		List<Item> items=new ArrayList<Item>();
//		modelAndView.addObject("staff", user);
		for (String productId : itemId) {
			FoodProduct foodProduct = foodProductService.getFoodProductById(Integer.parseInt(productId));
			Item item=new Item();
			item.setProductId(foodProduct.getId());
			item.setName(foodProduct.getName());
			String quantityParamName = "quantity_" + productId;
	        int quantity = Integer.parseInt(request.getParameter(quantityParamName));
			item.setQuantity(quantity);
			item.setPrice(foodProduct.getPrice());
			item.setType(foodProduct.getType());
			item.setFoodOrder(foodOrder);
				
				items.add(item);
				
			}
		foodOrder.setItems(items);
		foodOrder.setUser(user);
		foodOrder.setTotalPrice(foodOrderService.calculateTotalPrice(foodOrder));
		foodOrderService.createFoodOrderService(foodOrder);
//		ModelAndView modelAndView = new ModelAndView("viewfoodorder.jsp");
		return viewFoodOrder(user).addObject("staff", user);
	}
	@RequestMapping("/viewfoodOrdercust")
	public ModelAndView viewFoodOrder(@SessionAttribute("staff") User user) {
		 System.out.println("123");
		List<FoodOrder> foodOrders = foodOrderService.getAllFoodOrders();
		ModelAndView modelAndView = new ModelAndView("viewfoodorder.jsp");
		modelAndView.addObject("foodOrders", foodOrders);
		return modelAndView;
	}
	@RequestMapping("/editfoodOrdercus")
	public ModelAndView editFoodOrder(int id,@SessionAttribute("staff") User user) {
		 FoodOrder foodOrder = foodOrderService.findFoodOrderService(id);
		ModelAndView modelAndView = new ModelAndView("editfoodorder.jsp");
		modelAndView.addObject("foodOrder", foodOrder);
		return modelAndView;
	}
	@RequestMapping("/updatefoodOrdercus")
	public ModelAndView updateFoodOrder(@ModelAttribute FoodOrder foodOrder,@SessionAttribute("staff") User user) {
		 foodOrderService.updateFoodOrderService(foodOrder);
		 System.out.println("123");
		return viewFoodOrder(user);
	}
	@RequestMapping("/deletefoodOrdercus")
	public ModelAndView updateFoodOrder(int id,@SessionAttribute("staff") User user) {
		foodOrderService.deleteFoodOrderService(foodOrderService.findFoodOrderService(id));
		return viewFoodOrder(user);
	}
}
