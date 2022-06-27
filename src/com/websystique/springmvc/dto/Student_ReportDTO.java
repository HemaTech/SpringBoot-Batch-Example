package com.websystique.springmvc.dto;

import java.util.Date;

public class Student_ReportDTO {
	
   private String student_name,fee_type,group_name,status_flag,mobile_no;
	
   private String action,is_present;
   private String certificate_id,board_generated_admission_no,hallticket_no;
   private int course_id,branch_id,id,promotion_id,actual_fee,hostel_fee,previous_fee,hostel_prev_fee;
   private Date attendance_date;
	public String getStudent_name() {
	return student_name;
}

public void setStudent_name(String student_name) {
	this.student_name = student_name;
}

public String getFather_name() {
	return father_name;
}

public void setFather_name(String father_name) {
	this.father_name = father_name;
}

public String getUid_no() {
	return uid_no;
}

public void setUid_no(String uid_no) {
	this.uid_no = uid_no;
}

public String getCourse_name() {
	return course_name;
}

public void setCourse_name(String course_name) {
	this.course_name = course_name;
}

public String getBranch_name() {
	return branch_name;
}

public void setBranch_name(String branch_name) {
	this.branch_name = branch_name;
}

public String getMedium_name() {
	return medium_name;
}

public void setMedium_name(String medium_name) {
	this.medium_name = medium_name;
}

public String getGender_name() {
	return gender_name;
}

public void setGender_name(String gender_name) {
	this.gender_name = gender_name;
}

public int getAdmission_year() {
	return admission_year;
}

public void setAdmission_year(int admission_year) {
	this.admission_year = admission_year;
}

public Date getRegistered_on() {
	return registered_on;
}

public void setRegistered_on(Date registered_on) {
	this.registered_on = registered_on;
}

	private String father_name;
	
	private String uid_no;
	
	private String course_name;
	
	private String branch_name;
	
	private String medium_name;
	
	
	private String gender_name;
	
	private int admission_year;
	
	private Date registered_on;
	private int fee_amount;
	private String receipt_no;
	private String in_words;
	private String academic_year_name;

	private String student_id,name  ,certificate_name, bord_generated_admission_no,certificate_status;
	
	
	public int getFee_amount() {
		return fee_amount;
	}

	public void setFee_amount(int fee_amount) {
		this.fee_amount = fee_amount;
	}

	public String getReceipt_no() {
		return receipt_no;
	}

	public void setReceipt_no(String receipt_no) {
		this.receipt_no = receipt_no;
	}

	public String getIn_words() {
		return in_words;
	}

	public void setIn_words(String in_words) {
		this.in_words = in_words;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCertificate_name() {
		return certificate_name;
	}

	public void setCertificate_name(String certificate_name) {
		this.certificate_name = certificate_name;
	}

	public String getBord_generated_admission_no() {
		return bord_generated_admission_no;
	}

	public void setBord_generated_admission_no(String bord_generated_admission_no) {
		this.bord_generated_admission_no = bord_generated_admission_no;
	}

	public String getCertificate_status() {
		return certificate_status;
	}

	public void setCertificate_status(String certificate_status) {
		this.certificate_status = certificate_status;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getFee_type() {
		return fee_type;
	}

	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getCertificate_id() {
		return certificate_id;
	}

	public void setCertificate_id(String certificate_id) {
		this.certificate_id = certificate_id;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public int getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus_flag() {
		return status_flag;
	}

	public void setStatus_flag(String status_flag) {
		this.status_flag = status_flag;
	}

	public int getPromotion_id() {
		return promotion_id;
	}

	public void setPromotion_id(int promotion_id) {
		this.promotion_id = promotion_id;
	}

	public String getBoard_generated_admission_no() {
		return board_generated_admission_no;
	}

	public void setBoard_generated_admission_no(String board_generated_admission_no) {
		this.board_generated_admission_no = board_generated_admission_no;
	}

	public String getIs_present() {
		return is_present;
	}

	public void setIs_present(String is_present) {
		this.is_present = is_present;
	}

	public int getActual_fee() {
		return actual_fee;
	}

	public void setActual_fee(int actual_fee) {
		this.actual_fee = actual_fee;
	}

	public int getHostel_fee() {
		return hostel_fee;
	}

	public void setHostel_fee(int hostel_fee) {
		this.hostel_fee = hostel_fee;
	}

	public String getHallticket_no() {
		return hallticket_no;
	}

	public void setHallticket_no(String hallticket_no) {
		this.hallticket_no = hallticket_no;
	}

	public int getPrevious_fee() {
		return previous_fee;
	}

	public void setPrevious_fee(int previous_fee) {
		this.previous_fee = previous_fee;
	}

	public int getHostel_prev_fee() {
		return hostel_prev_fee;
	}

	public void setHostel_prev_fee(int hostel_prev_fee) {
		this.hostel_prev_fee = hostel_prev_fee;
	}

	public String getAcademic_year_name() {
		return academic_year_name;
	}

	public void setAcademic_year_name(String academic_year_name) {
		this.academic_year_name = academic_year_name;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public Date getAttendance_date() {
		return attendance_date;
	}

	public void setAttendance_date(Date attendance_date) {
		this.attendance_date = attendance_date;
	}
	
	
	
}
