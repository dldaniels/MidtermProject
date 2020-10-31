package com.skilldistillery.beerhound.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
