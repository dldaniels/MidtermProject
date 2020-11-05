package com.skilldistillery.beerhound.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.beerhound.data.BarDAO;
import com.skilldistillery.beerhound.data.BeerDAO;
import com.skilldistillery.beerhound.data.BeerPriceDAO;
import com.skilldistillery.beerhound.data.IndexDAO;
import com.skilldistillery.beerhound.entities.Address;
import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.BeerPrice;

@Controller
public class BarController {
	@Autowired
	private BarDAO barDao;
	@Autowired
	private BeerDAO beerDao;
	@Autowired
	private BeerPriceDAO beerPriceDao;
	@Autowired
	private IndexDAO indexDao;

	@RequestMapping(path = "getBar.do", method = RequestMethod.GET)
	public String getBarById(Integer id, Model model, HttpSession session) {

		Bar bar = barDao.findBarById(id);

		model.addAttribute("bar", bar);

		List<Beer> beerList = indexDao.getBeers();
		beerList.sort((Beer b1, Beer b2) -> b1.getBrewery().getName().compareTo(b2.getBrewery().getName()));

		model.addAttribute("beerList", beerList);

		return "bar/bar";
	}

	@RequestMapping(path = "barSearch.do", method = RequestMethod.GET)
	public String getBarbyKw(Model model, String keyword, HttpSession session) {

		List<Bar> bars = barDao.searchBarByKeyWord(keyword);

		model.addAttribute("bars", bars);

		return "bar/listBar";

	}

	@RequestMapping(path = "barIndex.do", method = RequestMethod.GET)
	public String findAll(Model model, HttpSession session) {

		List<Bar> bars = barDao.searchBarByKeyWord("");

		model.addAttribute("bars", bars);

		return "bar/listBar";
	}

	@RequestMapping(path = "createBar.do")
	public String createBar(Model model, HttpSession session) {
		return "bar/createBar";
	}

	@RequestMapping(path = "createdBar.do")
	public String createdBar(Model model, Bar bar, Address address) {
		bar.setAddress(address);
		model.addAttribute("bar", barDao.createBar(bar));
		
		return "bar/barResult";

	}

	@RequestMapping(path = "updatebar.do")
	public String updateBar(Integer id, Model model, Bar bar, HttpSession session) {

//		Bar bars = barDao.findBarById(id);

		model.addAttribute("bar", barDao.findBarById(id));

		return "bar/updateBar";
	}

	@RequestMapping(path = "updatedbar.do")
//	public String getUpdateBar(Model model, Integer id, Bar bar, Address address, HttpSession session) {
		public String getUpdateBar(Model model, Integer id, Bar bar, HttpSession session) {

//		bar.setAddress(address);
		bar = barDao.updateBar(id, bar);

		model.addAttribute("bar", bar);

		return "bar/barResult";
	}

	@RequestMapping(path = "deletebar.do", method = RequestMethod.GET)
	public String deleteBar(Model model, int id, HttpSession session) {

		barDao.deleteBar(id);

		return "bar/deleteBar";
	}

	@RequestMapping(path = "updateMenu.do", method = RequestMethod.POST)
	public String updatedMenu(Model model, int barId, HttpSession session, BeerPrice beerPrice, int beerId) {
		Bar bar = barDao.findBarById(barId);
		beerPrice.setBar(bar);
		Beer beer = beerDao.findBeer(beerId);
		beerPrice.setBeer(beer);
		beerPrice = beerPriceDao.create(beerPrice);

		bar = barDao.findBarById(barId);
		model.addAttribute("bar", bar);
		List<Beer> beerList = indexDao.getBeers();
		model.addAttribute("beerList", beerList);
		return "bar/bar";
	}

	@RequestMapping(path = "removeBeer.do", method = RequestMethod.POST)
	public String removeBeerFromMenu(Model model, int barId, int beerPriceId, HttpSession session) {

		Bar bar = barDao.findBarById(barId);

		beerPriceDao.delete(beerPriceId);

		model.addAttribute("bar", bar);

		return "bar/bar";
	}

}
