package com.websystique.springmvc.dto;


public class FeeDTO {

	
	private String fee_type;

	private int id ;
   
    
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
	
	public String getPrevious_fee() {
		return previous_fee;
	}
	public void setPrevious_fee(String previous_fee) {
		this.previous_fee = previous_fee;
	}

	public String getCurrent_fee() {
		return current_fee;
	}
	public void setCurrent_fee(String current_fee) {
		this.current_fee = current_fee;
	}

	public String getHostel_previous_fee() {
		return hostel_previous_fee;
	}
	public void setHostel_previous_fee(String hostel_previous_fee) {
		this.hostel_previous_fee = hostel_previous_fee;
	}

	private String previous_fee;
	private String hostel_previous_fee;
	
	private String current_fee;
	
}
