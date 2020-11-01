package com.skilldistillery.beerhound.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.beerhound.data.IndexDAO;
import com.skilldistillery.beerhound.data.UserDAO;
import com.skilldistillery.beerhound.entities.User;

@Controller
public class IndexController {
	
	@Autowired
	private IndexDAO indexDao;
	
	@RequestMapping(path={"/", "index.do"})
	public String getIndex(Model model) {
		model.addAttribute("userList", indexDao.getUsers());
		model.addAttribute("barList", indexDao.getBars());
		model.addAttribute("beerList", indexDao.getBeers());
		model.addAttribute("breweryList", indexDao.getBreweries());
		return "index";
	}
	
	@RequestMapping(path="userIndex.do")
	public String getUserById(Model model) {
		List<User> users = indexDao.getUsers();
		model.addAttribute("userList", users);
		return "user/userlist";
	}


}
