package com.skilldistillery.beerhound.data;

import com.skilldistillery.beerhound.entities.BarRating;
import com.skilldistillery.beerhound.entities.BeerRating;

public interface ReviewDAO {

	BarRating addBarRating(BarRating barRating);
	
	boolean deleteBarRating(int id);
	
	BarRating updateBarRating(BarRating barRating);
	
	BarRating findBarRating(int id);
	
	BeerRating addBeerRating(BeerRating beerRating);
	
	boolean deleteBeerRating(int id);
	
	BeerRating updateBeerRating(BeerRating beerRating);
	
	BeerRating findBeerRating(int id);
	
	
	
}
