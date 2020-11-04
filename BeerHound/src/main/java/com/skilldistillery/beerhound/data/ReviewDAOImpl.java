package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Bar;
import com.skilldistillery.beerhound.entities.BarRating;
import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.BeerRating;
import com.skilldistillery.beerhound.entities.User;


@Transactional
@Service
public class ReviewDAOImpl implements ReviewDAO {
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public BarRating addBarRating(BarRating barRating, Bar bar, User loggedInUser) {
	
		BarRating dbBarRating = new BarRating();
		
		dbBarRating.setBar(bar);
		dbBarRating.setStarRating(barRating.getStarRating());
		dbBarRating.setReview(barRating.getReview());
		dbBarRating.setRatingDate(barRating.getRatingDate());
		dbBarRating.setUser(loggedInUser);
		
		em.persist(dbBarRating);
		
		return dbBarRating;
	}

	@Override
	public boolean deleteBarRating(int id) {
		BarRating deleteBarRating = em.find(BarRating.class, id);
		em.remove(deleteBarRating);
		
		boolean deleted =! em.contains(deleteBarRating);
		return deleted;
	}

	@Override
	public BarRating updateBarRating(BarRating barRating) {
		int id = barRating.getId();
		
		BarRating updateBarRating = em.find(BarRating.class, id);
		
		
		updateBarRating.setStarRating(barRating.getStarRating());
		updateBarRating.setReview(barRating.getReview());
		updateBarRating.setRatingDate(barRating.getRatingDate());
		updateBarRating.setUser(barRating.getUser());
		updateBarRating.setBar(barRating.getBar());
		
		em.persist(updateBarRating);
		
		return updateBarRating;
	}
	
	@Override
	public BarRating findBarRating(int id) {
		return em.find(BarRating.class, id);
	}


	@Override
	public BeerRating addBeerRating(BeerRating beerRating, Beer beer, User loggedInUser) {
		
		
		BeerRating dbBeerRating = new BeerRating();
		
		dbBeerRating.setStarRating(beerRating.getStarRating());
		dbBeerRating.setRatingDate(beerRating.getRatingDate());
		dbBeerRating.setReview(beerRating.getReview());
		dbBeerRating.setBeer(beer);
		dbBeerRating.setUser(loggedInUser);
		
		
		em.persist(dbBeerRating);
		
		
		
		return dbBeerRating;
	}

	@Override
	public boolean deleteBeerRating(int id) {
		BeerRating deleteBeerRating = em.find(BeerRating.class, id);
		em.remove(deleteBeerRating);
		
		boolean deleted =! em.contains(deleteBeerRating);
		return deleted;
	}

	@Override
	public BeerRating updateBeerRating(BeerRating beerRating) {
		int id = beerRating.getId();
		
		BeerRating updateBeerRating = em.find(BeerRating.class, id);
		
		updateBeerRating.setStarRating(beerRating.getStarRating());
		updateBeerRating.setRatingDate(beerRating.getRatingDate());
		updateBeerRating.setBeer(beerRating.getBeer());
		updateBeerRating.setUser(beerRating.getUser());
		
		em.persist(updateBeerRating);
		
		return updateBeerRating;
	}

	
	@Override
	public BeerRating findBeerRating(int id) {
		return em.find(BeerRating.class, id);
	}



}
