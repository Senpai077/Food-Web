package com.ty.dao;

import org.springframework.stereotype.Component;

import com.ty.dto.Menu;
@Component
public interface MenuDao {

	Menu createMenu(Menu menu);

	Menu findMenu(int id);

	Menu upadteMenu(Menu menu);

	boolean deleteMenu(Menu menu);
}
