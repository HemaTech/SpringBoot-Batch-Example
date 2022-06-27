package com.websystique.springmvc.service;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.websystique.springmvc.dao.UserProfileDao;
import com.websystique.springmvc.dto.Admission_Receipt;
import com.websystique.springmvc.dto.BranchDTO;
import com.websystique.springmvc.dto.Branch_CourseDTO;
import com.websystique.springmvc.dto.Certificate_Master_DTO;
import com.websystique.springmvc.dto.CourseDTO;
import com.websystique.springmvc.dto.FeeDTO;
import com.websystique.springmvc.dto.GenderDTO;
import com.websystique.springmvc.dto.MediumDTO;
import com.websystique.springmvc.dto.Student_ReportDTO;
import com.websystique.springmvc.model.Gmap_Model;
import com.websystique.springmvc.model.Gmap_POJO;
import com.websystique.springmvc.model.UserProfile;
import com.websystique.springsecurity.util.StudentPdf;


@Service("userProfileService")
@Transactional
public class UserProfileServiceImpl implements UserProfileService{
	
	@Autowired
	UserProfileDao dao;
	
	public UserProfile findById(int id) {
		return dao.findById(id);
	}

	public UserProfile findByType(String type){
		return dao.findByType(type);
	}

	public List<UserProfile> findAll() {
		return dao.findAll();
	}

	@Override
	public int getinsertlocations(Gmap_Model gm) {
		// TODO Auto-generated method stub
		return dao.getinsertlocations(gm);
	}

	@Override
	public byte[] getPhoto(Blob blob) {
		// TODO Auto-generated method stub
		return dao.getPhoto(blob);
	}

	@Override
	public List<Gmap_POJO> getGmap_Details_service(Gmap_Model gm) {
		// TODO Auto-generated method stub
		return dao.getGmap_Details_service(gm);
	}

	@Override
	public Blob getPhotoById(int id) {
		// TODO Auto-generated method stub
		return dao.getPhotoById(id);
	}

	@Override
	public List get(Class dtoClass, Map eqCondition) {
		// TODO Auto-generated method stub
		return dao.get(dtoClass, eqCondition);
	}

	@Override
	public Gmap_Model gmap_doc(int id) {
		// TODO Auto-generated method stub
		return dao.gmap_doc(id);
	}

	@Override
	public List<CourseDTO> getCourses() {
		// TODO Auto-generated method stub
		return dao.getCourses();
	}

	@Override
	public Branch_CourseDTO getBranches(int course_id) {
		// TODO Auto-generated method stub
		return dao.getBranches(course_id);
	}

	@Override
	public List<MediumDTO> getMediums() {
		// TODO Auto-generated method stub
		return dao.getMediums();
	}

	@Override
	public List<GenderDTO> getGenders() {
		// TODO Auto-generated method stub
		return dao.getGenders();
	}

	@Override
	public List<FeeDTO> getFeesTypes() {
		// TODO Auto-generated method stub
		return dao.getFeesTypes();
	}

	@Override
	public FeeDTO getBranch_Course_Fee(int course_id, int branch_id,String uid) {
		// TODO Auto-generated method stub
		return dao.getBranch_Course_Fee(course_id, branch_id,uid);
	}

	@Override
	public Admission_Receipt getGenerateAdmissionNo(String uid_no) {
		// TODO Auto-generated method stub
		return dao.getGenerateAdmissionNo(uid_no);
	}

	@Override
	public String getGenerateReciptNO(String uid_no) {
		// TODO Auto-generated method stub
		return dao.getGenerateReciptNO(uid_no);
	}

	@Override
	public Student_ReportDTO findByStudent_By_Uid_Info(String uid) {
		// TODO Auto-generated method stub
		return dao.findByStudent_By_Uid_Info(uid);
	}

	@Override
	public Student_ReportDTO printReceipt_Details(String receipt_no) {
		// TODO Auto-generated method stub
		return dao.printReceipt_Details(receipt_no);
	}

	@Override
	public List<Certificate_Master_DTO> getCerticateDetails(String course_id) {
		// TODO Auto-generated method stub
		return dao.getCerticateDetails(course_id);
	}

	@Override
	public List<Student_ReportDTO> getApprovedCertificates_Details() {
		// TODO Auto-generated method stub
		return dao.getApprovedCertificates_Details();
	}

	@Override
	public List<Student_ReportDTO> getPromoteStudentDetails(String course, String academic_year) {
		// TODO Auto-generated method stub
		List<Student_ReportDTO> list_data=null;
		try
		{
			list_data=dao.getPromoteStudentDetails(course,academic_year);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list_data;
	}

	@Override
	public List<Student_ReportDTO > getPromoteStudentActions(String student_id, String academic_year_id) {
		// TODO Auto-generated method stub
		return dao.getPromoteStudentActions(student_id, academic_year_id);
	}

	@Override
	public String Certificate_Name(String course_id, String certificate_id) {
		// TODO Auto-generated method stub
		return dao.Certificate_Name(course_id, certificate_id);
	}

	@Override
	public List<String> StudentIndexSearch(String indexvale) {
		// TODO Auto-generated method stub
		return dao.StudentIndexSearch(indexvale);
	}
	
	@Override
	public int approveStatusUpdate(String action, String student_id,String certificate_id) {
		// TODO Auto-generated method stub
		return dao.approveStatusUpdate(action, student_id,certificate_id);
	}

	@Override
	public String courseComplteDetails(String uId) {
		// TODO Auto-generated method stub
		return dao.courseComplteDetails(uId);
	}

	@Override
	public List<Student_ReportDTO> getPromoteStudentDetails(String course_id, String academic_year_id,
			String branch_id) {
		// TODO Auto-generated method stub
		return dao.getPromoteStudentDetails(course_id, academic_year_id, branch_id);
	}

	@Override
	public List<Student_ReportDTO> getAdmissionStudentDetails(String course_id, String academic_year_id,
			String branch_id) {
		// TODO Auto-generated method stub
		return dao.getAdmissionStudentDetails(course_id, academic_year_id, branch_id);
	}

	@Override
	public int UpdateAdmission_Details(String student_id, String admission_no) {
		// TODO Auto-generated method stub
		return dao.UpdateAdmission_Details(student_id, admission_no);
	}

	@Override
	public List<Student_ReportDTO> getHostelAttendenceInformation(String course_id, String academic_year,
			String branch_id) {
		// TODO Auto-generated method stub
		return dao.getHostelAttendenceInformation(course_id,academic_year,branch_id);
	}

	@Override
	public double getPrevious_Hostel_Fee(String uid) {
		// TODO Auto-generated method stub
		return dao.getPrevious_Hostel_Fee(uid);
	}

	@Override
	public int getHostel_Fee(String id) {
		// TODO Auto-generated method stub
		return dao.getHostel_Fee(id);
	}

	@Override
	public String courseName(String id) {
		// TODO Auto-generated method stub
		return dao.courseName(id);
	}

	@Override
	public String branchName(String course_id, String branch_id) {
		// TODO Auto-generated method stub
		return dao.branchName(course_id,branch_id);
	}

	@Override
	public String academicYear(String academic_year) {
		// TODO Auto-generated method stub
		return dao.academicYear(academic_year);
	}

	@Override
	public List<Student_ReportDTO> studentPromotionResetView(String course_id, String branch_id, String academic_year) {
		// TODO Auto-generated method stub
		return dao.studentPromotionResetView(course_id,branch_id,academic_year);
	}

	@Override
	public List<Student_ReportDTO> getResetPromoted_Students(String student_id, String academic_year_id) {
		// TODO Auto-generated method stub
		return dao.getResetPromoted_Students(student_id,academic_year_id);
	}

	@Override
	public List<Student_ReportDTO> getStudentAdmissionList(String course_id, String branch_id, String academic_year) {
		// TODO Auto-generated method stub
		return dao.getStudentAdmissionList(course_id,branch_id,academic_year);
	}

	@Override
	public List<Student_ReportDTO> getFeenotPaidStudentList(String course_id, String branch_id, String academic_year,String fee_type,String availed_from,String availed_to) {
		// TODO Auto-generated method stub
		return dao.getFeenotPaidStudentList(course_id,branch_id,academic_year,fee_type,availed_from,availed_to);
	}

	@Override
	public List<Student_ReportDTO> getExamAndTutionFeePaidList(String course_id, String branch_id, String academic_year,
			String fee_type, String availed_from, String availed_to) {
		// TODO Auto-generated method stub
		return dao.getExamAndTutionFeePaidList( course_id,branch_id,academic_year,
				 fee_type,availed_from,availed_to);
	}

	@Override
	public String feeTypeBasedonId(String fee_type) {
		// TODO Auto-generated method stub
		return dao.feeTypeBasedonId(fee_type);
	}

	@Override
	public byte[] printStudentDetailspdf(String fileType, String id) throws  IOException {
		Document document=new Document();
		StudentPdf stdpdf=new StudentPdf();
		Student_ReportDTO std = dao.findByStudent_By_Uid_Info(id);
		System.out.println("id:"+id+"=======>"+std.getName());
		byte[]	studentPdfData = null;
		if(fileType.equals("TC")){
			studentPdfData= stdpdf.addContentForTc(document, std);
		}else if(fileType.equals("Bonafied")){
			try {
				studentPdfData=stdpdf.addContentForBonafied(document,std);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(fileType.equals("Conduct")){
			try {
				studentPdfData=stdpdf.addStudyAndConduct(document,std);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(fileType.equals("Memo")){
			try {
				studentPdfData=stdpdf.addMarksAndMemo(document,std);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return studentPdfData;
	}

	@Override
	public List<Student_ReportDTO> getFeePaidDailyWise(String avialDate) {
		// TODO Auto-generated method stub
		return dao.getFeePaidDailyWise(avialDate);
	}

	@Override
	public List<Student_ReportDTO> hostelDetailsDailyWise(String avialDate) {
		// TODO Auto-generated method stub
		
		 List<Student_ReportDTO> hosteldetilsdata= dao.hostelDetailsDailyWise(avialDate);
		 System.out.println("hosteldetilsdata"+hosteldetilsdata);
		return hosteldetilsdata;
	}

	
	
}
