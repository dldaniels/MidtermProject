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

class BeerPricePriceTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BeerPrice beerPrice;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		 emf = Persistence.createEntityManagerFactory("BeerPriceHoundPU");
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
	@DisplayName("test beerPrice entity")
	void test1() {
		// TODO: complete entity tests
		assertNotNull(beerPrice);
		assertEquals("", beerPrice.getId());
	}

}
