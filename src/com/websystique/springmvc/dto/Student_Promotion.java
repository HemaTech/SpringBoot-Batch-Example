package com.websystique.springmvc.dto;

import java.util.List;

public class Student_Promotion {
private List<Student_Info_Promotion> student_info_promotion;

public List<Student_Info_Promotion> getStudent_info_promotion() {
	return student_info_promotion;
}

public void setStudent_info_promotion(List<Student_Info_Promotion> student_info_promotion) {
	this.student_info_promotion = student_info_promotion;
}
public String getAcademic_year() {
	return academic_year;
}

public void setAcademic_year(String academic_year) {
	this.academic_year = academic_year;
}
public String getPrevious_course_id() {
	return previous_course_id;
}

public void setPrevious_course_id(String previous_course_id) {
	this.previous_course_id = previous_course_id;
}
public String getPrevious_academic_year() {
	return previous_academic_year;
}

public void setPrevious_academic_year(String previous_academic_year) {
	this.previous_academic_year = previous_academic_year;
}
private String academic_year;
private String previous_course_id;
private String previous_academic_year;

}
