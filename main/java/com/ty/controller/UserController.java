package com.ty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ty.dto.Branch;
import com.ty.dto.User;
import com.ty.service.BranchService;
import com.ty.service.UserService;
import com.ty.util.Role;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private BranchService branchService;

	@RequestMapping("/signup")
	public ModelAndView signUp() {
		ModelAndView modelAndView = new ModelAndView("signup.jsp");
		modelAndView.addObject("user", new User());
		return modelAndView;

	}

	

	@RequestMapping("/saveuser")
	public ModelAndView saveUser(@ModelAttribute User user, @SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("message.jsp");
		if (userlogin != null) {
			if (userlogin.getRole().equals(Role.ADMIN)) {
				user.setRole(Role.BRANCHMANAGER);
				userService.saveService(user);
				return new ModelAndView("admin.jsp");
			}
			if (userlogin.getRole().equals(Role.BRANCHMANAGER)) {
				user.setRole(Role.STAFF);
				userService.saveService(user);
				return new ModelAndView("branchmanager.jsp");
			}

			if (userlogin.getRole().equals(Role.STAFF)) {
				{
					user.setRole(Role.CUSTOMER);
					userService.saveService(user);
					return new ModelAndView("staff.jsp");
				}
			}
			boolean result = userService.saveService(user);
			if (result) {
				modelAndView.addObject("message", "sucessfull");
				return showLoginForm();
			}
			modelAndView.addObject("message", "Not sucessfull");
			return modelAndView;
		}
		else {
			userService.saveService(user);
			return new ModelAndView("index.jsp");
		}
	}

	@RequestMapping("/login")
	public ModelAndView showLoginForm() {
		ModelAndView modelAndView = new ModelAndView("signin.jsp");
		modelAndView.addObject("user", new User());

		return modelAndView;
	}

	// This method handles the form submission
	@RequestMapping("/loginin")
	public ModelAndView login(@ModelAttribute User user) {
		User loginuser = userService.loginService(user.getEmail(), user.getPassword());

		ModelAndView modelAndView = new ModelAndView("signin.jsp");
		if (loginuser != null) {
			if (loginuser.getRole().equals(Role.ADMIN)) {
				return new ModelAndView("admin.jsp").addObject("userlogin", loginuser);
			} else if (loginuser.getRole().equals(Role.BRANCHMANAGER)) {
				return new ModelAndView("branchmanager.jsp").addObject("userlogin", loginuser);
			} else if (loginuser.getRole().equals(Role.STAFF)) {
				return new ModelAndView("staff.jsp").addObject("userlogin", loginuser);
			} else {
				return new ModelAndView("customer.jsp").addObject("userlogin", loginuser);
			}
		} else {
			modelAndView.addObject("errorMessage", "Invalid email or password. Please try again.");
			return modelAndView;
		}
	}

	@RequestMapping("/finduser")
	public ModelAndView findAllUser(@SessionAttribute(name = "userlogin") User userlogin) {
		List<User> allUser = userService.getAllUser();
		ModelAndView modelAndView = new ModelAndView("viewuser.jsp");
		modelAndView.addObject("users", allUser);
		modelAndView.addObject("userlogin", userlogin);

		return modelAndView;
	}

	@RequestMapping("/edituser")
	public ModelAndView editUser(int id, @SessionAttribute(name = "userlogin") User userlogin) {
		User user = userService.getByIdService(id);
		ModelAndView modelAndView = new ModelAndView("edituser.jsp");
		modelAndView.addObject("user", user);
		modelAndView.addObject("userlogin", userlogin);

		return modelAndView;
	}

	@RequestMapping("/updateuser")
	public ModelAndView updateUser(@ModelAttribute User user, @SessionAttribute(name = "userlogin") User userlogin) {

	
		 boolean result = userService.updateService(user);
		 
		if (result) {
			return findAllUser(userlogin);
		} else {
			ModelAndView modelAndView = findAllUser(userlogin);
			modelAndView.addObject("errorMessage", "User not found.");
			return modelAndView;
		}
		
		
//		userService.deleteService(user);
//		
//		return findAllUser(userlogin);
	}

	@RequestMapping("/deleteuser")
	public ModelAndView deletUser(int id, @SessionAttribute(name = "userlogin") User userlogin) {
		User user = userService.getByIdService(id);
		boolean result = userService.deleteService(user);
		if (result) {
			return findAllUser(userlogin);
		}
		ModelAndView modelAndView = findAllUser(userlogin);
		modelAndView.addObject("errorMessage", "User not found.");
		return modelAndView;
	}

	@RequestMapping("/createbranch")
	public ModelAndView createBranch() {
		ModelAndView modelAndView = new ModelAndView("createbranch.jsp");
		List<User> branchmanagers = userService.getUserByRole("BranchManager");
		modelAndView.addObject("branch", new Branch());
		modelAndView.addObject("branchManagers", branchmanagers);
		return modelAndView;
	}

	@RequestMapping("/savebranch")
	public ModelAndView saveBranch(@ModelAttribute Branch branch) {
		branchService.createBranchService(branch);
		ModelAndView modelAndView = new ModelAndView("admin.jsp");
		return modelAndView;
	}

	@RequestMapping("/findbranch")
	public ModelAndView findBranch(@SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("viewbranch.jsp");
		List<Branch> branches = branchService.getAllBranches();
		modelAndView.addObject("branches", branches);
		modelAndView.addObject("userlogin", userlogin);
		return modelAndView;
	}

	@RequestMapping("/editbranch")
	public ModelAndView editBranch(int id, @SessionAttribute(name = "userlogin") User userlogin) {
		ModelAndView modelAndView = new ModelAndView("editbranch.jsp");
		Branch branch = branchService.getBranchServiceById(id);
		List<User> branchmanagers = userService.getUserByRole("BranchManager");
		modelAndView.addObject("branchManagers", branchmanagers);
		modelAndView.addObject("branch", branch);
		modelAndView.addObject("userlogin", userlogin);
		return modelAndView;
	}

	@RequestMapping("/updatebranch")
	public ModelAndView updateBranch(@ModelAttribute Branch branch,
			@SessionAttribute(name = "userlogin") User userlogin) {
		branchService.updateBranchService(branch);
		return findBranch(userlogin);
	}

	@RequestMapping("/deletebranch")
	public ModelAndView deleteBranch(int id, @SessionAttribute(name = "userlogin") User userlogin) {
		branchService.deleteBranchService(branchService.getBranchServiceById(id));
		return findBranch(userlogin);
	}
}
