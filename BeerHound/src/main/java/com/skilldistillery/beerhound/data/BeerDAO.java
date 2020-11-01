package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Beer;

public interface BeerDAO {

	Beer createBeer(Beer beer);
	Beer findBeer(int id);
	List<Beer> findByKeyword(String keyword);
	Beer updateBeer(Beer beer);
	boolean deleteBeer(int id);
	Beer findBeerbyName(String name);
	List <Beer>findAll();
	

	
}
