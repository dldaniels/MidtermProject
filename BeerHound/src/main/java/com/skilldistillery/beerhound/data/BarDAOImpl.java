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
		em.persist(bar);
		return bar;
	}

	@Override
	public List<Bar> searchBarByKeyWord(String keyword) {
//		List <Bar> bar
		
//		return em.find(<Bar>.class, keyword);
		return null;
	}

	@Override
	public Bar updateBar(Bar bar) {
		Bar updateBar = em.find(Bar.class, bar);
		updateBar.setName(bar.getName());
		updateBar.setPhoneNumber(bar.getPhoneNumber());
		updateBar.setWebsite(bar.getWebsite());
		updateBar.setDescription(bar.getDescription());
		updateBar.setAddress(bar.getAddress());
		updateBar.setTimeLastUpdated(bar.getTimeLastUpdated());
		updateBar.setLogoUrl(bar.getLogoUrl());
		
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
