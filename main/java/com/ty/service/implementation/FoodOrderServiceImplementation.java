package com.ty.service.implementation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.FoodOrderDao;
import com.ty.dto.FoodOrder;
import com.ty.dto.Item;
import com.ty.service.FoodOrderService;

@Component
public class FoodOrderServiceImplementation implements FoodOrderService {
	@Autowired
	private FoodOrderDao foodOrderDao;
	@Autowired
	private EntityManager entityManager;

	@Override
	public boolean createFoodOrderService(FoodOrder foodOrder) {
		if (foodOrder != null) {
			foodOrderDao.createFoodOrder(foodOrder);
			return true;
		}
		return false;

	}

	@Override
	public boolean updateFoodOrderService(FoodOrder foodOrder) {
		if (foodOrder != null) {
			foodOrderDao.upadteFoodOrder(foodOrder);
			return true;
		}
		return false;

	}

	@Override
	public boolean deleteFoodOrderService(FoodOrder foodOrder) {
		if (foodOrder != null) {
			foodOrderDao.deleteFoodOrder(foodOrder);
			return true;
		}
		return false;
	}

	@Override
	public FoodOrder findFoodOrderService(int id) {
		return foodOrderDao.findFoodOrder(id);
	}

	@Override
	public double calculateTotalPrice(FoodOrder foodOrder) {
		List<Item> items = foodOrder.getItems();
		int totalPrice = 0;
		for (Item item : items) {
			if (item != null && item.getQuantity() > 0)
				totalPrice += item.getPrice() * item.getQuantity();
		}
		return totalPrice;
	}

	@Override
	public FoodOrder findFoodOrderByCustomerName(String name) {
		Query query = entityManager.createQuery("select f from FoodOrder f where customerName=?1");
		query.setParameter(1, name);
		try {
			return (FoodOrder) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<FoodOrder> getAllFoodOrders() {
		Query query = entityManager.createQuery("select f from FoodOrder f");
		try {
			return (List<FoodOrder>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<FoodOrder> getAllFoodOrdersByUserId(int id) {
		Query query = entityManager.createQuery("select f from FoodOrder f where user_id=?1");
		query.setParameter(1, id);
		try {
			return (List<FoodOrder>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<FoodOrder> getAllFoodOrdersByUserEmail(String email) {
		Query query = entityManager.createQuery("select f from FoodOrder f where customerEmail=?1");
		query.setParameter(1, email);
		try {
			return (List<FoodOrder>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
		
	}
}
