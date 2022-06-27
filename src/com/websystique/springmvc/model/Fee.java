package com.websystique.springmvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Fee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private int id;
	private String fee_type;

	
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFee_type() {
		return fee_type;
	}

	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}

	
}
