package com.skilldistillery.beerhound.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Brewery {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="brewery_website")
	private String breweryWebsite;
	
	@Column(name="brewery_logo_url")
	private String breweryLogoUrl;
	
	
	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;
	
	
	@OneToMany(mappedBy = "brewery")
	private Set<Beer> beers;
	

	public Brewery() {
		super();
	}

//	public Brewery(int id, String name, String breweryWebsite, String breweryLogoUrl) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.breweryWebsite = breweryWebsite;
//		this.breweryLogoUrl = breweryLogoUrl;
//	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBreweryWebsite() {
		return breweryWebsite;
	}

	public void setBreweryWebsite(String breweryWebsite) {
		this.breweryWebsite = breweryWebsite;
	}

	public String getBreweryLogoUrl() {
		return breweryLogoUrl;
	}

	public void setBreweryLogoUrl(String breweryLogoUrl) {
		this.breweryLogoUrl = breweryLogoUrl;
	}

	@Override
	public String toString() {
		return "Brewery [id=" + id + ", name=" + name + ", breweryWebsite=" + breweryWebsite + ", breweryLogoUrl="
				+ breweryLogoUrl + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Brewery other = (Brewery) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Set<Beer> getBeers() {
		return beers;
	}

	public void setBeers(Set<Beer> beers) {
		this.beers = beers;
	}
	
}
