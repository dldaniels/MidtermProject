package com.skilldistillery.beerhound.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BeerTest {
 
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Beer beer;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		 emf = Persistence.createEntityManagerFactory("BeerHoundPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		beer = em.find(Beer.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		beer = null;
	}

	@Test
	@DisplayName("test beer entity")
	void test1() {
		// TODO: complete entity tests
		assertNotNull(beer);
		assertEquals("Modus Hoperandi", beer.getName());
		assertEquals(7, beer.getAlcoholContent());
	}

	@Test
	@DisplayName("test mapping between beer and type of beer")
	void test2() {
		assertNotNull(beer);
		assertNotNull(beer.getTypeOfBeer());
//		assertTrue(beer.getTypeOfBeer().;
		assertEquals("IPA-American", beer.getTypeOfBeer().getTypeDescription());
	}
	
	@Test
	@DisplayName("test mapping between beer and brewery")
	void test3() {
		assertNotNull(beer);
		assertNotNull(beer.getBrewery());
//		assertTrue(beer.getBrewery().)
		assertEquals("Ska Brewing", beer.getBrewery().getName());
	}
}
