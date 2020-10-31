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
 
class BarRatingTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BarRating barRating;
	
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
		barRating = em.find(BarRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		barRating = null;
	}

	@Test
	@DisplayName("test barRating entity")
	void test1() {
		assertNotNull(barRating);
		assertEquals(1, barRating.getId());
		assertEquals(1, barRating.getStarRating());
	}
	
	@Test
	@DisplayName("test bar rating mapping to bar")
	void test2() {
		assertNotNull(barRating);
		assertNotNull(barRating.getBar());
		assertEquals("Firefly Saloon", barRating.getBar().getName());
	}
	
	@Test
	@DisplayName("test bar rating mapping to user")
	void test3() {
		assertNotNull(barRating);
		assertNotNull(barRating.getUser());
		assertEquals("Adam", barRating.getUser().getFirstName());
	}

}
