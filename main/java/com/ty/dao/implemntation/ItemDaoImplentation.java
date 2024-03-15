package com.ty.dao.implemntation;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.ItemDao;
import com.ty.dto.Item;
@Component
public class ItemDaoImplentation implements ItemDao {

	 @Autowired
		private EntityManager entityManager;

	@Override
	public Item createItem(Item item) {
		
		entityManager.persist(item);
		
		return item;
	}

	@Override
	public Item findItem(int id) {
		return entityManager.find(Item.class, id);
	}

	@Override
	public Item upadteItem(Item item) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(item);
		entityTransaction.commit();
		return item;
	}

	@Override
	public boolean deleteItem(Item item) {
		
		if (item != null) {
			EntityTransaction entityTransaction=entityManager.getTransaction();
			entityTransaction.begin();
			entityManager.remove(item);
			entityTransaction.commit();
			return true;
		}
		return false;
	}

}
