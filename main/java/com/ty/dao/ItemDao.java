package com.ty.dao;

import org.springframework.stereotype.Component;

import com.ty.dto.Item;
@Component
public interface ItemDao {

	Item createItem(Item item);

	Item findItem(int id);

	Item upadteItem(Item item);

	boolean deleteItem(Item item);
}
