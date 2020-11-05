package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.TypeOfBeer;

public interface BeerDAO {
	
	
	Beer createBeer(Beer beer);
	Beer findBeer(int id);
	List<Beer> findByKeyword(String keyword);
	Beer updateBeer(Integer id, Beer beer);
	boolean deleteBeer(int id);
	Beer findBeerbyName(String name);
	List <Beer>findAll();
	List <Beer>findByType(int id);
	TypeOfBeer getBeerType(int id);
	

	
}
