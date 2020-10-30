package com.skilldistillery.beerhound.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BarRating {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "star_rating")
	private Integer starRating;
	
	private String review;
	
	@Column(name = "rating_date")
	private LocalDateTime ratingDate;

	public BarRating() {
		super();
	}

	@Override
	public String toString() {
		return "BarRating [id=" + id + ", starRating=" + starRating + ", review=" + review + ", ratingDate="
				+ ratingDate + "]";
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
		BarRating other = (BarRating) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getStarRating() {
		return starRating;
	}

	public void setStarRating(Integer starRating) {
		this.starRating = starRating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public LocalDateTime getRatingDate() {
		return ratingDate;
	}

	public void setRatingDate(LocalDateTime ratingDate) {
		this.ratingDate = ratingDate;
	}
	
}
