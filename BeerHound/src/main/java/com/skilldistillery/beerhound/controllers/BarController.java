package com.skilldistillery.beerhound.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.beerhound.data.BarDAO;
import com.skilldistillery.beerhound.entities.Bar;

@Controller
public class BarController {
	@Autowired
	private BarDAO barDao;
	
	@RequestMapping(path="getBar.do", method = RequestMethod.GET)
	public String getBarById(Integer id, Model model) {
		
		Bar bar = barDao.findBarById(id);
		
		model.addAttribute("bar", bar);
		
		return "bar/bar";
	}
	
	@RequestMapping(path="barSearch.do", method = RequestMethod.GET)
	public String getBarbyKw(Model model, String keyword) {
		
		List<Bar> bars = barDao.searchBarByKeyWord(keyword);
		
		model.addAttribute("bars", bars);
		
		return "bar/listBar";
		
	}
	
	@RequestMapping(path="barIndex.do", method = RequestMethod.GET)
	public String findAll(Model model) {
		
		List<Bar> bars = barDao.searchBarByKeyWord("");
		
		model.addAttribute("bars", bars);
		
		return "bar/listBar";
	}
	
	@RequestMapping(path="createBar.do")
	public String createBar(Model model) {
		return "bar/createBar";
	}
	@RequestMapping(path="createdBar.do")
	public String createdBar(Model model, Bar bar) {
		
		model.addAttribute("bar", barDao.createBar(bar));
		
		return "bar/barResult";
		
	}
	
	@RequestMapping(path="updatebar.do")
	public String updateBar(Integer id, Model model, Bar bar) {
		
//		Bar bars = barDao.findBarById(id);
						
		model.addAttribute("bar", barDao.findBarById(id));
				
		return "bar/updateBar";
	}
	
	@RequestMapping(path="updatedbar.do")
	public String getUpdateBar(Model model, Integer id, Bar bar) {
		
		bar = barDao.updateBar(id, bar);
		
		model.addAttribute("bar", bar);
		
		return "bar/barResult";
	}
	
	@RequestMapping(path ="deletebar.do", method = RequestMethod.GET)
	public String deleteBar(Model model, int id) {
		
		Bar bar = barDao.findBarById(id);
		
		barDao.deleteBar(id);
		
		model.addAttribute("bar", bar);
		
		return "bar/deleteBar";
	}

}
