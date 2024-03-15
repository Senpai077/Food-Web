package com.ty.dao;

import org.springframework.stereotype.Component;

import com.ty.dto.FoodOrder;
@Component
public interface FoodOrderDao {

	FoodOrder createFoodOrder(FoodOrder foodOrder);

	FoodOrder findFoodOrder(int id);

	FoodOrder upadteFoodOrder(FoodOrder foodOrder);

	boolean deleteFoodOrder(FoodOrder foodOrder);
}
