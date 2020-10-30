package com.skilldistillery.beerhound.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Bar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	private String website;
	
	private Long description;
	
//	@Column(name ="address_id")
//	private int addressId;
	
	@Column(name ="time_last_updated")
	private LocalDate timeLastUpdated;
	
//	@Column(name="owner_id")
//	private int ownerId;
	
	@Column(name="logo_url")
	private String logoUrl;
	
	

	public Bar() {
		super();
	}

	public Bar(int id, String name, String phoneNumber, String website, Long description, int addressId,
			LocalDate timeLastUpdated, int ownerId, String logoUrl) {
		super();
		this.id = id;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.website = website;
		this.description = description;
//		this.addressId = addressId;
		this.timeLastUpdated = timeLastUpdated;
//		this.ownerId = ownerId;
		this.logoUrl = logoUrl;
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

	public Long getDescription() {
		return description;
	}

	public void setDescription(Long description) {
		this.description = description;
	}

//	public int getAddressId() {
//		return addressId;
//	}
//
//	public void setAddressId(int addressId) {
//		this.addressId = addressId;
//	}

	public LocalDate getTimeLastUpdated() {
		return timeLastUpdated;
	}

	public void setTimeLastUpdated(LocalDate timeLastUpdated) {
		this.timeLastUpdated = timeLastUpdated;
	}

//	public int getOwnerId() {
//		return ownerId;
//	}
//
//	public void setOwnerId(int ownerId) {
//		this.ownerId = ownerId;
//	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	@Override
	public String toString() {
		return "Bar [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", website=" + website
				+ ", description=" + description + ", timeLastUpdated=" + timeLastUpdated + ", logoUrl=" + logoUrl
				+ "]";
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
