package com.skilldistillery.beerhound.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.beerhound.data.BarDAO;
import com.skilldistillery.beerhound.data.BeerDAO;
import com.skilldistillery.beerhound.data.BreweryDAO;
import com.skilldistillery.beerhound.data.IndexDAO;
import com.skilldistillery.beerhound.entities.User;

@Controller
public class IndexController {
	
	@Autowired
	private IndexDAO indexDao;
	@Autowired
	private BeerDAO beerDao;
	@Autowired
	private BarDAO barDao;
	@Autowired
	private BreweryDAO breweryDao;
	
	@RequestMapping(path={"/", "index.do"})
	public String getIndex(Model model, HttpSession session) {
		model.addAttribute("userList", indexDao.getUsers());
		model.addAttribute("barList", indexDao.getBars());
		model.addAttribute("beerList", indexDao.getBeers());
		model.addAttribute("breweryList", indexDao.getBreweries());
		return "index";
	}
	
	@RequestMapping(path={"searchAll.do"})
	public String search(Model model, HttpSession session, String keyword) {
//		model.addAttribute("userList", indexDao.getUsers());
		model.addAttribute("barList", barDao.searchBarByKeyWord(keyword));
		model.addAttribute("beerList", beerDao.findByKeyword(keyword));
		model.addAttribute("breweryList", breweryDao.findBrewery(keyword));
		model.addAttribute("keyword", keyword);
		return "search";
	}
	
	@RequestMapping(path="userIndex.do")
	public String getUserById(Model model, HttpSession session) {
		List<User> users = indexDao.getUsers();
		model.addAttribute("userList", users);
		return "user/userlist";
	}


}
