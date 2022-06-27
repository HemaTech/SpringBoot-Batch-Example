package com.websystique.springmvc.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.List;









import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="gmap_details")
public class Gmap_POJO implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

public String getCountry_name() {
	return country_name;
}

public void setCountry_name(String country_name) {
	this.country_name = country_name;
}

public String getCountry_code() {
	return country_code;
}

public void setCountry_code(String country_code) {
	this.country_code = country_code;
}

public String getState_name() {
	return state_name;
}

public void setState_name(String state_name) {
	this.state_name = state_name;
}

public String getState_code() {
	return state_code;
}

public void setState_code(String state_code) {
	this.state_code = state_code;
}

public String getCity_name() {
	return city_name;
}

public void setCity_name(String city_name) {
	this.city_name = city_name;
}

public String getCity_code() {
	return city_code;
}

public void setCity_code(String city_code) {
	this.city_code = city_code;
}

public String getObject_name() {
	return object_name;
}

public void setObject_name(String object_name) {
	this.object_name = object_name;
}

public String getArea_location() {
	return area_location;
}

public void setArea_location(String area_location) {
	this.area_location = area_location;
}

public String getLat() {
	return lat;
}

public void setLat(String lat) {
	this.lat = lat;
}

public String getLng() {
	return lng;
}

public void setLng(String lng) {
	this.lng = lng;
}

public String getPincode() {
	return pincode;
}

public void setPincode(String pincode) {
	this.pincode = pincode;
}

public String getMode_type() {
	return mode_type;
}

public void setMode_type(String mode_type) {
	this.mode_type = mode_type;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getStreet_name() {
	return street_name;
}

public void setStreet_name(String street_name) {
	this.street_name = street_name;
}

public String getPhone_number() {
	return phone_number;
}

public void setPhone_number(String phone_number) {
	this.phone_number = phone_number;
}

public Blob getDoc_type_image() {
	return doc_type_image;
}

public void setDoc_type_image(Blob doc_type_image) {
	this.doc_type_image = doc_type_image;
}

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

private String country_name, country_code, state_name,state_code,city_name, city_code,object_name,area_location,lat,lng,pincode,mode_type,address,street_name;
private String phone_number;

//@Column(name = "enclosure")
private Blob  doc_type_image;

}
