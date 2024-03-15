package com.ty.service;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ty.dto.User;
@Component
@Scope(value = "prototype")
public interface UserService {

	User loginService(String name,String password);
	boolean saveService(User user);
	boolean updateService(User user);
	boolean deleteService(User user);
	User getByIdService(int id);
	List<User> getByUserName(String userName);
	User getByEmail(String email);
	User getByPhoneNumber(String phoneNumber);
	List<User> getUserByRole(String role);
	List<User> getAllUser();
}
