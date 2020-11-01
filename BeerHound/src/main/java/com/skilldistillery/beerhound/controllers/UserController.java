package com.skilldistillery.beerhound.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.UserDAO;
import com.skilldistillery.beerhound.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="allUsers.do")
	public String getUserById(Model model) {
		List<User> users = userDao.searchUsernames("");
		model.addAttribute("user", users);
		return "user/userlist";
	}
	
	@RequestMapping(path="getUser.do", params = "id")
	public String getUserById(Model model, Integer id, HttpSession session) {
		User user = userDao.getUserById(id);
		model.addAttribute("user", user);
		return "user/user";
	}
	
	@RequestMapping(path="getUser.do", params = "email")
	public String getUserByEmail(Model model, String email, HttpSession session) {
		User user = userDao.getUserByEmail(email);
		model.addAttribute("user", user);
		//WEB-INF/user/user.jsp
		return "user/user";
	}
	
	@RequestMapping(path="register.do")
	public String registrationPage(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user/register";
	}
	
	@RequestMapping(path="createUser.do", method=RequestMethod.POST)
	public String createUser(Model model, @Valid User user, Errors errors, HttpSession session) {
		if (errors.hasErrors()) {
			return "user/register";
		}
		if (!userDao.isEmailUnique(user.getEmail())) {
			errors.rejectValue("email", "error.email", user.getEmail() + " is already registered");
			return "user/register";
		}
		User registeredUser = userDao.createUser(user);
		model.addAttribute("user", registeredUser);
		session.setAttribute("loginUser", registeredUser);
		return "user/user";
	}
	
	@RequestMapping(path="deleteUser.do")
	public String delete(Model model, Integer id, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loginUser");
		User userToDelete = userDao.getUserById(id);
		boolean wasDeleted = false;
		// if not logged in, cannot delete
		if (loggedInUser == null || userToDelete == null) {
			model.addAttribute("deleted", wasDeleted);
			return "user/delete";
		}
		// if not admin and not same user, also cannot delete
		if (loggedInUser.getRole() != "ADMIN" && loggedInUser.getId() != userToDelete.getId()) {
			model.addAttribute("deleted", wasDeleted);
			return "user/delete";
		}
		wasDeleted = userDao.deleteUser(id);
		model.addAttribute("deleted", wasDeleted);
		if (wasDeleted) {
			return "user/delete";
		} else {
			model.addAttribute("user", userDao.getUserById(id));
			return "user/delete";
		}
	}
	
	
	@RequestMapping(path="login", method=RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "user/login";
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String doLogin(Model model, @Valid User user, Errors errors, HttpSession session) {
		
		
		User loggedInUser = userDao.login(user);
		if (loggedInUser == null) {
			errors.reject("Username or Password Incorrect");
		}		
		if (errors.getErrorCount() != 0) {
			return "user/login";
		}
		session.setAttribute("loginUser", loggedInUser);
		model.addAttribute("user", loggedInUser);
		return "user/user";
	}

}
