package com.skilldistillery.beerhound.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BeerPrice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "beer_price")
	private Double beerPrice;
	
	@Column(name = "size_price")
	private Double sizePrice;
	
	@ManyToOne
	@JoinColumn(name = "beer_id")
	private Beer beer;
	
	@ManyToOne
	@JoinColumn(name = "bar_id")
	private Bar bar;

	public Beer getBeer() {
		return beer;
	}

	public void setBeer(Beer beer) {
		this.beer = beer;
	}

	public Bar getBar() {
		return bar;
	}

	public void setBar(Bar bar) {
		this.bar = bar;
	}

	public BeerPrice() {
		super();
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
		BeerPrice other = (BeerPrice) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BeerPrice [id=" + id + ", beerPrice=" + beerPrice + ", sizePrice=" + sizePrice + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getBeerPrice() {
		return beerPrice;
	}

	public void setBeerPrice(Double beerPrice) {
		this.beerPrice = beerPrice;
	}

	public Double getSizePrice() {
		return sizePrice;
	}

	public void setSizePrice(Double sizePrice) {
		this.sizePrice = sizePrice;
	}
	

}
