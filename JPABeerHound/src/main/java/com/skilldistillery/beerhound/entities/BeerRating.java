package com.skilldistillery.beerhound.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Table(name="beer_rating")
@Entity
public class BeerRating {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int Id;
	
	@Column(name="star_rating")
	private int starRating;
	
	@Column(name="rating_date")
	private LocalDate ratingDate;

	@ManyToOne
	@JoinColumn(name="beer_id")
	private Beer beer;
	
	private String review;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;


	public BeerRating() {
		super();
	}


	public BeerRating(int id, int starRating, LocalDate ratingDate) {
		super();
		Id = id;
		this.starRating = starRating;
		this.ratingDate = ratingDate;
	}


	public int getId() {
		return Id;
	}


	public void setId(int id) {
		Id = id;
	}


	public int getStarRating() {
		return starRating;
	}


	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}


	public LocalDate getRatingDate() {
		return ratingDate;
	}


	public void setRatingDate(LocalDate ratingDate) {
		this.ratingDate = ratingDate;
	}
	
	
	public Beer getBeer() {
		return beer;
	}


	public void setBeer(Beer beer) {
		this.beer = beer;
	}

	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "BeerRating [Id=" + Id + ", starRating=" + starRating + ", ratingDate=" + ratingDate + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Id;
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
		BeerRating other = (BeerRating) obj;
		if (Id != other.Id)
			return false;
		return true;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}
	
	
}
