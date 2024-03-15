package com.ty.dao;

import org.springframework.stereotype.Component;

import com.ty.dto.FoodProduct;
@Component
public interface FoodProductDao {

	FoodProduct createFoodProduct(FoodProduct foodProduct);

	FoodProduct findFoodProduct(int id);

	FoodProduct upadteFoodProduct(FoodProduct foodProduct);

	boolean deleteFoodProduct(FoodProduct foodProduct);
}
