package com.ty.dao;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ty.dto.User;
@Component
@Scope(value = "prototype")
public interface UserDao {

	User createUser(User user);
	User findUser(int id);
	User upadteUser(User user);
	boolean deleteUser(User id);
}
