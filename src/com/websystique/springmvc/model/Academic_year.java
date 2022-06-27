package com.websystique.springmvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Academic_year {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String academic_year_name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAcademic_year_name() {
		return academic_year_name;
	}

	public void setAcademic_year_name(String academic_year_name) {
		this.academic_year_name = academic_year_name;
	}

}
