package com.websystique.springmvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Attendance {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAttendance_type() {
		return attendance_type;
	}

	public void setAttendance_type(String attendance_type) {
		this.attendance_type = attendance_type;
	}

	private String attendance_type;
}
