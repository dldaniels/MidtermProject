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

class UserTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("entity test")
	void test1() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("Adam", user.getFirstName());
		assertEquals("Adminson", user.getLastName());
		assertEquals(1, user.getId());
	}
	

	@Test
	@DisplayName("test mapping between user and address")
	void test2() {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals("Denver" , user.getAddress().getCity());
		assertEquals("CO" , user.getAddress().getState());
		assertEquals("80221" , user.getAddress().getZip());
	}
	
//	@Test
//	@DisplayName("test mapping between user and bar")
//	void test3() {
//		assertNotNull(user);
//		assertNotNull(user.getFavoriteBarList());
//		assertTrue(user.getFavoriteBarList().size() > 0);
//		assertEquals("" , user.getFavoriteBarList().get(0).getName());
//		assertEquals("" , user.getFavoriteBarList().get(0).getId());
//			
//	}
//	
////	
//	@Test
//	@DisplayName("test mapping between user and beer")
//	void test4() {
//		assertNotNull(user);
//		assertNotNull(user.getFavoriteBeerList());
//		assertEquals("" , user.getFavoriteBeerList().get(0).getName());
//		assertEquals("" , user.getFavoriteBeerList().get(0).getTypeOfBeer());
//		assertEquals("" , user.getFavoriteBeerList().get(0).getId());
//	}
//	
//	@Test
//	@DisplayName("STRETCH GOAL test mapping between user and barRatings")
//	void test5() {
//		assertNotNull(user);
//		assertNotNull(user.getBarRatings());
//		assertTrue(user.getBarRatings().size() > 0);
//		assertEquals("" , user.getBarRatings().get(0).getBar().getId());
//		assertEquals("" , user.getBarRatings().get(0).getBar().getName());
//		assertEquals("" , user.getBarRatings().get(0).getBar().getAddress().getCity());
//	}
////
//	@Test
//	@DisplayName("STRETCH GOAL test mapping between user and beerRatings")
//	void test6() {
//	assertNotNull(user);
//	assertNotNull(user.getBeerRatings());
//	assertTrue(user.getBeerRatings().size() > 0);
//	assertEquals("" , user.getBeerRatings().get(0).getBeer().getId());
//	assertEquals("" , user.getBeerRatings().get(0).getBeer().getBeerPrice());
//	assertEquals("" , user.getBeerRatings().get(0).getBeer().getBrewery().getName());
//	}
//	
	
	
}
