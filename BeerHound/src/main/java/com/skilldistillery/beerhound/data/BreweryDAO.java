package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Brewery;

public interface BreweryDAO {

	Brewery updateBrewery(Brewery brewery);
	boolean deleteBrewery(int id);
	Brewery createBrewery(Brewery brewery);
	Brewery findBreweryById(int id);
	List<Brewery> findBrewery(String keyword);
	
	
	
	
	
}
