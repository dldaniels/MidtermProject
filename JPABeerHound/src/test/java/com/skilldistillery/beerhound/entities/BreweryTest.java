package com.skilldistillery.beerhound.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BreweryTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Brewery brewery;

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
		brewery = em.find(Brewery.class, 1);

	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test() {
		assertNotNull(brewery);
		assertEquals("Ska Brewing", brewery.getName());
	}
	
	@Test
	void test_brewery_mapping_to_address() {
		assertNotNull(brewery);
		assertNotNull(brewery.getAddress());
		assertEquals("81303" , brewery.getAddress().getZip());
		assertEquals("Durango" , brewery.getAddress().getCity());
		assertEquals("CO" , brewery.getAddress().getState());
		
		
		
	}
}
