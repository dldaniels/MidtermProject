package com.skilldistillery.beerhound.data;

import com.skilldistillery.beerhound.entities.BeerPrice;

public interface BeerPriceDAO {

	BeerPrice create(BeerPrice beerPrice);
	boolean delete(int id);
	
	
	
}
