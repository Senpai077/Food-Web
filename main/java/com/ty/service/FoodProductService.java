package com.ty.service;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ty.dto.FoodProduct;

@Component
public interface FoodProductService {
	boolean createFoodProduct(FoodProduct foodProduct);

	boolean updateFoodProduct(FoodProduct foodProduct);

	boolean deleteFoodProduct(FoodProduct foodProduct);

	FoodProduct getFoodProductById(int id);

	FoodProduct getFoodProductByName(String name);

	List<FoodProduct> getFoodProductByBranchId(int branchId);

	List<FoodProduct> getFoodProductByMenuId(int menuId);

	List<FoodProduct> getFoodAllProducts();

}
