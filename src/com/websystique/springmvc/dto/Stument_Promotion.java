package com.websystique.springmvc.dto;

import java.util.List;

public class Stument_Promotion {
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
private String academic_year;
}
