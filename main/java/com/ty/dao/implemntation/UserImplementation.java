package com.ty.dao.implemntation;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ty.dao.UserDao;
import com.ty.dto.User;

@Component
@Scope(value = "prototype")
public class UserImplementation implements UserDao {
	@Autowired
	private EntityManager entityManager;

	@Override
	public User createUser(User user) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		return user;
	}

	@Override
	public User findUser(int id) {

		return entityManager.find(User.class, id);
	}

	@Override
	public User upadteUser(User user) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(user);
		entityTransaction.commit();
		return entityManager.find(User.class, user.getId());
	}

	@Override
	public boolean deleteUser(User user) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.remove(user);
		entityTransaction.commit();
		return true;
	}

}
