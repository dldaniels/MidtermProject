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

class TypeOfBeerTest {


	private static EntityManagerFactory emf;
	private EntityManager em;
	private TypeOfBeer type;
	
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
		type = em.find(TypeOfBeer.class, 7);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		type = null;
	}
	
	
	@Test
	void test() {
		assertNotNull(type);
		assertEquals(7, type.getId());
		
	}
	
	@Test
	@DisplayName("testing typeofbeer to beer")
	void test2(){
		assertNotNull(type);
		assertNotNull(type.getBeers());
		assertTrue(type.getBeers().size() > 0);
		assertEquals(1, type.getBeers().size());
	}

}
