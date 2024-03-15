package com.ty.dao.implemntation;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.FoodOrderDao;
import com.ty.dto.FoodOrder;
@Component
public class FoodOrderDaoImplementation implements FoodOrderDao {

	 @Autowired
		private EntityManager entityManager;

	@Override
	public FoodOrder createFoodOrder(FoodOrder foodOrder) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(foodOrder);
		entityTransaction.commit();
		return foodOrder;
	}

	@Override
	public FoodOrder findFoodOrder(int id) {
		return entityManager.find(FoodOrder.class, id);

	}

	@Override
	public FoodOrder upadteFoodOrder(FoodOrder foodOrder) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(foodOrder);
		entityTransaction.commit();
		return foodOrder;
	}

	@Override
	public boolean deleteFoodOrder(FoodOrder foodOrder) {
		
		if (foodOrder != null) {
			EntityTransaction entityTransaction=entityManager.getTransaction();
			entityTransaction.begin();
			entityManager.remove(foodOrder);
			entityTransaction.commit();
			return true;
		}
		return false;
	}

}
