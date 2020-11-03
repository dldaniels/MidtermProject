package com.skilldistillery.beerhound.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.ReviewDAO;
import com.skilldistillery.beerhound.entities.BarRating;
import com.skilldistillery.beerhound.entities.BeerRating;
import com.skilldistillery.beerhound.entities.Brewery;

@Controller
public class ReviewController {

	
	@Autowired
	private ReviewDAO reviewDAO;
	
	
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
	public String addBarRating(Model model, BarRating barRating, HttpSession session) {
		
		
		BarRating dbBarRating = reviewDAO.addBarRating(barRating);
		
		model.addAttribute("rating", dbBarRating);
		
		return "review/updated";
	}
	
	
	
	@RequestMapping(path = "deleteBarRating.do", method = RequestMethod.GET)
	public String deleteBarRating(Model model, int id, HttpSession session) {
		
		BarRating barRating = reviewDAO.findBarRating(id);
		
		reviewDAO.deleteBarRating(id);
		
		model.addAttribute("rating", barRating);
		
		return "review/updated";
	}
	
	
	
//	@RequestMapping(path = "addBeerRating.do", method = RequestMethod.GET)
//	public String directToAddBeerRating() {
//		
//		return "review/addBeerReview";
//	}
	
	
	@RequestMapping(path = "addedBeerRating.do", method = RequestMethod.GET)
	public String addBeerRating(Model model, BeerRating beerRating, HttpSession session) {
		
		
		BeerRating dbBeerRating = reviewDAO.addBeerRating(beerRating);
		
		model.addAttribute("rating", dbBeerRating);
		
		return "review/updated";
	}
	
	
	
	@RequestMapping(path = "deleteBeerRating.do", method = RequestMethod.GET)
	public String deleteBeerRating(Model model, int id, HttpSession session) {
		
		BeerRating beerRating = reviewDAO.findBeerRating(id);
		
		reviewDAO.deleteBarRating(id);
		
		model.addAttribute("rating", beerRating);
		
		return "review/updated";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
