package com.websystique.springsecurity.util;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.websystique.springmvc.service.UserProfileService;

@Component
public class Studment_Management_Taglib {

	//@Autowired
	//UserProfileService autowiredComponent;


	/*
	private static UserProfileService userProfileService2;

	@Autowired
	private Studment_Management_Taglib(UserProfileService userProfileService1) {
		Studment_Management_Taglib.userProfileService2 = userProfileService1;
	}*/
	
	private static UserProfileService welcome;

	@Autowired
	private UserProfileService welcomeService;

	@PostConstruct
	public void init() {
		System.out.println("Inside Init method");
		this.welcome = welcomeService;
		System.out.println("Outside Init method" + welcome.toString());
	}
	
	
	public static String Certificate_Name(String course_id, String certificate_id) {
		
		
		String certificate_name = "Hemasunder";
		certificate_name = welcome.Certificate_Name(course_id, certificate_id);
		return certificate_name;
	}

}
