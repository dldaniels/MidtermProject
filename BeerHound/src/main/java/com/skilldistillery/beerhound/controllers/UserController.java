package com.skilldistillery.beerhound.controllers;

import java.util.List;

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
	public String getUserById(Model model, Integer id) {
		User user = userDao.getUserById(id);
		model.addAttribute("user", user);
		return "user/user";
	}
	
	@RequestMapping(path="getUser.do", params = "email")
	public String getUserByEmail(Model model, String email) {
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
	public String createUser(Model model, @Valid User user, Errors errors) {
		if (errors.hasErrors()) {
			return "user/register";
		}
		if (!userDao.isEmailUnique(user.getEmail())) {
			errors.rejectValue("email", "error.email", user.getEmail() + " is already registered");
			return "user/register";
		}
		model.addAttribute("user", userDao.createUser(user));
		return "user/user";
	}
	
	@RequestMapping(path="deleteUser.do")
	public String delete(Model model, Integer id) {
		
		boolean wasDeleted = userDao.deleteUser(id);
		model.addAttribute("deleted", wasDeleted);
		if (wasDeleted) {
			return "user/delete";
		} else {
			model.addAttribute("user", userDao.getUserById(id));
			return "user/delete";
		}
	}

}
