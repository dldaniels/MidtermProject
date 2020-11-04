package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.BarRating;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.BeerRating;
import com.skilldistillery.beerhound.entities.User;

public interface ReviewDAO {

	public BarRating addBarRating(BarRating barRating, Bar bar, User loggedInUser);
	
	boolean deleteBarRating(int id);
	
	BarRating updateBarRating(BarRating barRating);
	
	BarRating findBarRating(int id);
	
	
	boolean deleteBeerRating(int id);
	
	BeerRating updateBeerRating(BeerRating beerRating);
	
	BeerRating findBeerRating(int id);

	BeerRating addBeerRating(BeerRating beerRating, Beer beer, User loggedInUser);
	
	
}
