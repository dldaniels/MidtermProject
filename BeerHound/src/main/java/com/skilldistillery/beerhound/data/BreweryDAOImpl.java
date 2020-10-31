package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Brewery;



@Transactional
@Service
public class BreweryDAOImpl implements BreweryDAO {

	
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public Brewery updateBrewery(Brewery brewery) {
		
		int id = brewery.getId();
		
		Brewery dbBrewery = em.find(Brewery.class, id);

		dbBrewery.setName(brewery.getName());
		dbBrewery.setBreweryLogoUrl(brewery.getBreweryLogoUrl());
		dbBrewery.setAddress(brewery.getAddress());
		dbBrewery.setBreweryWebsite(brewery.getBreweryWebsite());
		dbBrewery.setBeers(brewery.getBeers());
		
		em.persist(dbBrewery);
		
		return brewery;
	}

	@Override
	public boolean deleteBrewery(int id) {
		Brewery brewery = em.find(Brewery.class, id);
		em.remove(brewery);
		boolean breweryWasDeleted = ! em.contains(brewery);
		return breweryWasDeleted;
	}

	@Override
	public Brewery createBrewery(Brewery brewery) {
		
		Brewery dbBrewery = new Brewery();

		dbBrewery.setName(brewery.getName());
		dbBrewery.setBreweryLogoUrl(brewery.getBreweryLogoUrl());
		dbBrewery.setAddress(brewery.getAddress());
		dbBrewery.setBreweryWebsite(brewery.getBreweryWebsite());
		dbBrewery.setBeers(brewery.getBeers());
		
		em.persist(dbBrewery);
		
		return brewery;
		
	}

	@Override
	public Brewery findBreweryById(int id) {
		return em.find(Brewery.class, id);
	}

	@Override
	public List<Brewery> findBrewery(String keyword) {
		String jpql = "SELECT breweries FROM Brewery breweries";
		return em.createQuery(jpql, Brewery.class).getResultList();
		
		
	}

}
