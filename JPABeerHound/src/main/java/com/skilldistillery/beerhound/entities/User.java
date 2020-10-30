package com.skilldistillery.beerhound.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private Boolean enabled;

	private String role;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String email;

	private String biography;

	private String image;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToMany
	@JoinTable(name = "user_has_bar", joinColumns = @JoinColumn(name = "bar_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<Bar> favoriteBarList;

	@ManyToMany
	@JoinTable(name = "user_has_beer", joinColumns = @JoinColumn(name = "beer_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<Beer> favoriteBeerList;

	
	
	@OneToMany(mappedBy = "user")
	private List<BarRating> barRatings;
	
	@OneToMany(mappedBy = "user")
	private List<BeerRating> beerRatings;
	
	
	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void ListId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void ListUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", biography=" + biography + ", image=" + image + ", createDate=" + createDate + "]";
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
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public String getPassword() {
		return password;
	}

	public void ListPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void ListEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void ListRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void ListFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void ListLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void ListEmail(String email) {
		this.email = email;
	}

	public String getBiography() {
		return biography;
	}

	public void ListBiography(String biography) {
		this.biography = biography;
	}

	public String getImage() {
		return image;
	}

	public void ListImage(String image) {
		this.image = image;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void ListCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public Address getAddress() {
		return address;
	}

	public void ListAddress(Address address) {
		this.address = address;
	}

	public List<Bar> getFavoriteBarList() {
		return favoriteBarList;
	}

	public void ListFavoriteBarList(List<Bar> favoriteBarList) {
		this.favoriteBarList = favoriteBarList;
	}

	public List<Beer> getFavoriteBeerList() {
		return favoriteBeerList;
	}

	public void ListFavoriteBeerList(List<Beer> favoriteBeerList) {
		this.favoriteBeerList = favoriteBeerList;
	}

	public List<BarRating> getBarRatings() {
		return barRatings;
	}

	public void ListBarRatings(List<BarRating> barRatings) {
		this.barRatings = barRatings;
	}

	public List<BeerRating> getBeerRatings() {
		return beerRatings;
	}

	public void ListBeerRatings(List<BeerRating> beerRatings) {
		this.beerRatings = beerRatings;
	}

}
