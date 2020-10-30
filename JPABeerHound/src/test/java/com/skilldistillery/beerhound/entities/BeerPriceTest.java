package com.skilldistillery.beerhound.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BeerPriceTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BeerPrice beerPrice;
	
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
		beerPrice = em.find(BeerPrice.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		beerPrice = null;
	}

	@Test
	@DisplayName("test beer price entity")
	void test1() {
		assertNotNull(beerPrice);
		assertEquals(1, beerPrice.getId());
		assertEquals(2, beerPrice.getBeerPrice());
	}
	
	@Test
	@DisplayName("test beer price mapping to beer")
	void test2() {
		assertNotNull(beerPrice);
		assertNotNull(beerPrice.getBeer());
		assertEquals("Modus Hoperandi", beerPrice.getBeer().getName());
		
	}
	
	@Test
	@DisplayName("test beer price mapping to bar")
	void test3() {
		assertNotNull(beerPrice);
		assertNotNull(beerPrice.getBar());
		assertEquals("Firefly Saloon", beerPrice.getBar().getName());
		
	}

}
