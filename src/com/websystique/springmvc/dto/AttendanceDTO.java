package com.websystique.springmvc.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class AttendanceDTO {

	private int id ;
   
    
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
