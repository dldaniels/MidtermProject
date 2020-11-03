package com.skilldistillery.beerhound.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Beer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "alcohol_content")
	private Double alcoholContent;

	@Column(name = "image_url")
	private String imageUrl;

	private String description;
	

	@ManyToMany(mappedBy = "favoriteBeerList")
	private List<User> users;
	
	@OneToMany(mappedBy="beer")
	private List<BeerRating> beerRating;
	
	@ManyToOne
	@JoinColumn(name = "type_of_beer_id")
	private TypeOfBeer typeOfBeer;
	
	@ManyToOne
	@JoinColumn(name="brewery_id")
	private Brewery brewery;

	@OneToMany(mappedBy="beer")
	private Set<BeerPrice> beerPrice;
	
	public void addUser(User user) {
		if (users == null) {
			users = new ArrayList<>();
		}
		users.add(user);
		user.addBeerToFavorites(this);
	}
	
	public void removeUser(User user) {
		if (users != null) {
			users.remove(user);
		}
		user.removeBeerFromFavorites(this);
	}
	
	@Override
	public String toString() {
		return "Beer [id=" + id + ", name=" + name + ", alcoholContent=" + alcoholContent + ", imageUrl=" + imageUrl
				+ "]";
	}

	public Beer() {
		super();
	}

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

	public Double getAlcoholContent() {
		return alcoholContent;
	}

	public void setAlcoholContent(Double alcoholContent) {
		this.alcoholContent = alcoholContent;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public List<User> getUsers() {
		return users;
	}
	
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	public List<BeerRating> getBeerRating() {
		return beerRating;
	}
	
	public void setBeerRating(List<BeerRating> beerRating) {
		this.beerRating = beerRating;
	}
	

	public Brewery getBrewery() {
		return brewery;
	}

	public void setBrewery(Brewery brewery) {
		this.brewery = brewery;
	}

	public TypeOfBeer getTypeOfBeer() {
		return typeOfBeer;
	}

	public void setTypeOfBeer(TypeOfBeer typeOfBeer) {
		this.typeOfBeer = typeOfBeer;
	}
	

	public Set<BeerPrice> getBeerPrice() {
		return beerPrice;
	}

	public void setBeerPrice(Set<BeerPrice> beerPrice) {
		this.beerPrice = beerPrice;
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
		Beer other = (Beer) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


}
