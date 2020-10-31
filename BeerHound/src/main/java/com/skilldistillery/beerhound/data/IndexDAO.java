package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.Brewery;
import com.skilldistillery.beerhound.entities.User;

public interface IndexDAO {

	List<User> getUsers();
	List<Bar> getBars();
	List<Beer> getBeers();
	List<Brewery> getBreweries();
	
}
