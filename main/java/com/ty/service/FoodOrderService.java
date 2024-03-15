package com.ty.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ty.dto.FoodOrder;
@Component
public interface FoodOrderService {

	boolean createFoodOrderService(FoodOrder foodOrder);
	boolean updateFoodOrderService(FoodOrder foodOrder);
	boolean deleteFoodOrderService(FoodOrder foodOrder);
	FoodOrder findFoodOrderService(int id);
	double calculateTotalPrice(FoodOrder foodOrder);
	FoodOrder findFoodOrderByCustomerName(String name);
	List<FoodOrder> getAllFoodOrders();
	List<FoodOrder> getAllFoodOrdersByUserId(int id);
	List<FoodOrder> getAllFoodOrdersByUserEmail(String email);
}
