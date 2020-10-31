package com.skilldistillery.beerhound.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BeerRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BeerRating rating;

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
		rating = em.find(BeerRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		rating = null;
	}

	@Test
	@DisplayName("test beer_rating entity")
	void test1() {
		// TODO: complete entity tests
		assertNotNull(rating);
		assertEquals(2, rating.getStarRating());
	}

	@Test
	@DisplayName("test rating to beer mapping")
	void test2() {
		assertNotNull(rating);
		assertNotNull(rating.getBeer());
		assertEquals("Modus Hoperandi", rating.getBeer().getName());

	}

	@Test
	@DisplayName("test rating to user mapping")
	void test3() {
		assertNotNull(rating);
		assertNotNull(rating.getUser());
		assertEquals("admin", rating.getUser().getUsername());

	}

}
