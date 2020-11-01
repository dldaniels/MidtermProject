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
	
	@RequestMapping(path="getBar.do", params = "id")
	public String getBarById(Integer id, Model model) {
		
		Bar bar = barDao.findBarById(id);
		
		model.addAttribute("bar", bar);
		
		return "bar/bar";
	}
	
	@RequestMapping(path="getBarkw.do")
	public String getBarbyKw(Model model, String keyword) {
		
		List<Bar> bars = barDao.searchBarByKeyWord(keyword);
		
		model.addAttribute("bars", bars);
		
		return "bar/keyWord";
		
	}
	
	@RequestMapping(path="createBar.do", method = RequestMethod.GET)
	public String createBar(Model model) {
		
		return "bar/createBar";
	}
	@RequestMapping(path="createdBar.do")
	public String createdBar(Model model, Bar bar) {
		model.addAttribute("bar", barDao.createBar(bar));
		return "getBar.do";
		
	}
	
	public String updateBar(Integer id, Model model) {
		
		Bar bars = barDao.findBarById(id);
			
		bars = barDao.updateBar(bars);
				
		model.addAttribute("bar", bars);
				
		return "bar/update";
	}
	
	@RequestMapping(path ="deletebar.do")
	public ModelAndView deleteBar(int id) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("bar", barDao.deleteBar(id));
		
		mv.setViewName("bar/deleteBar");
		
		return mv;
	}

}
