package com.ty.service.implementation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.MenuDao;
import com.ty.dao.UserDao;
import com.ty.dao.implemntation.MenuDaoImplementation;
import com.ty.dto.Branch;
import com.ty.dto.Menu;
import com.ty.dto.User;
import com.ty.service.MenuService;
@Component
public class MenuServiceImplemntation implements MenuService{
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private EntityManager entityManager;

	@Override
	public boolean createMenuService(Menu menu) {
		if (menu != null) {
			menuDao.createMenu(menu) ;
			return true;
		}
		return false;
	}

	@Override
	public boolean updateMenuService(Menu menu) {
		if (menu != null) {
			menuDao.upadteMenu(menu);
			return true;
		}
		return false;
		 
	}

	@Override
	public boolean deleteMenuService(Menu menu) {
		if (menu != null) {
			menuDao.deleteMenu(menu);
			return true;
		}
		return false;
	}

	@Override
	public Menu getMenuServiceById(int menuId) {
		
		return menuDao.findMenu(menuId);
	}

	@Override
	public Menu getMenuServiceByBranchId(int branchId) {
		Query query=entityManager.createQuery("select b from Branch b where id=?1");
		query.setParameter(1, branchId);
		try {
			Branch branch=(Branch) query.getSingleResult();
			Query menuquery=entityManager.createQuery("select m from Menu m where =?1");
			menuquery.setParameter(1, branch.getUser());
			return (Menu) menuquery.getSingleResult();
		}
		catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public Menu getMenuServiceByUserId(int userId) {
		Query queryu=entityManager.createQuery("select u from User u where id=?1");
		try {
			queryu.setParameter(1, userId);
			User user=(User) queryu.getSingleResult();
			
			if(user!=null) {
		Query query=entityManager.createQuery("select m from Menu m where user_id=?1");
		query.setParameter(1, user.getId());
			return (Menu) query.getSingleResult();
		}
		}
		catch (Exception e) {
			return null;
		}
		return null;
	}

	@Override
	public List<Menu> getAllMenu() {
		Query query=entityManager.createQuery("select m from Menu m ");
		return query.getResultList();
	}

}
