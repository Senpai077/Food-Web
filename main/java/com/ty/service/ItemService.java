package com.ty.service;

import org.springframework.stereotype.Component;

import com.ty.dto.Item;

@Component
public interface ItemService {

	boolean createItemService(Item item);

	boolean updateItemService(Item item);

	boolean deleteItemService(Item item);

	Item findItemService(int id);

	Item findItemByName(String name);
}
