package com.skilldistillery.beerhound.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Bar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "phone_number")
	private String phoneNumber;

	private String website;

	private String description;

//	@Column(name ="address_id")
//	private int addressId;

	@Column(name = "time_last_updated")
	@UpdateTimestamp
	private LocalDateTime timeLastUpdated;

//	@Column(name="owner_id")
//	private int ownerId;

	@Column(name = "logo_url")
	private String logoUrl;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToMany(mappedBy = "favoriteBarList")
	private List<User> users;

	@OneToMany(mappedBy = "bar")
	private List<BeerPrice> beerPrices;
	
	@OneToMany(mappedBy = "bar")
	private List<BarRating> barRatings;
	
	public void addUser(User user) {
		if (users == null) {
			users = new ArrayList<>();
		}
		users.add(user);
		if (!user.getFavoriteBarList().contains(this)) {
			user.addBarToFavorites(this);
			
		}
	}
	
	public void removeUser(User user) {
		if (users != null) {
			users.remove(user);
		}
		user.removeBarFromFavorites(this);
	}
	
	
	public Bar() {
		super();
	}
	
	

	
	

//	public Bar(int id, String name, String phoneNumber, String website, String description, ,
//			LocalDate timeLastUpdated, int ownerId, String logoUrl) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.phoneNumber = phoneNumber;
//		this.website = website;
//		this.description = description;
////		this.addressId = addressId;
//		this.timeLastUpdated = timeLastUpdated;
////		this.ownerId = ownerId;
//		this.logoUrl = logoUrl;
//	}
	

	public int getId() {
		return id;
	}






	public Bar(int id, String name, String phoneNumber, String website, String description, LocalDateTime timeLastUpdated,
		String logoUrl, Address address, List<User> users, List<BeerPrice> beerPrices, List<BarRating> barRatings) {
	super();
	this.id = id;
	this.name = name;
	this.phoneNumber = phoneNumber;
	this.website = website;
	this.description = description;
	this.timeLastUpdated = timeLastUpdated;
	this.logoUrl = logoUrl;
	this.address = address;
	this.users = users;
	this.beerPrices = beerPrices;
	this.barRatings = barRatings;
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






	public String getPhoneNumber() {
		return phoneNumber;
	}






	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}






	public String getWebsite() {
		return website;
	}






	public void setWebsite(String website) {
		this.website = website;
	}






	public String getDescription() {
		return description;
	}






	public void setDescription(String description) {
		this.description = description;
	}






	public LocalDateTime getTimeLastUpdated() {
		return timeLastUpdated;
	}






	public void setTimeLastUpdated(LocalDateTime timeLastUpdated) {
		this.timeLastUpdated = timeLastUpdated;
	}






	public String getLogoUrl() {
		return logoUrl;
	}






	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}






	public Address getAddress() {
		return address;
	}






	public void setAddress(Address address) {
		this.address = address;
	}






	public List<User> getUsers() {
		return users;
	}






	public void setUsers(List<User> users) {
		this.users = users;
	}






	public List<BeerPrice> getBeerPrices() {
		return beerPrices;
	}






	public void setBeerPrices(List<BeerPrice> beerPrices) {
		this.beerPrices = beerPrices;
	}






	public List<BarRating> getBarRatings() {
		return barRatings;
	}






	public void setBarRatings(List<BarRating> barRatings) {
		this.barRatings = barRatings;
	}






//	@Override
//	public String toString() {
//		return "Bar [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", website=" + website
//				+ ", description=" + description + ", timeLastUpdated=" + timeLastUpdated + ", logoUrl=" + logoUrl
//				+ "]";
//	}

	@Override
	public String toString() {
		return "Bar [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", website=" + website
				+ ", description=" + description + ", timeLastUpdated=" + timeLastUpdated + ", logoUrl=" + logoUrl
				+ ", address=" + address + ", users=" + users + ", beerPrices=" + beerPrices + ", barRatings="
				+ barRatings + "]";
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
		Bar other = (Bar) obj;
		if (id != other.id)
			return false;
		return true;
	}


	

//	@Override
//	public String toString() {
//		return "Bar [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", website=" + website
//				+ ", description=" + description + ", addressId=" + addressId + ", timeLastUpdated=" + timeLastUpdated
//				+ ", ownerId=" + ownerId + ", logoUrl=" + logoUrl + "]";
//	}

}
