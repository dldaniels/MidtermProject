package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.Brewery;
import com.skilldistillery.beerhound.entities.User;

@Service
@Transactional
public class IndexDAOImpl implements IndexDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<User> getUsers() {
		String query = "SELECT u FROM User u";
		return em.createQuery(query, User.class).getResultList();
	}

	@Override
	public List<Bar> getBars() {
		String query = "SELECT b FROM Bar b";
		return em.createQuery(query, Bar.class).getResultList();
	}

	@Override
	public List<Beer> getBeers() {
		String query = "SELECT b FROM Beer b";
		List<Beer> beers = em.createQuery(query, Beer.class).getResultList();
		beers.sort((Beer b1, Beer b2) -> b1.getName().compareTo(b2.getName()));
		return beers;
	}

	@Override
	public List<Brewery> getBreweries() {
		String query = "SELECT b FROM Brewery b";
		return em.createQuery(query, Brewery.class).getResultList();
	}

}
