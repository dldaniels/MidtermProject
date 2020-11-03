package com.skilldistillery.beerhound.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.BeerDAO;
import com.skilldistillery.beerhound.data.BreweryDAO;
import com.skilldistillery.beerhound.entities.Beer;

@Controller
public class BeerController {

	@Autowired
	private BeerDAO beerDao;

	@RequestMapping(path = "getBeer.do", method = RequestMethod.GET)
	public String getBeerById(Integer id, Model model, HttpSession session) {
		Beer beer = beerDao.findBeer(id);
		model.addAttribute("beer", beer);
		return "beer/showBeer";
	}

	@RequestMapping(path = "getBeerByName.do", method = RequestMethod.GET)
	public String getBeerbyName(String name, Model model, HttpSession session) {
		Beer beer = beerDao.findBeerbyName(name);
		model.addAttribute("beer", beer);
		return "beer/showBeer";
	}

	@RequestMapping(path = "beerIndex.do", method = RequestMethod.GET)
	public String getBeerKeyWordSearch(Integer bid, Model model, HttpSession session) {
		List<Beer> beerList = beerDao.findAll();
		model.addAttribute("beers", beerList);
		return "beer/beerList";
	}

	@RequestMapping(path = "addBeerForm.do", method = RequestMethod.GET)
	public String addBeerForm(Beer beer, HttpSession session) {
		return "beer/addBeer";
	}

	@RequestMapping(path = "addBeer.do")
	public String addBeer(Beer beer, Model model, HttpSession session) {
		model.addAttribute("beer", beerDao.createBeer(beer));
		return "beer/beerAction";
	}

	@RequestMapping(path = "updateBeerForm.do")
	public String updateBeerForm(Beer beer, Integer id, Model model, HttpSession session) {
		model.addAttribute("beer", beerDao.findBeer(id));
//		model.addAttribute("beer", beer);
		return "beer/updateBeer";
	}

	@RequestMapping(path = "updateBeer.do")
	public String updateBeer(Beer beer, Integer id, Model model, HttpSession session) {
		beer = beerDao.updateBeer(id, beer);
		// updatedBeer = beerDao.updateBeer(updatedBeer);
		model.addAttribute("beer", beer);
		System.out.println(beer);
		return "beer/showBeer";
	}

	@RequestMapping(path = "deleteBeer.do")
	public String deleteBeer(Model model, int id, HttpSession session) {
		Beer beer = beerDao.findBeer(id);
		beerDao.deleteBeer(id);
		model.addAttribute("beer", beer);
		return "beer/beerAction";
	}

	@RequestMapping(path = "findBeerByType.do")
	public String findByType(Integer id, Model model, HttpSession session) {
		List<Beer> beerList = beerDao.findByType(id);
		model.addAttribute("beers", beerList);
		return "beer/beerList";

	}
	
	@RequestMapping(path = "findBeerbySearch.do")
	public String findByKeyword(String keyword, Model model, HttpSession session) {
		List<Beer> searchList = beerDao.findByKeyword(keyword);
		model.addAttribute("beers", searchList);
		System.out.println(searchList);
		return "beer/searchResults";
		
		
	}
}
