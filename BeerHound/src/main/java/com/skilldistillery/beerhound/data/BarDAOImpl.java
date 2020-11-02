package com.skilldistillery.beerhound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.beerhound.entities.Bar;

@Transactional
@Service
public class BarDAOImpl implements BarDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Bar createBar(Bar bar) {
		Bar createBar = new Bar();
		createBar.setName(bar.getName());
		createBar.setPhoneNumber(bar.getPhoneNumber());
		createBar.setWebsite(bar.getWebsite());
		createBar.setDescription(bar.getDescription());
		createBar.setAddress(bar.getAddress());
		createBar.setTimeLastUpdated(bar.getTimeLastUpdated());
		createBar.setLogoUrl(bar.getLogoUrl());
		createBar.setBeerPrices(bar.getBeerPrices());
		createBar.setBarRatings(bar.getBarRatings());
		
		em.persist(bar);
		return bar;
	}

	@Override
	public List<Bar> searchBarByKeyWord(String keyword) {
		keyword = "%"+keyword+"%";
		String jpql = "SELECT b FROM Bar b WHERE b.name LIKE :keyword";
		return em.createQuery(jpql, Bar.class).setParameter("keyword", keyword).getResultList();
	}

	@Override
	public Bar updateBar(Integer id, Bar bar) {
		Bar updateBar = em.find(Bar.class, id);
		updateBar.setName(bar.getName());
		updateBar.setPhoneNumber(bar.getPhoneNumber());
		updateBar.setWebsite(bar.getWebsite());
		updateBar.setDescription(bar.getDescription());
		updateBar.setAddress(bar.getAddress());
		updateBar.setTimeLastUpdated(bar.getTimeLastUpdated());
		updateBar.setLogoUrl(bar.getLogoUrl());
		updateBar.setBeerPrices(bar.getBeerPrices());
		updateBar.setBarRatings(bar.getBarRatings());

		em.persist(updateBar);
		em.flush();
		return updateBar;
	}

	@Override
	public boolean deleteBar(int id) {
		Bar deleteBar = em.find(Bar.class, id);
		em.remove(deleteBar);
		
		boolean deleted =! em.contains(deleteBar);
		return deleted;
	}

	@Override
	public Bar findBarById(int id) {
		return em.find(Bar.class, id);
	}

}
