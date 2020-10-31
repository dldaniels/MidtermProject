package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Beer;

@Transactional
@Service
public class BeerDAOImpl implements BeerDAO {
	

	@PersistenceContext
	private EntityManager em;

	@Override
	public Beer createBeer(Beer beer) {

		Beer addBeer = new Beer();

		addBeer.setName(beer.getName());
		addBeer.setBrewery(beer.getBrewery());
		addBeer.setTypeOfBeer(beer.getTypeOfBeer());
		addBeer.setAlcoholContent(beer.getAlcoholContent());
		addBeer.setBeerPrice(beer.getBeerPrice());
		addBeer.setBeerRating(beer.getBeerRating());
		addBeer.setImageUrl(beer.getImageUrl());

		em.persist(addBeer);

		return beer;
	}

	@Override
	public Beer findBeer(int id) {
		return em.find(Beer.class, id);
	}

	@Override
	public List<Beer> findByKeyword(String keyword) {
		keyword = "%"+keyword+"%";
	String jpql = "SELECT b FROM Beer b WHERE b.name LIKE :keyword";
		return em.createQuery(jpql, Beer.class).setParameter("keyword", keyword).getResultList();
	}

	@Override
	public Beer updateBeer(Beer beer) {

		int id = beer.getId();

		Beer editBeer = em.find(Beer.class, id);

		editBeer.setName(beer.getName());
		editBeer.setBrewery(beer.getBrewery());
		editBeer.setTypeOfBeer(beer.getTypeOfBeer());
		editBeer.setAlcoholContent(beer.getAlcoholContent());
		editBeer.setBeerPrice(beer.getBeerPrice());
		editBeer.setBeerRating(beer.getBeerRating());
		editBeer.setImageUrl(beer.getImageUrl());

		em.persist(editBeer);

		return beer;
	}

	@Override
	public boolean deleteBeer(int id) {
		Beer beer = em.find(Beer.class, id);
		em.remove(beer);
		boolean beerDeleted = !em.contains(beer);
		return beerDeleted;
	}

}
