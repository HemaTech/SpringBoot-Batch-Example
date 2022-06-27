package com.websystique.springmvc.dto;

import java.util.List;

public class Branch_CourseDTO {
private List<BranchDTO> bt;
private List<CourseDTO> ct;
public List<BranchDTO> getBt() {
	return bt;
}
public void setBt(List<BranchDTO> bt) {
	this.bt = bt;
}
public List<CourseDTO> getCt() {
	return ct;
}
public void setCt(List<CourseDTO> ct) {
	this.ct = ct;
}



}
