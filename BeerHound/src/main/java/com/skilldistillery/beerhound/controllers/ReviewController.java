package com.skilldistillery.beerhound.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.BarDAO;
import com.skilldistillery.beerhound.data.BeerDAO;
import com.skilldistillery.beerhound.data.ReviewDAO;
import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.BarRating;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.BeerRating;
import com.skilldistillery.beerhound.entities.User;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private BeerDAO beerDAO;
	
	@Autowired
	private BarDAO barDAO;

//	@RequestMapping(path = "addBarRating.do", method = RequestMethod.GET)
//	public String directToAdd() {
//		return "review/addBarReview";
//	}

//	@RequestMapping(path = "addBarRating.do", method = RequestMethod.GET)
//	public String getBreweryToUpdate(Integer id, Model model) {
//		
//		BarRating barRating = reviewDAO.findBarRating(id);
//		
//		model.addAttribute("rating", barRating);
//		
//		return "review/addBarReview";
//	}

	@RequestMapping(path = "addedBarRating.do", method = RequestMethod.GET)
	public String addBeerRating(Model model, BarRating barRating, int barId, HttpSession session) {

		Bar bar = barDAO.findBarById(barId);
		
		User user = (User) session.getAttribute("loginUser");
		
		BarRating dbBarRating = reviewDAO.addBarRating(barRating, bar, user);

		model.addAttribute("rating", dbBarRating);

		return "review/updated";
	}

	@RequestMapping(path = "deleteBarRating.do", method = RequestMethod.GET)
	public String deleteBarRating(Model model, int id, HttpSession session) {
		
		
		boolean deleted = reviewDAO.deleteBarRating(id);
		
		model.addAttribute("deleted", deleted);
		
		return "review/updated";
	}

//	@RequestMapping(path = "addBeerRating.do", method = RequestMethod.GET)
//	public String directToAddBeerRating() {
//		
//		return "review/addBeerReview";
//	}

	@RequestMapping(path = "addedBeerRating.do", method = RequestMethod.GET)
	public String addBeerRating(Model model, BeerRating beerRating, int beerId, HttpSession session) {

		Beer beer = beerDAO.findBeer(beerId);
		
		User user = (User) session.getAttribute("loginUser");
		
		BeerRating dbBeerRating = reviewDAO.addBeerRating(beerRating, beer, user);

		model.addAttribute("rating", dbBeerRating);

		return "review/updated";
	}
	
	
	@RequestMapping(path = "deleteBeerRating.do", method = RequestMethod.GET)
	public String deleteBeerRating(Model model, int id, HttpSession session) {
		
		
		boolean deleted = reviewDAO.deleteBeerRating(id);
		
		model.addAttribute("deleted", deleted);
		
		return "review/updated";
	}

}
