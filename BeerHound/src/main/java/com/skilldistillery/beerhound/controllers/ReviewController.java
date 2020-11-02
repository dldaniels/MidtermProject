package com.skilldistillery.beerhound.controllers;

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
//		return "review/addBeerReview";
//	}
	
	
	@RequestMapping(path = "addBarRating.do", method = RequestMethod.GET)
	public String getBreweryToUpdate(Integer id, Model model) {
		
		BarRating barRating = reviewDAO.findBarRating(id);
		
		model.addAttribute("rating", barRating);
		
		return "review/update";
	}
	
	
	@RequestMapping(path = "addedBarRating.do", method = RequestMethod.GET)
	public String addBarRating(Model model, BarRating barRating) {
		
		
		BarRating dbBarRating = reviewDAO.addBarRating(barRating);
		
		model.addAttribute("rating", dbBarRating);
		
		return "review/updated";
	}
	
	
	
	@RequestMapping(path = "deleteBarRating.do", method = RequestMethod.GET)
	public String deleteBarRating(Model model, int id) {
		
		BarRating barRating = reviewDAO.findBarRating(id);
		
		reviewDAO.deleteBarRating(id);
		
		model.addAttribute("rating", barRating);
		
		return "review/updated";
	}
	
	
	
//	@RequestMapping(path = "addBeerRating.do", method = RequestMethod.GET)
//	public String directToAddBeerRating(BeerRating beerRating) {
//		
//		return "review/add";
//	}
	
	
	@RequestMapping(path = "addedBeerRating.do", method = RequestMethod.GET)
	public String addBeerRating(Model model, BeerRating beerRating) {
		
		
		BeerRating dbBeerRating = reviewDAO.addBeerRating(beerRating);
		
		model.addAttribute("rating", dbBeerRating);
		
		return "review/updated";
	}
	
	
	
	@RequestMapping(path = "deleteBeerRating.do", method = RequestMethod.GET)
	public String deleteBeerRating(Model model, int id) {
		
		BeerRating beerRating = reviewDAO.findBeerRating(id);
		
		reviewDAO.deleteBarRating(id);
		
		model.addAttribute("rating", beerRating);
		
		return "review/updated";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
