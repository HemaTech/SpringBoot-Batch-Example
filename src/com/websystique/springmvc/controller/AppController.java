package com.websystique.springmvc.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.log.SysoLogger;
import com.websystique.springmvc.dto.Admission_Receipt;
import com.websystique.springmvc.dto.Branch_CourseDTO;
import com.websystique.springmvc.dto.Certificate_Master_DTO;
import com.websystique.springmvc.dto.CourseDTO;
import com.websystique.springmvc.dto.FeeDTO;
import com.websystique.springmvc.dto.GenderDTO;
import com.websystique.springmvc.dto.MediumDTO;
import com.websystique.springmvc.dto.Student_ReportDTO;
//import com.websystique.springmvc.model.Gmap_Model;
import com.websystique.springmvc.model.User;
import com.websystique.springmvc.model.UserProfile;
import com.websystique.springmvc.service.UserProfileService;
import com.websystique.springmvc.service.UserService;



@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {

	@Autowired
	UserService userService;
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@Value("${my.port}")
	private String myport;//="192.168.0.32";
	
	
	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = { "/", "/list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {

		System.out.println("==========="+myport);
		
		List<UserProfile> mainList = new ArrayList<UserProfile>();
		List<User> users = userService.findAllUsers();
		User user=	userService.findBySSO(getPrincipal());
		mainList.addAll(user.getUserProfiles());
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("IP_ADDRESS",myport);
		
	if(mainList.get(0).getType().equalsIgnoreCase("ADMIN"))
	{
		
		return "userslist";
	}
	else if(mainList.get(0).getType().equalsIgnoreCase("USER"))
	{
		List<Student_ReportDTO> cert_list=userProfileService.getApprovedCertificates_Details();
		model.put("cert_list", cert_list);
		return "ApprovalAuthorityDashboard";
	}
	else 
	{
		return "index";
	}
		
	}

	
	
	
	
	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
		 * and applying it on field [sso] of Model class [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
		 * framework as well while still using internationalized messages.
		 * 
		 */
		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
		    result.addError(ssoError);
			return "registration";
		}
		
		userService.saveUser(user);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		//return "success";
		return "registrationsuccess";
	}


	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result,
			ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*//Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which is a unique key to a User.
		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
		    result.addError(ssoError);
			return "registration";
		}*/


		userService.updateUser(user);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "registrationsuccess";
	}

	
	/**
	 * This method will delete an user by it's SSOID value.
	 */
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/list";
	}
	

	/**
	 * This method will provide UserProfile list to views
	 */
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}
	
	/**
	 * This method handles Access-Denied redirect.
	 */
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}

	/**
	 * This method handles login GET requests.
	 * If users is already logged-in and tries to goto login page again, will be redirected to list page.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
	    } else {
	    	return "redirect:/list";  
	    }
	}

	/**
	 * This method handles logout requests.
	 * Toggle the handlers if you are RememberMe functionality is useless in your app.
	 */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			//new SecurityContextLogoutHandler().logout(request, response, auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
		
	}

	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	/**
	 * This method returns true if users is already authenticated [logged-in], else false.
	 */
	private boolean isCurrentAuthenticationAnonymous() {
	    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    return authenticationTrustResolver.isAnonymous(authentication);

	}

	
	
	
	
	
	
	
	
	@RequestMapping(value = {"/studentcreate" }, method = RequestMethod.GET)
	public ModelAndView getstudentcreate( ModelMap model) {

		
		model.addAttribute("loggedinuser", getPrincipal());
	
		
		
		 return new ModelAndView("StudentCreate",model);
	}
	
	@RequestMapping(value = {"/student_reports" }, method = RequestMethod.GET)
	public ModelAndView getStudentsReports( ModelMap model) {

		
		List<User> users = userService.findAllUsers();
		
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		
		model.addAttribute("loggedinuser", getPrincipal());
	
		
		
		 return new ModelAndView("StudentReports",model);
	}
	
	@RequestMapping(value = {"/student_info" }, method = RequestMethod.GET)
	public ModelAndView getStudentsInfo( ModelMap model,@RequestParam String hidden_uid,@RequestParam String hidden_id) {

		
		model.addAttribute("loggedinuser", getPrincipal());
	
		
		model.addAttribute("hidden_uid", hidden_uid);
		model.addAttribute("hidden_id", hidden_id);
		
List<Certificate_Master_DTO> cetificate=new ArrayList<Certificate_Master_DTO>();
		
		cetificate=userProfileService.getCerticateDetails(hidden_id);
		model.put("cetificate", cetificate);
		
		 return new ModelAndView("StudentInfo",model);
	}
	
	@RequestMapping(value = {"/student_creation_form" }, method = RequestMethod.GET)
	public ModelAndView getStudentCreationForm( ModelMap model) {

		
		model.addAttribute("loggedinuser", getPrincipal());
	
		
		
		 return new ModelAndView("StudentCreationForm",model);
	}
	
	
	@RequestMapping(value = {"/course" }, method = RequestMethod.GET,produces = "application/json" )
	@ResponseBody
	public  List<CourseDTO> getCourse(HttpServletRequest request, HttpServletResponse response) {

		
		
	
		List<CourseDTO> courselist=userProfileService.getCourses();
		
		
		 return courselist;
	}
	
	@RequestMapping(value = {"/branch" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody Branch_CourseDTO getBranches(HttpServletRequest request, HttpServletResponse response,@RequestParam String course_id) {

		
		
	
		Branch_CourseDTO courselist=userProfileService.getBranches(Integer.valueOf(course_id));
		
		
		 return courselist;
	}
	
	
	@RequestMapping(value = {"/branch_fee" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody FeeDTO getBranch_Fee(HttpServletRequest request, HttpServletResponse response,@RequestParam String course_id,@RequestParam String branch_id) {

		
		
	    String uid_no=request.getParameter("uid_no");
	    FeeDTO fee=null;
	    if(uid_no!=null)
	    {
		 fee=userProfileService.getBranch_Course_Fee(Integer.valueOf(course_id),Integer.valueOf(branch_id),uid_no);
		
	    }
		 return fee;
	}
	
	
	
	@RequestMapping(value = {"/medium" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody List<MediumDTO> getMediums(HttpServletRequest request, HttpServletResponse response) {

		
		
	
		List<MediumDTO> mediumlist=userProfileService.getMediums();
		
		
		 return mediumlist;
	}
	
	@RequestMapping(value = {"/gender" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody List<GenderDTO> getGenders(HttpServletRequest request, HttpServletResponse response) {

		
		
	
		List<GenderDTO> genderlist=userProfileService.getGenders();
		
		
		 return genderlist;
	}
	
	
	@RequestMapping(value = {"/feetypes" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody List<FeeDTO> getFeesTypes(HttpServletRequest request, HttpServletResponse response) {

		
		
	
		List<FeeDTO> feeslist=userProfileService.getFeesTypes();
		
		
		 return feeslist;
	}
	
	
	@RequestMapping(value = {"/generateadmissionno" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody Admission_Receipt getGenerateAdmissionNo(HttpServletRequest request, HttpServletResponse response) {

		Admission_Receipt ar=null;
		
	String uid_no=request.getParameter("uid_no");
	
		ar=userProfileService.getGenerateAdmissionNo(uid_no);
		
		
		 return ar;
	}
	
	@RequestMapping(value = {"/studentuidbaseinfo" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody Student_ReportDTO getByStudent_By_Uid_Info(HttpServletRequest request, HttpServletResponse response) {
    
		Student_ReportDTO sr=new Student_ReportDTO();
		
		String uid_no=request.getParameter("uid_no");
		
		
		
		
		//mainList.get(0).getType().equalsIgnoreCase("ADMIN")
		
	if(uid_no!=null)
	{
		if(!uid_no.equalsIgnoreCase("") )
		{
		sr=userProfileService.findByStudent_By_Uid_Info(uid_no);
		}
		else
		{
			
			sr.setStatus_flag("0");
		}
	
	}
	else
	{
		
		sr.setStatus_flag("0");
	}
		
		 return sr;
	}
	@RequestMapping(value = {"/student-coursecompletedetails" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody String courseComplteDetails(@RequestParam String uid_no)
	
	{
		
		String courseCompletStatus=userProfileService.courseComplteDetails(uid_no);
		System.out.println("courseCompletStatus xx"+courseCompletStatus);
		String status=null;
		
		
		if(courseCompletStatus.equalsIgnoreCase("false") )
		{
			status="0" ;
		}
		else
		{
			status="1";
		}
		
		
		
		return status;
		
	}
	
	@RequestMapping(value = {"/print_receipt_no" }, method = RequestMethod.GET,produces = "application/json")
	public ModelAndView  getprint_receipt_no_Details(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

		Student_ReportDTO sr=null;
		
	String receipt_no=request.getParameter("receipt_no");
	String course_name=request.getParameter("course_name");
	String college_label="";
	
	if(course_name.equalsIgnoreCase("1"))
	{
		college_label="SREE SAI SIDDHARTHA JUNIOR COLLEGE";
	}
	else	if(course_name.equalsIgnoreCase("2"))
	{
		college_label="SREE SAI SIDDHARTHA DEGREE COLLEGE";
	}
	else
	{
		college_label="SREE KOLLA APPALA NAIDU COLLEGE OF EDUCATION";
	}
		sr=userProfileService.printReceipt_Details(receipt_no);
		Date dbdate=sr.getRegistered_on();
		
		 DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	     String convertDate = formatter.format(dbdate);
		
		model.addAttribute("printdetails", sr);
		model.addAttribute("course_name", course_name);
		model.addAttribute("college_label", college_label);
		model.addAttribute("dbdate", convertDate);
		
		 return new ModelAndView("PrintReceiptDetails",model);
	}
	
	@RequestMapping(value = {"/certificates" }, method = RequestMethod.GET,produces = "application/json")
	public  void getCerticateDetails(HttpServletRequest request, HttpServletResponse response,@RequestParam String course_id,ModelMap model) {

		
		List<Certificate_Master_DTO> cetificate=null;
		
		cetificate=userProfileService.getCerticateDetails(course_id);
		model.addAttribute("cetificate", cetificate);
		
		
	}
	
	@RequestMapping(value = {"/student_promoted_students_view_page" }, method = RequestMethod.GET,produces = "application/json")
	public  ModelAndView getPromoted_View_Page(HttpServletRequest request, HttpServletResponse response,ModelMap model) 

		{
		return new ModelAndView("Promotion_Module",model);
		}
	
	
	@RequestMapping(value = {"/student_promoted_students_view" }, method = RequestMethod.GET,produces = "application/json")
	public  ModelAndView getPromoted_View(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

		model.addAttribute("loggedinuser", getPrincipal());
		String courseName="";
		String branchName="";
		String academicYear="";
		
		String 	course_id=request.getParameter("course_id");
		String 	academic_year=	request.getParameter("academic_year");
		String 	branch_id=	request.getParameter("branch_id");
		
		List<Student_ReportDTO> promoted_list=new ArrayList<Student_ReportDTO>();
		if(course_id!=null && academic_year!=null && branch_id!=null)
		{
		promoted_list=userProfileService.getPromoteStudentDetails(course_id,academic_year,branch_id);
		
		}
		
		if(course_id!=null) {
		courseName=userProfileService.courseName(course_id);
		}
		if(branch_id!=null) {
			branchName=userProfileService.branchName(course_id,branch_id);	
		}
		if (academic_year !=null) {
			academicYear=userProfileService.academicYear(academic_year);
		}
		
		
		model.addAttribute("courseName", courseName);
		model.addAttribute("branchName", branchName);
		model.addAttribute("academicYear", academicYear);
		
		
		model.addAttribute("course_id", course_id);
		model.addAttribute("academic_year", academic_year);
		
		model.addAttribute("promoted_list", promoted_list);
		
		
		
		
		return new ModelAndView("Promotion_Module",model);
		
		
	}
	
	@RequestMapping(value = {"/student_promoted_students_action" })
	public  ModelAndView getPromoted_Students(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		
		
	String student_info[]=	request.getParameterValues("student_info");
	String promotion_id=null;
		
		StringJoiner joinNames = new StringJoiner(",");
		List<Student_ReportDTO> promoted_list=new ArrayList<Student_ReportDTO>();
		for(String  sif: student_info )
		{
			
		String sap_values[]=	sif.split("\\#");
			String student_id=sap_values[0];
			promotion_id=sap_values[1];
			joinNames.add(student_id);
			
		}
		promoted_list=	userProfileService.getPromoteStudentActions(joinNames.toString(), promotion_id);
		model.put("promoted_list_result", promoted_list);
		
		
		return new ModelAndView("Promotion_Module",model);	
	}
	
	
	
	@RequestMapping(value = {"/searchidex" }, method = RequestMethod.GET,produces = "application/json")
	public  @ResponseBody List<String> getSearchindex(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

		
		
		//String index_name="Balaji";
		List<String> list=userProfileService.StudentIndexSearch(null);
		
		
		return list;
	}
	
	
	//// Approve status
	
	@RequestMapping(value = "/student_approveStatus")
	public @ResponseBody String approveStatusUpdate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String action, @RequestParam String student_id,@RequestParam String certificate_id) {

		
		int status = 0;
		String result = null;
		if(action.equalsIgnoreCase("1"))
		{
			action="3";
			
		}
		if(action.equalsIgnoreCase("2"))
		{
			action="4";
			
		}
		 status=userProfileService.approveStatusUpdate(action,student_id,certificate_id);
			if (status <= 0) {
				result = "Transaction Failed!";
			} else {
				result = "Success";
			}
		
		
          return result;
	}
//	@RequestMapping(value = {"/student_info_reports" }, method = RequestMethod.GET,produces = "application/json")
//	public  ModelAndView student_info_reports(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
//
//		
//		
//		
//		//List<String> list=userProfileService.StudentIndexSearch(index_name);
//		
//		
//		return new ModelAndView("Student_Module_Report",model);	
//	}
	
	
	@RequestMapping(value = {"/student_promoted_students_view_reports" }, method = RequestMethod.GET,produces = "application/json")
	public  ModelAndView getStudent_course_branch_report(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

		model.addAttribute("loggedinuser", getPrincipal());
		
	String 	course_id=request.getParameter("course_id");
	String 	academic_year=	request.getParameter("academic_year");
	String 	branch_id=	request.getParameter("branch_id");
		List<Student_ReportDTO> promoted_list=new ArrayList<Student_ReportDTO>();
		if(course_id!=null && academic_year!=null)
		{
		promoted_list=userProfileService.getPromoteStudentDetails(course_id,academic_year,branch_id);
		
		}
		
		model.addAttribute("course_id", course_id);
		model.addAttribute("academic_year", academic_year);
		
		model.addAttribute("promoted_list", promoted_list);
		
		
		
		
		return new ModelAndView("Promotion_Module",model);
		
		
	}
	
	
	@RequestMapping(value = {"/student_admission_students_view" }, method = RequestMethod.GET)
	public  ModelAndView getAdmission_View(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

		model.addAttribute("loggedinuser", getPrincipal());
		String courseName=null;
		String branchName=null;
		String academicYear=null;
	String 	course_id=request.getParameter("course_id");
	String 	academic_year=	request.getParameter("academic_year");
	String 	branch_id=	request.getParameter("branch_id");
		List<Student_ReportDTO> admission_list=new ArrayList<Student_ReportDTO>();
		if(course_id!=null && academic_year!=null && branch_id!=null)
		{
			admission_list=userProfileService.getAdmissionStudentDetails(course_id,academic_year,branch_id);
		
		}
		
		if(course_id !=null) {
			courseName=userProfileService.courseName(course_id);	
		}
		if(branch_id!=null) {
			branchName=userProfileService.branchName(course_id,branch_id);
		}
		if(academic_year!=null) {
		 academicYear=userProfileService.academicYear(academic_year);
		}
		
		model.addAttribute("courseName", courseName);
		model.addAttribute("branchName", branchName);
		model.addAttribute("academicYear", academicYear);
		
		
		model.addAttribute("course_id", course_id);
		model.addAttribute("academic_year", academic_year);
		model.addAttribute("admission_list", admission_list);
		
		
		
		
		return new ModelAndView("Admission_Module",model);
		
		
	}
	
	
	@RequestMapping(value = {"/student_admission_students_action" })
	public  @ResponseBody String getAdmission_View_Action(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		
		
	
		
		
		List<Student_ReportDTO> promoted_list=new ArrayList<Student_ReportDTO>();
		
		String student_id=request.getParameter("student_id");
		String board_generated_admission_no=request.getParameter("board_generated_admission_no");
		
	System.out.println(student_id+"\t"+board_generated_admission_no);
		model.put("promoted_list_result", promoted_list);
		
		
		return null;	
	}
	
	
	
	@RequestMapping(value = {"/student_attendence_information" }, method = RequestMethod.GET,produces = "application/json")
	public  ModelAndView student_attendence_information(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

		
		String courseName=null;
		String branchName=null;
		String academicYear=null;
		String 	course_id=request.getParameter("course_id");
		String 	academic_year=	request.getParameter("academic_year");
		String 	branch_id=	request.getParameter("branch_id");
			List<Student_ReportDTO> attendence_list=new ArrayList<Student_ReportDTO>();
			if(course_id!=null && academic_year!=null && branch_id!=null)
			{
			attendence_list=userProfileService.getHostelAttendenceInformation(course_id,academic_year,branch_id);
			
			}
			
			if(course_id!=null) {
			courseName=userProfileService.courseName(course_id);
			}
			if(branch_id!=null) {
				branchName=userProfileService.branchName(course_id,branch_id);
			}
			if(academic_year!=null) {
				academicYear=userProfileService.academicYear(academic_year);
			}
			model.addAttribute("courseName", courseName);
			model.addAttribute("branchName", branchName);
			model.addAttribute("academicYear", academicYear);
			
			model.addAttribute("course_id", course_id);
			model.addAttribute("academic_year", academic_year);
			
			
			model.put("attendence_list", attendence_list);
		
		return new ModelAndView("Student_Attendence_Details",model);	
	}
	
	@RequestMapping(value = { "/searchforstudent" }, method = RequestMethod.GET)
	public String searchforStudent(ModelMap model) {
		
		
		return "searchforstudent";
	}
	
	@RequestMapping(value = {"/studentuidbaseinfoadmin" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody Student_ReportDTO getByStudent_By_Uid_Info_Admin(HttpServletRequest request, HttpServletResponse response) {
    
		Student_ReportDTO sr=new Student_ReportDTO();
		
		String uid_no=request.getParameter("uid_no");
		
		
		
		
		//mainList.get(0).getType().equalsIgnoreCase("ADMIN")
		
	if(uid_no!=null)
	{
		if(!uid_no.equalsIgnoreCase("") )
		{
		sr=userProfileService.findByStudent_By_Uid_Info(uid_no);
		}
	
	}
	else
	{
		
		sr.setStatus_flag(" not valid input ! ");
	}
		
		 return sr;
	}
	
	@RequestMapping(value = { "/searchforstudentadmin" }, method = RequestMethod.GET)
	public String searchforStudentAdmin(ModelMap model) {
		
		
		return "searchforstudent_admin";
	}
	
	@RequestMapping(value = { "/searchforstudentuser" }, method = RequestMethod.GET)
	public String searchforStudentUser(ModelMap model) {
		
		
		return "searchforstudent_user";
	}
	
	@RequestMapping(value = { "/deleteforstudentadmin" }, method = RequestMethod.GET)
	public String deleteforStudentAdmin(ModelMap model) {
		
		
		return "deleteforstudent_admin";
	}
	/*@RequestMapping(value = { "/coursename" }, method = RequestMethod.GET)
	public  ModelAndView courseName(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		String id=request.getParameter("course_id");
		String courseName=userProfileService.courseName(id);
		model.addAttribute("courseName", courseName);
		
		
		return new ModelAndView("Student_Attendence_Details",model);	
		
	}*/
	
	@RequestMapping(value = {"/student-token_check" }, method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody String Token_Check(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
    
		List<UserProfile> mainList = new ArrayList<UserProfile>();
		List<User> users = userService.findAllUsers();
		User user=	userService.findBySSO(getPrincipal());
		mainList.addAll(user.getUserProfiles());
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		return "1";
		
	}
	
	@RequestMapping(value = { "/student_promotionreset_view" }, method = RequestMethod.GET,produces = "application/json")
	public String studentPromotionResetView(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		String course_id=request.getParameter("course_id");
		String branch_id=request.getParameter("branch_id");
		String academic_year=request.getParameter("academic_year");
		String courseName=null;
		String branchName=null;
		String academicYear = null;
		
		List<Student_ReportDTO> promoted_ResetList=new ArrayList<Student_ReportDTO>();
		
		if(course_id!=null && branch_id !=null && academic_year !=null) {
			promoted_ResetList=userProfileService.studentPromotionResetView(course_id,branch_id,academic_year);
			
		}
		
		
		
		
		if(course_id!=null) {
			courseName=userProfileService.courseName(course_id);
			}
			
			if(branch_id!=null) {
				branchName=userProfileService.branchName(course_id,branch_id);
			}
			
			if(academic_year!=null) {
				academicYear=userProfileService.academicYear(academic_year);
			}
			model.addAttribute("courseName", courseName);
			model.addAttribute("branchName", branchName);
			model.addAttribute("academicYear", academicYear);
		model.put("promoted_ResetList", promoted_ResetList);
		model.addAttribute("course_id", course_id);
		
		return "student_promotionreset_view";
	}
	
	
	@RequestMapping(value = {"student_promoted_reset_students_action" })
	public  ModelAndView getResetPromoted_Students(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		
		
	String student_info[]=	request.getParameterValues("student_info");
	System.out.println("stuInfo===>"+student_info[0]);
	String promotion_id=null;
		
		StringJoiner joinNames = new StringJoiner(",");
		//System.out.println("Names======>"+joinNames);
		List<Student_ReportDTO> promoted_ResetList=new ArrayList<Student_ReportDTO>();
		for(String  sif: student_info )
		{
			
		String sap_values[]=	sif.split("\\#");
			String student_id=sap_values[0];
			promotion_id=sap_values[1];
			joinNames.add(student_id);
			
		}
		promoted_ResetList=	userProfileService.getResetPromoted_Students(joinNames.toString(), promotion_id);
		model.put("promoted_resetList_result", promoted_ResetList);
		
		
		return new ModelAndView("student_promotionreset_view",model);	
	}
	@RequestMapping(value = {"student_admission_list" })
	public  ModelAndView getStudentAdmissionList(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		
		String course_id=request.getParameter("course_id");
		String branch_id=request.getParameter("branch_id");
		String academic_year=request.getParameter("academic_year");
		
		
		String courseName=null;
		String branchName=null;
		String academicYear = null;
		
		
		List<Student_ReportDTO> admissionList=new ArrayList<Student_ReportDTO>();
		if(course_id !=null && branch_id !=null && academic_year !=null) {
			admissionList=userProfileService.getStudentAdmissionList(course_id,branch_id,academic_year);
		}
		
		
		
		if(course_id!=null) {
			courseName=userProfileService.courseName(course_id);
			}
			
			if(branch_id!=null) {
				branchName=userProfileService.branchName(course_id,branch_id);
			}
			
			if(academic_year!=null) {
				academicYear=userProfileService.academicYear(academic_year);
			}
			model.addAttribute("courseName", courseName);
			model.addAttribute("branchName", branchName);
			model.addAttribute("academicYear", academicYear);
		
		   model.put("admissionList", admissionList);
		
		
		
		
		return new ModelAndView("student_admission_list",model);
	
	}
	
	@RequestMapping(value = {"student_examfeenotpaid_list" })
	public  ModelAndView getFeenotPaidStudentList(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		
		String course_id=request.getParameter("course_id");
		String branch_id=request.getParameter("branch_id");
		String academic_year=request.getParameter("academic_year");
		String fee_type=request.getParameter("fee_type");
		String availed_from=request.getParameter("availed_from");
		String availed_to=request.getParameter("availed_to");
		
		
		String courseName=null;
		String branchName=null;
		String academicYear = null;
		String feeTypeBasedonId=null;
		
		List<Student_ReportDTO> feeNotPaidList=new ArrayList<Student_ReportDTO>();
		
		if(course_id !=null && branch_id !=null && academic_year !=null && fee_type !=null && availed_from !=null && availed_to !=null && availed_from !="" && availed_to !="") {
			feeNotPaidList=userProfileService.getFeenotPaidStudentList(course_id,branch_id,academic_year,fee_type,availed_from,availed_to);
		}
		
		
		
		if(course_id!=null && course_id !="") {
			courseName=userProfileService.courseName(course_id);
			}
			
			if(branch_id!=null && branch_id !="") {
				branchName=userProfileService.branchName(course_id,branch_id);
			}
			
			if(academic_year!=null && academic_year !="") {
				academicYear=userProfileService.academicYear(academic_year);
			}
			if(fee_type !=null && fee_type !="") {
				feeTypeBasedonId=userProfileService.feeTypeBasedonId(fee_type);
			}
			
			model.addAttribute("courseName", courseName);
			model.addAttribute("branchName", branchName);
			model.addAttribute("academicYear", academicYear);
			model.addAttribute("feeType", feeTypeBasedonId);
			model.addAttribute("fromDate", availed_from);
			model.addAttribute("toDate", availed_to);
			
		
		   model.put("feeNotPaidList", feeNotPaidList);
		
		
		return new ModelAndView("student_examfeenotpaid_list",model);
	}
	
	@RequestMapping(value = {"student_examandtution_feepaid_list" })
	public  ModelAndView getExamAndTutionFeePaidList(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		
		String course_id=request.getParameter("course_id");
		String branch_id=request.getParameter("branch_id");
		String academic_year=request.getParameter("academic_year");
		
		
		
		String fee_type=request.getParameter("fee_type");
		String availed_from=request.getParameter("availed_from");
		String availed_to=request.getParameter("availed_to");
		
		
		String courseName=null;
		String branchName=null;
		String academicYear = null;
		String  feeTypeBasedonId=null;
		
		List<Student_ReportDTO> examAndTutionFeePaidList=new ArrayList<Student_ReportDTO>();
		
		if(course_id !=null && branch_id !=null && academic_year !=null && fee_type !=null && fee_type !="" && availed_from !=null && availed_to !=null && !availed_from.equalsIgnoreCase("")  && !availed_to.equalsIgnoreCase("")) {
			examAndTutionFeePaidList=userProfileService.getExamAndTutionFeePaidList(course_id,branch_id,academic_year,fee_type,availed_from,availed_to);
			
		}
		
		
		
		if(course_id!=null && course_id !="") {
			courseName=userProfileService.courseName(course_id);
			}
			
			if(branch_id !=null && branch_id !="") {
				branchName=userProfileService.branchName(course_id,branch_id);
			}
			
			if(academic_year !=null && academic_year !="") {
				academicYear=userProfileService.academicYear(academic_year);
			}
			if(fee_type !=null && !fee_type.equalsIgnoreCase("")) {
				feeTypeBasedonId=userProfileService.feeTypeBasedonId(fee_type);
			}
			model.addAttribute("courseName", courseName);
			model.addAttribute("branchName", branchName);
			model.addAttribute("academicYear", academicYear);
			model.addAttribute("feeType", feeTypeBasedonId);
			model.addAttribute("fromDate", availed_from);
			model.addAttribute("toDate", availed_to);
		
		   model.put("examAndTutionFeePaidList", examAndTutionFeePaidList);
		   
		return new ModelAndView("student_examandtution_feepaid_list",model);
	}
	
	@RequestMapping(value = "/files/{file_name}/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> printStudentDetailspdf(@PathVariable("file_name") String fileType,@PathVariable("id") String Id) throws  IOException {
	   
		//System.out.println("Pdf Controller");
		//System.out.println("FileType===>"+fileType);
		String filename = null;
	    // generate the file
	  //  PdfUtil.showHelp(emp);

	    // retrieve contents of "C:/tmp/report.pdf" that were written in showHelp
	    byte[] contents = userProfileService.printStudentDetailspdf(fileType,Id);

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.parseMediaType("application/pdf"));
	    if(fileType.equals("TC")){
	    	filename = "TransferCertificate.pdf";
	    }else if(fileType.equals("Bonafied")){
	    	filename="BonafiedCertificate.pdf";
	    }
	    else if(fileType.equals("Conduct")){
	    	filename="StudyAndConductCertificate.pdf";
	    }  else if(fileType.equals("Memo")){
	    	filename="Marksmemo.pdf";
	    }
	    
	    
	    headers.setContentDispositionFormData(filename, filename);
	    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	    ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
	    return response;
	}
	
	
	@RequestMapping(value = {"feepaid_dailywise_list" })
	public  ModelAndView getFeePaidDailyWise(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		String avialDate=request.getParameter("availed_from");
		List<Student_ReportDTO> examFeePaidDailyList=new ArrayList<Student_ReportDTO>();
		if(avialDate !=null && avialDate !="" ){
			examFeePaidDailyList=userProfileService.getFeePaidDailyWise(avialDate);
		}
		 model.put("examFeePaidDailyList", examFeePaidDailyList);
		return new ModelAndView("feepaid_dailywise_list",model);
	
	}



	@RequestMapping(value = {"hostedetails_dailywise" })
	public  ModelAndView hostelDetailsDailyWise(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		String avialDate=request.getParameter("availed_from");
		List<Student_ReportDTO> hostelDetailsDailyWiseList=new ArrayList<Student_ReportDTO>();
		if(avialDate !=null && avialDate !="" ){
			hostelDetailsDailyWiseList=userProfileService.hostelDetailsDailyWise(avialDate);
		}
		 model.put("hostelDetailsDailyWiseList", hostelDetailsDailyWiseList);
		return new ModelAndView("hostelDetails_DailyWise",model);
	
	}

	
	
	@RequestMapping(value = { "/searchformoneytrancationadmin" }, method = RequestMethod.GET)
	public String searchForMoneyTransaction(ModelMap model) {
		
		
		return "searchformoneytransaction_admin";
	}
	
}