package com.websystique.springmvc.dto;


public class BranchDTO {

	
	private int course_id;
	private String name;
	private int fee;
	private int id ;
   
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
    
	
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
}
