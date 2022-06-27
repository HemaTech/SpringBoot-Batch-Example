package com.websystique.springmvc.service;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.websystique.springmvc.dto.Student_ReportDTO;
import com.itextpdf.text.DocumentException;
import com.websystique.springmvc.dto.Admission_Receipt;
import com.websystique.springmvc.dto.BranchDTO;
import com.websystique.springmvc.dto.Branch_CourseDTO;
import com.websystique.springmvc.dto.Certificate_Master_DTO;
import com.websystique.springmvc.dto.CourseDTO;
import com.websystique.springmvc.dto.FeeDTO;
import com.websystique.springmvc.dto.GenderDTO;
import com.websystique.springmvc.dto.MediumDTO;
import com.websystique.springmvc.model.Gmap_Model;
import com.websystique.springmvc.model.Gmap_POJO;
import com.websystique.springmvc.model.UserProfile;


public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
	public int getinsertlocations(Gmap_Model gm);
	
	public  byte[] getPhoto(Blob blob) ;
	public List<Gmap_POJO> getGmap_Details_service(Gmap_Model gm);
	public Blob getPhotoById( int id);
	public List get(Class dtoClass, Map eqCondition);
	public Gmap_Model gmap_doc(int id);
	
	public List<CourseDTO> getCourses();
	public Branch_CourseDTO getBranches( int course_id);
	public List<MediumDTO> getMediums();
	public List<GenderDTO> getGenders();
	public List<FeeDTO> getFeesTypes();
	public FeeDTO getBranch_Course_Fee( int course_id,int branch_id,String uid);
	
	public Admission_Receipt getGenerateAdmissionNo(String admission_no);
	public String getGenerateReciptNO(String uid_no);
	 public Student_ReportDTO findByStudent_By_Uid_Info(String uid);
	 
	 public Student_ReportDTO printReceipt_Details(String receipt_no);

	List<Certificate_Master_DTO> getCerticateDetails(String course_id);
	public List<Student_ReportDTO> getApprovedCertificates_Details();
	public List<Student_ReportDTO> getPromoteStudentDetails(String course,String admission_year);

	public List<Student_ReportDTO > getPromoteStudentActions(String student_id,String academic_year_id);
	public String Certificate_Name(String course_id, String certificate_id);
	public List<String> StudentIndexSearch(String indexvale) ;
	
	public int approveStatusUpdate(String action,String student_id,String certificate_id);

	String courseComplteDetails(String uId);
	public List<Student_ReportDTO> getPromoteStudentDetails(String course_id,String academic_year_id,String branch_id);

	List<Student_ReportDTO> getAdmissionStudentDetails(String course_id, String academic_year_id, String branch_id);
	int UpdateAdmission_Details( String student_id, String admission_no);

	List<Student_ReportDTO> getHostelAttendenceInformation(String course_id, String academic_year, String branch_id);
	public double getPrevious_Hostel_Fee(String uid);
	public int getHostel_Fee(String id) ;

	String courseName(String id);

	String branchName(String course_id, String branch_id);

	String academicYear(String academic_year);

	List<Student_ReportDTO> studentPromotionResetView(String course_id, String branch_id, String academic_year);

	List<Student_ReportDTO> getResetPromoted_Students(String student_id,String academic_year_id);

	List<Student_ReportDTO> getStudentAdmissionList(String course_id, String branch_id, String academic_year);

	List<Student_ReportDTO> getFeenotPaidStudentList(String course_id, String branch_id, String academic_year,
			String fee_type, String availed_from, String availed_to);

	List<Student_ReportDTO> getExamAndTutionFeePaidList(String course_id, String branch_id, String academic_year,
			String fee_type, String availed_from, String availed_to);

	String feeTypeBasedonId(String fee_type);

	byte[] printStudentDetailspdf(String fileType, String id) throws IOException;

	List<Student_ReportDTO> getFeePaidDailyWise(String avialDate);

	List<Student_ReportDTO> hostelDetailsDailyWise(String avialDate);

	

	
}
