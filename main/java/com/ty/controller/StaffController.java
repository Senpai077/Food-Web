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
import com.ty.util.Role;
import com.ty.util.Status;

@Controller
public class StaffController {
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private FoodOrderService foodOrderService;
	@Autowired
	private FoodProductService foodProductService;

	@RequestMapping("/createfoodorder")
	public ModelAndView createfoodOrder(@SessionAttribute("userlogin") User user) {
		
		ModelAndView modelAndView = new ModelAndView("createfoodorder.jsp");
		modelAndView.addObject("foodOrder", new FoodOrder());
		List<User> customers = userService.getUserByRole("Staff");
		Menu menu = menuService.getMenuServiceByUserId(3);
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("items", menu);
		modelAndView.addObject("userlogin", user);
		modelAndView.addObject("customers", customers);
		return modelAndView;
	}

	@RequestMapping("/savefoodOrder")
	public ModelAndView saveFoodOrder(@ModelAttribute FoodOrder foodOrder, @RequestParam("order_items") List<String> itemId,HttpServletRequest request,@SessionAttribute("userlogin") User user) {
		String email=foodOrder.getCustomerEmail();
		User existUser=userService.getByEmail(email);
		
		if(existUser==null ) {
			existUser=new User();
			existUser.setName(foodOrder.getCustomerName());
			existUser.setEmail(foodOrder.getCustomerEmail());
			existUser.setPhoneNumber(foodOrder.getCustomerNumber());
			existUser.setPassword("12345");
			existUser.setRole(Role.CUSTOMER);
			userService.saveService(existUser);
		}
		else {
			foodOrder.setCustomerName(existUser.getName());
			foodOrder.setCustomerNumber(existUser.getPhoneNumber());
		}
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
		foodOrder.setStatus(Status.PENDING);
		foodOrder.setItems(items);
		foodOrder.setUser(user);
		foodOrder.setTotalPrice(foodOrderService.calculateTotalPrice(foodOrder));
		foodOrderService.createFoodOrderService(foodOrder);
		ModelAndView modelAndView = new ModelAndView("bill.jsp");
		return modelAndView.addObject("foodOrder", foodOrder);
//		return viewFoodOrder(user).addObject("userlogin", user);
	}
	@RequestMapping("/paymentdone")
	public ModelAndView payment(@SessionAttribute("userlogin") User user ,@SessionAttribute("foodOrder") FoodOrder foodOrder) {
		foodOrder.setStatus(Status.DELIVERD);
		foodOrderService.updateFoodOrderService(foodOrder);
		return viewFoodOrder(user).addObject("userlogin", user);
	}
	@RequestMapping("/viewfoodOrder")
	public ModelAndView viewFoodOrder(@SessionAttribute("userlogin") User user) {
		 
		List<FoodOrder> foodOrders = foodOrderService.getAllFoodOrdersByUserId(user.getId());
		ModelAndView modelAndView = new ModelAndView("viewfoodorder.jsp");
		modelAndView.addObject("foodOrders", foodOrders);
		modelAndView.addObject("userlogin", user);
		return modelAndView;
	}
	@RequestMapping("/viewfoodOrdercus")
	public ModelAndView viewFoodOrderCustomer(@SessionAttribute("userlogin") User user) {
		
		List<FoodOrder> foodOrders = foodOrderService.getAllFoodOrdersByUserEmail(user.getEmail());
		ModelAndView modelAndView = new ModelAndView("viewfoodorder.jsp");
		modelAndView.addObject("foodOrders", foodOrders);
		modelAndView.addObject("userlogin", user);
		return modelAndView;
	}
	@RequestMapping("/editfoodOrder")
	public ModelAndView editFoodOrder(int id,@SessionAttribute("userlogin") User user) {
		 FoodOrder foodOrder = foodOrderService.findFoodOrderService(id);
		ModelAndView modelAndView = new ModelAndView("editfoodorder.jsp");
		modelAndView.addObject("foodOrder", foodOrder);
		return modelAndView;
	}
	@RequestMapping("/updatefoodOrder")
	public ModelAndView updateFoodOrder(@ModelAttribute FoodOrder foodOrder,@SessionAttribute("userlogin") User user) {
		String email=foodOrder.getCustomerEmail();
		User existUser=userService.getByEmail(email);
		if(existUser!=null ) {
			
			existUser.setName(foodOrder.getCustomerName());
			existUser.setEmail(foodOrder.getCustomerEmail());
			existUser.setPhoneNumber(foodOrder.getCustomerNumber());
			existUser.setPassword("12345");
			existUser.setRole(Role.CUSTOMER);
			userService.updateService(existUser);
		}
		foodOrder.setStatus(Status.DELIVERD);
		 foodOrderService.updateFoodOrderService(foodOrder);
		return new ModelAndView("redirect:/viewfoodOrder");
	}
	@RequestMapping("/deletefoodOrder")
	public ModelAndView updateFoodOrder(int id,@SessionAttribute("userlogin") User user) {
		foodOrderService.deleteFoodOrderService(foodOrderService.findFoodOrderService(id));
		return new ModelAndView("redirect:/viewfoodOrder");
	}
}
