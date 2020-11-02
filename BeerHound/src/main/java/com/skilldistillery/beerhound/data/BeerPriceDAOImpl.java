package com.skilldistillery.beerhound.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.BeerPrice;

@Service
@Transactional
public class BeerPriceDAOImpl implements BeerPriceDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public BeerPrice create(BeerPrice beerPrice) {
		em.persist(beerPrice);
		return beerPrice;
	}

	@Override
	public boolean delete(int id) {
		BeerPrice bp = em.find(BeerPrice.class, id);
		if (bp == null) {
			return false;
		}
		em.remove(bp);
		return !em.contains(bp);
	}

}
