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

class BarTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Bar bar;

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
		bar = em.find(Bar.class, 1);

	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test() {
		assertNotNull(bar);
		assertEquals("Firefly Saloon", bar.getName());
		assertEquals("(303) 424-3670", bar.getPhoneNumber());
	}
	
	@Test
	@DisplayName("testing the mapping bar and address")
	void test2() {
		assertNotNull(bar);
		assertNotNull(bar.getAddress());
		assertEquals("80033" , bar.getAddress().getZip());
		assertEquals("Wheat Ridge" , bar.getAddress().getCity());
		assertEquals("CO" , bar.getAddress().getState());

	}

//	@Test
//	@DisplayName("testing the mapping bar and favoriteBarList")
//	void test3() {
//		assertNotNull(bar);
//		assertNotNull(bar.getUsers().size());
//		assertTrue(bar.getUsers().size() > 0);
//		assertEquals("" , bar.getUsers().get(0).getFirstName());
//		assertEquals("" , bar.getUsers().get(0).getLastName());
//		assertEquals(, bar.getUsers().get(0).getId());
//		
//	}
	
	@Test
	@DisplayName("testing the mapping bar and favoriteBarList")
	void test3() {
		assertNotNull(bar);
		assertNotNull(bar.getBeerPrices().size());
		assertTrue(bar.getBeerPrices().size() > 0);
		assertEquals("", bar.getBeerPrices().get(0).getBeer().getName());
		
	}
	
	
	
}
