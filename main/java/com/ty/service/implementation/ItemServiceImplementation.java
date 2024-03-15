package com.ty.service.implementation;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.ItemDao;
import com.ty.dto.Item;
import com.ty.service.ItemService;
@Component
public class ItemServiceImplementation implements ItemService {
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private EntityManager entityManager;

	@Override
	public boolean createItemService(Item item) {
		if (item != null) {
			itemDao.createItem(item);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateItemService(Item item) {
		if (item != null) {
			itemDao.upadteItem(item);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteItemService(Item item) {
		if (item != null) {
			itemDao.deleteItem(item);
			return true;
		}
		return false;
	}

	@Override
	public Item findItemService(int id) {

		return itemDao.findItem(id);
	}

	@Override
	public Item findItemByName(String name) {
		Query query = entityManager.createQuery("select i from Item i where name=1?");
		query.setParameter(1, name);
		try {
			return (Item) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

}
