package com.ty.service.implementation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ty.dao.UserDao;
import com.ty.dto.User;
import com.ty.service.UserService;
import com.ty.util.Role;

@Component
@Scope(value = "prototype")
public class UserServiceImplementation implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private EntityManager entityManager;

	

	@Override
	public User loginService(String email, String password) {
		Query query = entityManager.createQuery("select u from User u where email=?1 and password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		try {

			return (User) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean saveService(User user) {

		if (user != null) {
			userDao.createUser(user);
			return true;
		}
		return false;
	}

	@Override
	public User getByIdService(int id) {
		return userDao.findUser(id);
	}

	@Override
	public List<User> getByUserName(String userName) {
		Query query = entityManager.createQuery("select u from User u where name=?1");
		query.setParameter(1, userName);
		List<User> users = query.getResultList();
		return users;
	}

	@Override
	public User getByEmail(String email) {
		Query query = entityManager.createQuery("select u from User u where email=?1");
		query.setParameter(1, email);
		try {
			return (User) query.getSingleResult();
		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public User getByPhoneNumber(String phoneNumber) {
		Query query = entityManager.createQuery("select u from User u where phoneNumber=?1");
		query.setParameter(1, phoneNumber);
		try {
			return (User) query.getSingleResult();
		} catch (Exception e) {

			return null;
		}
	}

	Session session;

	@Override
	public boolean updateService(User user) {
		if (user != null) {
			userDao.upadteUser(user);
			//session.merge(user);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteService(User user) {
		if (user != null) {
			userDao.deleteUser(user);
			return true;
		}
		return false;

	}

	@Override
	public List<User> getUserByRole(String role) {
		Query query = entityManager.createQuery("select u from User u where role=?1");
		query.setParameter(1, Role.valueOf(role.toUpperCase()));

		return query.getResultList();
	}

	@Override
	public List<User> getAllUser() {
		Query query = entityManager.createQuery("select us from User us ");
		return query.getResultList();
	}

}
