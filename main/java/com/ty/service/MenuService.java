package com.ty.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ty.dto.Menu;
@Component
public interface MenuService {

	boolean createMenuService(Menu menu);
	boolean updateMenuService(Menu menu);
	boolean deleteMenuService(Menu menu);
	Menu getMenuServiceById(int menuId);
	Menu getMenuServiceByBranchId(int branchId);
	Menu getMenuServiceByUserId(int userId);
	List<Menu> getAllMenu();
}
