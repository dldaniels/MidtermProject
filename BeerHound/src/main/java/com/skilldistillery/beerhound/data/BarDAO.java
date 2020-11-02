package com.skilldistillery.beerhound.data;

import java.util.List;

import com.skilldistillery.beerhound.entities.Bar;

public interface BarDAO {

	Bar createBar(Bar bar);
	List<Bar> searchBarByKeyWord(String keyword);
	Bar updateBar(Integer id, Bar bar);
	boolean deleteBar(int id);
	Bar findBarById(int id);
	
	
	
}
