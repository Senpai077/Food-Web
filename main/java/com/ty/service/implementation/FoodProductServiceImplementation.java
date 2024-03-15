package com.ty.service.implementation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.FoodProductDao;
import com.ty.dto.Branch;
import com.ty.dto.FoodProduct;
import com.ty.dto.Menu;
import com.ty.service.FoodProductService;

@Component
public class FoodProductServiceImplementation implements FoodProductService {
	@Autowired
	private FoodProductDao foodProductDao;
	@Autowired
	private EntityManager entityManager;

	@Override
	public boolean createFoodProduct(FoodProduct foodProduct) {
		if (foodProduct != null) {
			foodProductDao.createFoodProduct(foodProduct);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateFoodProduct(FoodProduct foodProduct) {
		if (foodProduct != null) {
			foodProductDao.upadteFoodProduct(foodProduct);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteFoodProduct(FoodProduct foodProduct) {
		if (foodProduct != null) {
			foodProductDao.deleteFoodProduct(foodProduct);
			return true;
		}
		return false;
	}

	@Override
	public FoodProduct getFoodProductById(int id) {
		return foodProductDao.findFoodProduct(id);
	}

	@Override
	public FoodProduct getFoodProductByName(String name) {
		Query query = entityManager.createQuery("select f from FoodProduct f where name=?1");
		query.setParameter(1, name);
		try {
			return (FoodProduct) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<FoodProduct> getFoodProductByBranchId(int branchId) {
		try {
			Query query = entityManager.createQuery("select b from Branch b where name=?1");
			query.setParameter(1, branchId);
			Branch branch = (Branch) query.getSingleResult();
			Query menuquery = entityManager.createQuery("select b from Branch b where name=?1");
			Menu menu = (Menu) menuquery.setParameter(1, branch.getUser());

			return getFoodProductByBranchId(menu.getId());
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<FoodProduct> getFoodProductByMenuId(int menuId) {
		Query query = entityManager.createQuery("select f from FoodProduct f where menu_id=?1");
		query.setParameter(1, menuId);

		return query.getResultList();
	}

	@Override
	public List<FoodProduct> getFoodAllProducts() {
		Query query = entityManager.createQuery("select f from FoodProduct f");
		return query.getResultList();
	}

}
