package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Beer;
import com.skilldistillery.beerhound.entities.Brewery;
import com.skilldistillery.beerhound.entities.TypeOfBeer;

@Transactional
@Service
public class BeerDAOImpl implements BeerDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Beer> findAll() {
		String jpql = "SELECT b FROM Beer b ORDER BY name";
		return em.createQuery(jpql, Beer.class).getResultList();
	}

	@Override
	public Beer findBeer(int id) {
		return em.find(Beer.class, id);
	}

	@Override
	public List<Beer> findByKeyword(String keyword) {
		keyword = "%" + keyword + "%";
		
	//	String jpql = SELECT DISTINCT beer.name, brewery.name, bar.name, FROM Beer beer JOIN  
		
		String jpql = "SELECT DISTINCT b FROM Beer b WHERE b.name LIKE :keyword";
	//	System.out.println( em.createQuery(jpql, Beer.class).setParameter("keyword", keyword).getResultList());
		return em.createQuery(jpql, Beer.class).setParameter("keyword", keyword).getResultList();
	}

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
		addBeer.setDescription(beer.getDescription());

		em.persist(addBeer);

		return beer;
	}

	@Override
	public Beer updateBeer(Integer id, Beer beer) {

		Beer editBeer = em.find(Beer.class, id);

		editBeer.setName(beer.getName());
		// editBeer.setBrewery(beer.getBrewery());
		// editBeer.setTypeOfBeer(beer.getTypeOfBeer());
		editBeer.setAlcoholContent(beer.getAlcoholContent());
		// editBeer.setBeerPrice(beer.getBeerPrice());
		// editBeer.setBeerRating(beer.getBeerRating());
		editBeer.setImageUrl(beer.getImageUrl());
		editBeer.setDescription(beer.getDescription());

		em.persist(editBeer);
		em.flush();

		return editBeer;
	}

	@Override
	public boolean deleteBeer(int id) {
		Beer beer = em.find(Beer.class, id);
		em.remove(beer);
		boolean beerDeleted = !em.contains(beer);
		return beerDeleted;
	}

	@Override
	public Beer findBeerbyName(String name) {
		String jpql = "SELECT b FROM Beer b WHERE b.name = :name";
		Beer result = null;
		try {
			em.createQuery(jpql, Beer.class).setParameter("name", name).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	@Override
	public List<Beer> findByType(int id) {
		String jpql = "SELECT b FROM Beer b WHERE b.typeOfBeer = :id";
		List<Beer> type = em.createQuery(jpql, Beer.class).setParameter("id", id).getResultList();
		return type;
	}

	@Override
	public TypeOfBeer getBeerType(int id) {
		TypeOfBeer typeOfBeer = em.find(TypeOfBeer.class, id);
		return typeOfBeer;
	}

	@Override
	public Brewery getBrewery(int id) {
		Brewery brewery = em.find(Brewery.class, id);
		return brewery;
	}
	
	

}
