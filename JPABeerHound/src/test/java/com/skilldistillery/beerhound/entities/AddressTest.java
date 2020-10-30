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

class AddressTest {


	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;
	
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
		address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		address = null;
	}
	
	
	@Test
	@DisplayName("test address entity")
	void test() {
		
		/*
		 * mysql> select * from address where id = 1;
+----+----------------------+--------+-------+-------+
| id | street               | city   | state | zip   |
+----+----------------------+--------+-------+-------+
|  1 | 189 S Washington st. | Denver | CO    | 80221 |
+----+----------------------+--------+-------+-------+
		 */
		assertNotNull(address);
		assertEquals("189 S Washington st.", address.getStreet());
		assertEquals("Denver", address.getCity());
		assertEquals("CO", address.getState());
		assertEquals("80221", address.getZip());
		assertEquals(1, address.getId());
		
		
	}

}
