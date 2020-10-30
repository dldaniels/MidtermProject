package com.skilldistillery.beerhound.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class TypeOfBeer {
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "type_description")
	private String typeDescription;

	@Column(name = "type_name")
	private String typeName;
	
	@OneToMany(mappedBy = "typeOfBeer")
	private Set<Beer> beers;

	public Set<Beer> getBeers() {
		return beers;
	}

	public void setBeers(Set<Beer> beers) {
		this.beers = beers;
	}

	public TypeOfBeer() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "TypeOfBeer [id=" + id + ", typeDescription=" + typeDescription + ", typeName=" + typeName + "]";
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
		TypeOfBeer other = (TypeOfBeer) obj;
		if (id != other.id)
			return false;
		return true;
	}

}