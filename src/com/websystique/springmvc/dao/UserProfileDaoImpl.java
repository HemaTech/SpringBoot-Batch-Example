package com.websystique.springmvc.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.SessionImpl;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.gmap.common.Pdf_Doc_download;
import com.websystique.springmvc.dto.Academic_yearDTO;
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







@Repository("userProfileDao")
public class UserProfileDaoImpl extends AbstractDao<Integer, UserProfile>implements UserProfileDao{

	List <Gmap_Model> gmaplist=new ArrayList<Gmap_Model>();
	public UserProfile findById(int id) {
		return getByKey(id); 
	}

	public UserProfile findByType(String type) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("type", type));
		return (UserProfile) crit.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<UserProfile> findAll(){
		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.asc("type"));
		return (List<UserProfile>)crit.list();
	}

	@Override
	public int getinsertlocations(Gmap_Model gm) {
		// TODO Auto-generated method stub
		
		int count=0;
		
		Connection con=null;
		
		
		try{
			
			List<MultipartFile> files = gm.getDoc_type_image();
			MultipartFile mf1=files.get(0);						        									        		
			byte[] doc_type_image = mf1.getBytes();
			Session session=getSession();
			
		SessionImpl sessionImpl = (SessionImpl) session;
		    
		con=	sessionImpl.connection();
		con.setAutoCommit(false);
			
		
		
		
		
		
		String sql = " insert into gmap_details(country_name, state_name,city_name,"+
					 " object_name,area_location,phone_number,lat,lng,pincode,mode_type,address,doc_type_image,street_name) "+
					 " values (?,?,?,?,?,?,?,?,?,?,?,?,?) ";

		
		
		PreparedStatement ps= con.prepareStatement(sql);
		
		ps.setString(1,gm.getCountry_name());
		
		ps.setString(2,gm.getState_name());
		
		ps.setString(3,gm.getCity_name());
		ps.setString(4, gm.getObject_name());
		ps.setString(5, gm.getArea_location());
		ps.setString(6, gm.getPhone_number());
		ps.setString(7, gm.getLat());
		ps.setString(8, gm.getLng());
		ps.setString(9, gm.getPincode());
		ps.setString(10, gm.getMode_type());
		ps.setString(11, gm.getAddress());
		  ps.setBlob(12,Hibernate.getLobCreator(session).createBlob(doc_type_image));
		ps.setString(13, gm.getStreet_name());
		
		count = ps.executeUpdate();
		if(count>0)
		{
		con.commit();
		}
		else
		{
			con.rollback();
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				con.close();
			} catch (SQLException e)
			{
				
				e.printStackTrace();
			}
		}
		return count;
	}

	@Override
	public byte[] getPhoto(Blob blob) {
		// TODO Auto-generated method stub
		byte[] image=null;
		try {
			image= Pdf_Doc_download.getPhoto(blob);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return image;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Gmap_POJO> getGmap_Details_service(Gmap_Model gm) {
		// TODO Auto-generated method stub
		
		
		Query query=null;
		List<Gmap_POJO> gmap_list = new ArrayList<Gmap_POJO>();
		try{
			
			
			
			Session session=getSession();
			
		
		String sql = " SELECT id,country_name, state_name,  city_name, object_name, area_location, street_name, phone_number, "+ 
					 " lat, lng, pincode, mode_type, address  FROM gmap_details ";

		query = session.createSQLQuery(sql);
		gmap_list=	query.setResultTransformer(Transformers.aliasToBean(Gmap_POJO.class)).list();
		
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return gmap_list;
	}
	
	public Blob getPhotoById( int id) {/*
		Query qry=null;
		Session session=getSession();
		String sql = "select doc_type_image from gmap_details where id=? limit 1";
		qry=session.createSQLQuery(sql);
		qry.setParameter(0, 1);
		long photo = (Long) qry.uniqueResult();
		LargeObject obj = lobj.open(oid, LargeObjectManager.READ);

		in = obj.getInputStream();
		return photo;
	*/
		return null;
		}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List get(Class dtoClass, Map eqCondition) {
		List list = null;
		Criteria criteria = null;
		Session session=getSession();
		try {
			if(session!=null )
			{
			 criteria = session.createCriteria(dtoClass);
			}
			
			criteria.add(Restrictions.allEq(eqCondition));
			
			list = criteria.list();
		} catch (RuntimeException e) {
			e.printStackTrace();

			throw e;
		}
		return list;

	}
	public Gmap_Model gmap_doc(int id) {
		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		
		String str = " SELECT id,doc_type_image  FROM gmap_details where id=? ";

		Gmap_Model rc=new Gmap_Model();
		try
		{
		pst=con.prepareStatement(str);
		pst.setInt(1, id);
		rs=pst.executeQuery();
		if(rs.next())
		{
			
			
			rc.setDoc_type_image_bolb(rs.getBlob("doc_type_image"));
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rc;
		}
	
	
	public List<CourseDTO> getCourses()
	{

		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		List<CourseDTO> courseList=new ArrayList<CourseDTO>();
		
		String str = " SELECT id, name, duration  FROM course  ";

		
		try
		{
		pst=con.prepareStatement(str);
		
		rs=pst.executeQuery();
		while(rs.next())
		{
			CourseDTO cd=new CourseDTO();
			cd.setId(rs.getInt("id"));
			cd.setDuration(rs.getInt("duration"));
			cd.setName(rs.getString("name"));
			courseList.add(cd);
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return courseList;
		
	}
	
	public Branch_CourseDTO getBranches( int course_id)
	{

		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		List<BranchDTO> branchList=new ArrayList<BranchDTO>();
		List<CourseDTO> courseList=new ArrayList<CourseDTO>();
		Branch_CourseDTO branch_courseList=new Branch_CourseDTO();
		
		String str = " SELECT id, course_id, name, fee FROM branch where course_id =?  ";

		
		try
		{
		pst=con.prepareStatement(str);
		pst.setInt(1, course_id);
		rs=pst.executeQuery();
		while(rs.next())
		{
			BranchDTO cd=new BranchDTO();
			cd.setId(rs.getInt("id"));
			cd.setCourse_id(rs.getInt("course_id"));
			cd.setName(rs.getString("name"));
			cd.setFee(rs.getInt("fee"));
			branchList.add(cd);
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		//=============================================================//
		PreparedStatement  pstb=null;
		ResultSet rsb=null;
		String strb = " select id,academic_year_name from academic_year  where academic_year_name <>'Completed' and     course_id  =? ";
		try
		{
		pstb=con.prepareStatement(strb);
		pstb.setInt(1, course_id);
		rsb=pstb.executeQuery();
		while(rsb.next())
		{
			CourseDTO cd=new CourseDTO();
			cd.setId(rsb.getInt("id"));
			
			cd.setName(rsb.getString("academic_year_name"));
			
			/*if(cd.getName().equals("Completed")) {
				cd.setName("");
			}*/
			
			courseList.add(cd);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		branch_courseList.setBt(branchList);
		branch_courseList.setCt(courseList);
		
		
		return branch_courseList;
		
	}
	
	public FeeDTO getBranch_Course_Fee( int course_id,int branch_id,String uid)
	{

		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		FeeDTO fee_details=new FeeDTO();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		
		String str = " SELECT id, course_id, name, fee FROM branch where course_id =? and id=? ";

		String fee=null;
		
		try
		{
		pst=con.prepareStatement(str);
		pst.setInt(1, course_id);
		pst.setInt(2, branch_id);
		rs=pst.executeQuery();
		if(rs.next())
		{
	
			fee=	String.valueOf(rs.getInt("fee"));
			String previous_fee=getPrevious_Course_Fee(uid)+"";
			String previous_hostel_fee=getPrevious_Hostel_Fee(uid)+"";
			fee_details.setCurrent_fee(fee);
			fee_details.setPrevious_fee(previous_fee);
			fee_details.setHostel_previous_fee(previous_hostel_fee);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return fee_details;
		
	}
	
	public List<MediumDTO> getMediums()
	{

		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		List<MediumDTO> mediumList=new ArrayList<MediumDTO>();
		
		String str = " SELECT id, name FROM medium   ";

		
		try
		{
		pst=con.prepareStatement(str);
		
		rs=pst.executeQuery();
		while(rs.next())
		{
			MediumDTO cd=new MediumDTO();
			cd.setId(rs.getInt("id"));
			
			cd.setName(rs.getString("name"));
			mediumList.add(cd);
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return mediumList;
		
	}
	public List<GenderDTO> getGenders()
	{

		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		List<GenderDTO> genderList=new ArrayList<GenderDTO>();
		
		String str = " SELECT id, name FROM gender  ";

		
		try
		{
		pst=con.prepareStatement(str);
		
		rs=pst.executeQuery();
		while(rs.next())
		{
			GenderDTO cd=new GenderDTO();
			cd.setId(rs.getInt("id"));
			
			cd.setName(rs.getString("name"));
			genderList.add(cd);
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return genderList;
		
	}
	
	public List<FeeDTO> getFeesTypes()
	{

		// TODO Auto-generated method stub
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		List<FeeDTO> feesList=new ArrayList<FeeDTO>();
		
		String str = " SELECT id, fee_type FROM fee order by fee_type  ";

		
		try
		{
		pst=con.prepareStatement(str);
		
		rs=pst.executeQuery();
		while(rs.next())
		{
			FeeDTO cd=new FeeDTO();
			cd.setId(rs.getInt("id"));
			
			cd.setFee_type(rs.getString("fee_type"));
			feesList.add(cd);
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return feesList;
		
	}

	@Override
	public Admission_Receipt getGenerateAdmissionNo(String uid_no) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		Admission_Receipt ar=new Admission_Receipt();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	String admission_no=null;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql="   select concat(course_id,admission_year,substr(uid_no,7)) as admission_no,concat('SSS/',course_id,nextval('serno_seq')) as recipt_no  from student where uid_no=? ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setString(1, uid_no);
		rs=pst.executeQuery();
		
		
		while(rs.next())
		{
			ar.setAdmission_no(rs.getString("admission_no"));
			ar.setReceipt_no(rs.getString("recipt_no"));
		}
		}
		catch(Exception e)
		{
			
		}
		
		return ar;
	}

	@Override
	public String getGenerateReciptNO(String uid_no) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	String recipt_no=null;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql=" select concat('SSS/',course_id,nextval('serno_seq')) as recipt_no from student  where  uid_no=? ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setString(1, uid_no);
		rs=pst.executeQuery();

		while(rs.next())
		{
			recipt_no=rs.getString("recipt_no");
		}
		}
		catch(Exception e)
		{
			
		}
		
		return recipt_no;
	}

	@Override
	public Student_ReportDTO findByStudent_By_Uid_Info(String uid) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		Student_ReportDTO srd=new Student_ReportDTO();
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
		
		String sql=null;
		
		
		
		if(uid.length()!=12)
		{
			sql= 	" select s.mobile_no,s.previous_fee,s.bord_generated_admission_no,s.actual_fee,s.id,s.course_id,s.branch_id,s.name as student_name,s.father_name,s.admission_year,s.uid_no ,s.registered_on,c.name as course_name,b.name as branch_name," + 
					" m.name as medium_name ,g.name as gender_name from student s ,course c, branch b,medium m ,gender g where  " + 
					" s.course_id=c.id and s.branch_id=b.id and s.gender_id=g.id and s.medium_id=m.id  and  s.uid_no in(" + 
					" select uid_no from (select concat(a.name ,' ',c.name ,' ', academic_year_name ,' ', bord_generated_admission_no,' ( ',uid_no,' ) ') as index_name ,uid_no from student a,academic_year b,course c " + 
					" where a.course_id=b.course_id and c.id=b.course_id and a.academic_year = b.id)subQry " + 
					" where index_name ilike ? ) and  s.course_comp_id is  null" ;
		}
		else
		{
			 sql=   " select s.mobile_no, s.previous_fee,s.bord_generated_admission_no,s.actual_fee,s.id,s.course_id,s.branch_id,s.name as student_name,s.father_name,s.admission_year,s.uid_no ,s.registered_on,c.name as course_name,b.name as branch_name," + 
					"	 m.name as medium_name ,g.name as gender_name from student s ,course c, branch b,medium m ,gender g  where  " + 
					"	  s.course_id=c.id and s.branch_id=b.id and s.gender_id=g.id and s.medium_id=m.id and s.uid_no=? and s.course_comp_id is  null ";
				
		}
		try
		{
		pst=con.prepareStatement(sql);
		if(uid.length()==12)
		{
		pst.setString(1, uid);
		}
		else
		{
			pst.setString(1, "%"+uid+"%");
		}
		rs=pst.executeQuery();

		while(rs.next())
		{
			srd.setStudent_name(rs.getString("student_name"));
			srd.setFather_name(rs.getString("father_name"));
			srd.setAdmission_year(rs.getInt("admission_year"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setRegistered_on(rs.getDate("registered_on"));
			srd.setCourse_name(rs.getString("course_name"));
			srd.setBranch_name(rs.getString("branch_name"));
			srd.setMedium_name(rs.getString("medium_name"));
			srd.setGender_name(rs.getString("gender_name"));
			srd.setId(rs.getInt("id"));
			srd.setCourse_id(rs.getInt("course_id"));
			srd.setBranch_id(rs.getInt("branch_id"));
			srd.setActual_fee(rs.getInt("actual_fee"));
			srd.setHostel_fee(getHostel_Fee(String.valueOf(rs.getInt("id"))));
			srd.setBoard_generated_admission_no(rs.getString("bord_generated_admission_no"));
			srd.setHallticket_no(getHallticket_NO(String.valueOf(rs.getInt("id"))));
			
			//srd.setHostel_prev_fee(getPrevious_Hostel_Fee(srd.getUid_no()));
			//srd.setPrevious_fee(getPrevious_Course_Fee(srd.getUid_no()));
			
			srd.setMobile_no(rs.getString("mobile_no"));
			srd.setPrevious_fee(rs.getInt("previous_fee"));
			srd.setHostel_prev_fee(getHostel_Previous_Fee(String.valueOf(rs.getInt("id"))));
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return srd;
	}

	@Override
	public Student_ReportDTO printReceipt_Details(String receipt_no) {

		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		Student_ReportDTO srd=new Student_ReportDTO();
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql_test="select name as student_name,fee_amount,concat(fnNumberToWords(fee_amount),' Rupees ') " + 
					" in_words,receipt_no from student_tution_fee_detail stfd,student s where receipt_no =? and s.id=stfd.student_id ";
		
		String sql="   select s.name as student_name,father_name,fee_amount,b.name as branchname,stfd.paid_on as paidon,concat(fnNumberToWords(fee_amount),' Rupees ') as  " + 
				" in_words,receipt_no,concat(c.name,' (',academic_year_name,' )') as group_name,f.fee_type from student_tution_fee_detail stfd,student s ," + 
				" course c ,academic_year a ,fee f,branch b where receipt_no =? and s.id=stfd.student_id and f.id=stfd.fee_type " + 
				" and c.id=s.course_id and a.course_id=s.course_id and a.id=s.academic_year and b.id=s.branch_id" ;
		try
		{
		pst=con.prepareStatement(sql);
		pst.setString(1, receipt_no);
		rs=pst.executeQuery();

		while(rs.next())
		{
			srd.setStudent_name(rs.getString("student_name"));
			
			
			srd.setReceipt_no(rs.getString("receipt_no"));
			srd.setIn_words(rs.getString("in_words"));
			srd.setFee_amount(rs.getInt("fee_amount"));
			srd.setGroup_name(rs.getString("group_name"));
			srd.setFee_type(rs.getString("fee_type"));
			srd.setFather_name(rs.getString("father_name"));
			srd.setBranch_name(rs.getString("branchname"));
			srd.setRegistered_on(rs.getDate("paidon"));
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return srd;
	
	}
	@Override
	public List<Certificate_Master_DTO> getCerticateDetails(String id) {

		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Certificate_Master_DTO> cmdlist=new ArrayList<Certificate_Master_DTO>();
		
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql=" select id ,certificate_name from certificate_master where course_id in(select   course_id from student  where id =?) ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setInt(1, Integer.valueOf(id));
		rs=pst.executeQuery();

		while(rs.next())
		{
			Certificate_Master_DTO cmd=new Certificate_Master_DTO();
			cmd.setCertificate_id(rs.getString("id"));
			cmd.setCertificate_name(rs.getString("certificate_name"));
			
			cmdlist.add(cmd);
			
	//	System.out.println("%%%%%%%%%%%%%%%%%%"+cmdlist.size());
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cmdlist;
	
	}

	@Override
	public List<Student_ReportDTO> getApprovedCertificates_Details() {

		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO > cert_list=new ArrayList<Student_ReportDTO>();
		
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql=" select a.student_id,b.name , b.uid_no  ,certificate_name, b.bord_generated_admission_no,c.certificate_status,action,a.certificate_id as certificate_id from " + 
					"certificate_student_info a ,student b,certificate_status c ,certificate_master d  where a.student_id=b.id and action in('1','2') " + 
					"and c.id=cast(a.action as int) and a.certificate_id =d.id " + 
					"order by student_id ";
		try
		{
		pst=con.prepareStatement(sql);
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			Student_ReportDTO srd=new Student_ReportDTO();
			srd.setStudent_id(rs.getString("student_id"));
			srd.setName(rs.getString("name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setCertificate_name(rs.getString("certificate_name"));
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			srd.setCertificate_status(rs.getString("certificate_status"));
			srd.setAction(rs.getString("action"));
			srd.setCertificate_id(rs.getString("certificate_id"));
			cert_list.add(srd);
			
	
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cert_list;
	
	}
	
	
	@Override
	public List<Student_ReportDTO> getPromoteStudentDetails(String course_id,String academic_year_id) {

		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO > promote_list_data=new ArrayList<Student_ReportDTO>();
		
		int course=Integer.valueOf(course_id);
		int academic_year=Integer.valueOf(academic_year_id);
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql="   select id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no   from student  where  promotion_status=1 and   course_id =? and academic_year=?  ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setInt(1, course);
		pst.setInt(2, academic_year);
		rs=pst.executeQuery();

		while(rs.next())
		{
			Student_ReportDTO srd=new Student_ReportDTO();
			srd.setStudent_id(rs.getString("student_id"));
			srd.setName(rs.getString("student_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setFather_name(rs.getString("father_name"));
			
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			
			
			promote_list_data.add(srd);
			
	
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return promote_list_data;
	
	}


	
	@Override
	public List<Student_ReportDTO >  getPromoteStudentActions(String student_id,String academic_year_id) {

		Connection con =null;
		PreparedStatement  pst=null;
		PreparedStatement  pst_fetch=null;
		ResultSet rs=null;
		List<Student_ReportDTO> promote_list=new ArrayList<Student_ReportDTO>();
		
	//	int id_student=Integer.valueOf(student_id);
		int academic_year=Integer.valueOf(academic_year_id);
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	int status=0;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql="   update student set promotion_status=1,   academic_year=?   where id in("+student_id+") ";
		String sql_fetch="   select id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no   from student  where  promotion_status=1 and   id in("+student_id+")  ";
		
		
		try
		{
		pst=con.prepareStatement(sql);
		pst.setInt(1, academic_year);
		//pst.setInt(2, id_student);
		 status=pst.executeUpdate();

		 if(status>0)
		 {
			 pst_fetch=con.prepareStatement(sql_fetch);
				//pst.setInt(1, course);
				
				rs=pst_fetch.executeQuery();

				while(rs.next())
				{
					Student_ReportDTO srd=new Student_ReportDTO();
					srd.setStudent_id(rs.getString("student_id"));
					srd.setName(rs.getString("student_name"));
					srd.setUid_no(rs.getString("uid_no"));
					srd.setFather_name(rs.getString("father_name"));
					
					srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
					
					
					promote_list.add(srd);
					
			
					
				}
				
			// getPromoteStudentDetails(student_promotion.getPrevious_course_id(),promotion_id);
		 }
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return promote_list;
	
	}

	@Override
	public String Certificate_Name(String course_id, String certificate_id) {


		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		
		String certificate_name=null;
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql=" select id ,certificate_name from certificate_master where id=? and  course_id =? ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setInt(1, Integer.valueOf(certificate_id));
		pst.setInt(2, Integer.valueOf(course_id));
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			certificate_name=rs.getString("certificate_name");
			
			
			
	//	System.out.println("%%%%%%%%%%%%%%%%%%"+cmdlist.size());
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return certificate_name;
	
	
	}

	@Override
	public List<String> StudentIndexSearch(String indexvale) {



		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	List<String> list_uids=new ArrayList<String>();
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql_test=" select index_name,uid_no from " + 
				   "(select concat(a.name ,',',father_name,',',uid_no,',',bord_generated_admission_no,',',c.name,',',academic_year_name) as index_name ,uid_no from student a,academic_year b,course c\r\n" + 
				   " where a.course_id=b.course_id and c.id=b.course_id and a.academic_year = b.id)subQry\r\n" + 
				   " where index_name ilike ? ";
		
		String sql= "  select index_name,uid_no from (select concat(a.name ,' ',c.name ,' ', academic_year_name ,' ', bord_generated_admission_no,' ( ',uid_no,' ) ') as index_name ,uid_no from student a,academic_year b,course c " + 
					" where a.course_id=b.course_id and c.id=b.course_id and a.academic_year = b.id and a.course_comp_id is  null)subQry " ;
		try
		{
		pst=con.prepareStatement(sql);
		//pst.setString(1, "%"+indexvale+"%");
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			
		
			list_uids.add(rs.getString("index_name"));
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list_uids;
	
	
	
	}
	
	
	@Override
	public int  approveStatusUpdate(String action,String student_id,String certificate_id) {

		Connection con =null;
		PreparedStatement  pst=null;
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	int status=0;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql="update certificate_student_info  set action=?   where student_id=? and certificate_id=? ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setString(1, action);
		pst.setInt(2, Integer.valueOf(student_id));
		pst.setInt(3, Integer.valueOf(certificate_id));
		 status=pst.executeUpdate();

		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return status;
	
	}

	@Override
	public int getPrevious_Course_Fee(String uid) {




		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		int previous_amount=0;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= "  select sum(actual_fee-fee_amount) as previous_amount from ( " + 
				" select actual_fee,coalesce(sum(fee_amount),0) as fee_amount  from student a " + 
				" left outer join  student_tution_fee_detail b on(a.id=b.student_id and  fee_type  in(2,5)) where  a.uid_no =? " + 
				" group by actual_fee " + 
				" )subQry " ;
				
		try
		{
		pst=con.prepareStatement(sql);
	
		pst.setString(1, uid);
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			previous_amount=	rs.getInt("previous_amount");
		
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return previous_amount;
	
	
	
	
	}

	
	@Override
	public String courseComplteDetails(String uId) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		String courseCompleted=null;
		boolean courseData=false;
		//String courseDetails=null;
		Session session=	getSession();
		SessionImpl sessionImpl = (SessionImpl) session;
		
			if(session!=null)
			{
		        con=sessionImpl.connection();
			}
				
				
			String sql=  "select coalesce(cast(b.course_completed as character varying),'false') as course_completed from  student a "
					    + " left join course_completion b on(a.course_comp_id=b.id) where "
					    + " uid_no =? ";
					
			try
			{
			pst=con.prepareStatement(sql);
		
			pst.setString(1, uId);
			
			rs=pst.executeQuery();

			
			
			if(rs.next())
			{
				
				
				courseData =rs.getBoolean("course_completed");
				
				
				courseCompleted=String.valueOf(courseData);
				
				 
				
			}
			else
			{
				courseCompleted="true";
			}
			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally {
				try {
					//con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return courseCompleted;

		
		
	}
	
	@Override
	public List<Student_ReportDTO> getPromoteStudentDetails(String course_id,String academic_year_id,String branch_id) {

		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO > promote_list=new ArrayList<Student_ReportDTO>();
		
		int course=Integer.valueOf(course_id);
		int academic_year=Integer.valueOf(academic_year_id);
		Session session=	getSession();
		SessionImpl sessionImpl = (SessionImpl) session;
		String sql=null;
		
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		try
		{
			
		if(course_id.equalsIgnoreCase("2")||course_id.equalsIgnoreCase("3"))
		{
			
			sql=	"         select distinct  a.id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no ,promotion_id,c.id as actual_id " + 
					"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
					"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
					"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 " + 
					"         and  a.promotion_status=0 and a.id in(select student_id from " + 
					"         (select a.id as student_id ,count(1) " + 
					"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
					"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
					"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 and a.promotion_status=0" + 
					"         group by a.id having count(1)>=2 )subQry) " ;
			
			pst=con.prepareStatement(sql);
			pst.setInt(1, course);
			pst.setInt(2, academic_year);
			pst.setInt(3, Integer.valueOf(branch_id));
			
			pst.setInt(4, course);
			pst.setInt(5, academic_year);
			pst.setInt(6, Integer.valueOf(branch_id));
			
			rs=pst.executeQuery();
		}
		else
		{
			 sql=	  "   select id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no  "
					 + " from student  where    course_id =? and academic_year=? and branch_id=?  and promotion_status=0 and  course_comp_id is  null";
			   
			 
			 sql=	 "         select distinct  a.id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no ,promotion_id,c.id as actual_id " + 
				"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
				"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
				"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 " + 
				"         and  a.promotion_status=0 and a.id in(select student_id from " + 
				"         (select a.id as student_id ,count(1) " + 
				"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
				"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
				"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 and a.promotion_status=0" + 
				"         group by a.id having count(1)>=1 )subQry) " ;
			 
			 
			 pst=con.prepareStatement(sql);
				pst.setInt(1, course);
				pst.setInt(2, academic_year);
				pst.setInt(3, Integer.valueOf(branch_id));
				
				pst.setInt(4, course);
				pst.setInt(5, academic_year);
				pst.setInt(6, Integer.valueOf(branch_id));
				rs=pst.executeQuery();

		}
		
		
		while(rs.next())
		{
			Student_ReportDTO srd=new Student_ReportDTO();
			srd.setStudent_id(rs.getString("student_id"));
			srd.setName(rs.getString("student_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setFather_name(rs.getString("father_name"));
			
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			
			srd.setPromotion_id(rs.getInt("promotion_id"));
			promote_list.add(srd);
			
	
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return promote_list;
	
	}
	
	@Override
	public List<Student_ReportDTO> getAdmissionStudentDetails(String course_id,String academic_year_id,String branch_id) {

		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> admission_list=new ArrayList<Student_ReportDTO>();
		
		int course=Integer.valueOf(course_id);
		int academic_year=Integer.valueOf(academic_year_id);
		Session session=	getSession();
		SessionImpl sessionImpl = (SessionImpl) session;
		String sql=null;
		
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		try
		{
			
		
			
			sql=	"  select a.id as student_id,name as student_name,father_name,b.board_generated_admission_no  , uid_no   " + 
					"   from student a,student_admission_detail b  where academic_year =? " + 
					"   and  branch_id =? and  course_id  =? and  b.board_generated_admission_no  is null     " + 
					"   and a.st_admission_id=b.id  " ;
			
			pst=con.prepareStatement(sql);
			
			pst.setInt(1, academic_year);
			pst.setInt(2, Integer.valueOf(branch_id));
			pst.setInt(3, course);
			
			
			rs=pst.executeQuery();
		
		
		
		
		while(rs.next())
		{
			Student_ReportDTO srd=new Student_ReportDTO();
			srd.setStudent_id(rs.getString("student_id"));
			srd.setName(rs.getString("student_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setFather_name(rs.getString("father_name"));
			
			srd.setBoard_generated_admission_no(rs.getString("board_generated_admission_no"));
			
			
			admission_list.add(srd);
			
	
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return admission_list;
	
	}
	
	@Override
	public int  UpdateAdmission_Details(String student_id,String admission_no) {/*

		Connection con =null;
		PreparedStatement  pst=null;
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	int status=0;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql="update certificate_student_info  set action=?   where student_id=? and certificate_id=? ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setString(1, action);
		pst.setInt(2, Integer.valueOf(student_id));
		pst.setInt(3, Integer.valueOf(certificate_id));
		 status=pst.executeUpdate();

		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return status;
	
	*/
		
		return 0;
				}

	@Override
	public List<Student_ReportDTO> getHostelAttendenceInformation(String course_id, String academic_year,
			String branch_id) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> attendence_list=new ArrayList<Student_ReportDTO>();
		
		int course=Integer.valueOf(course_id);
		int academic_year1=Integer.valueOf(academic_year);
		Session session=	getSession();
		SessionImpl sessionImpl = (SessionImpl) session;
		String sql=null;
		
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		try
		{
			
		
			
			/*sql=	 "select a.id as student_id,name as student_name,father_name,a.bord_generated_admission_no , uid_no "   
					   +" from student a,student_hostel b  where academic_year =?    and  branch_id =? and "
					   +" course_id  =?   and b.student_id=a.id ";*/
			
			/*sql=    " select a.id as student_id,name as student_name,father_name,a.bord_generated_admission_no , uid_no  ," + 
					" cast(coalesce(is_present ,false) as character varying) as is_present from student a " + 
					" inner join student_hostel b on(b.student_id=a.id) " + 
					" left outer join student_attendance c on(c.student_id=a.id and  cast(attendance_date as date)=current_date) " + 
					" where academic_year =?   and  branch_id =? and " + 
					" course_id  =?   " ;*/
			
			sql=    " select a.id as student_id,name as student_name,father_name,a.bord_generated_admission_no , uid_no  ," + 
					" cast(coalesce(is_present ,false) as character varying) as is_present from student a " + 
					" inner join student_hostel b on(b.id=a.student_host_id) " + 
					" left outer join student_attendance c on(c.student_id=a.id and  cast(attendance_date as date)=current_date) " + 
					" where academic_year =?   and  branch_id =? and " + 
					" course_id  =?   " ;
			
			pst=con.prepareStatement(sql);
			
			pst.setInt(1, academic_year1);
			pst.setInt(2, Integer.valueOf(branch_id));
			pst.setInt(3, course);
			
			
			rs=pst.executeQuery();
		
		
		
		
		while(rs.next())
		{
			Student_ReportDTO srd=new Student_ReportDTO();
			srd.setStudent_id(rs.getString("student_id"));
			srd.setName(rs.getString("student_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setFather_name(rs.getString("father_name"));
			
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			srd.setIs_present(rs.getString("is_present"));
			
			attendence_list.add(srd);
			
	
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return attendence_list;
	}
	
	
	@Override
	public int getPrevious_Hostel_Fee(String uid) {




		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		int previous_amount=0;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= "  select a.uid_no,(hostel_fee-fee_amount) as hostel_prev_fee from " + 
				"				(select a.uid_no,coalesce(sum(hostel_fee),0) as hostel_fee from student a " + 
				"				left outer join student_hostel b on(a.student_host_id=b.id) " + 
				"				where  a.uid_no =? " + 
				"				group by  a.uid_no)a " + 
				
				"				left join " + 
				"				(select a.uid_no,coalesce(sum(fee_amount),0) as fee_amount  from student a " + 
				"				left outer join student_tution_fee_detail b on(a.id=b.student_id and  fee_type  in(1,7)) " + 
				"                                where  a.uid_no =? " + 
				"                                group by   a.uid_no)b " + 
				"                                on(a.uid_no=b.uid_no) " ;
				
		try
		{
		pst=con.prepareStatement(sql);
	
		pst.setString(1, uid);
		pst.setString(2, uid);
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			previous_amount=	rs.getInt("hostel_prev_fee");
		
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return previous_amount;
	
	
	
	
	}
	
	
	@Override
	public int getHostel_Fee(String id) {




		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		int hostel_fee=0;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
	//	String sql= "   select hostel_fee from student_hostel where  student_id =? " ;
		
		String sql= " select hostel_fee from student_hostel b,student a where  a.student_host_id=b.id	and a.id=? " ;
				
		try
		{
		pst=con.prepareStatement(sql);
	
		pst.setInt(1, Integer.valueOf(id));
		
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			hostel_fee=	rs.getInt("hostel_fee");
		
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return hostel_fee;
	
	
	
	
	}
	
	public int getHostel_Previous_Fee(String id) {




		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		int hostel_fee=0;
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
	//	String sql= "   select hostel_fee from student_hostel where  student_id =? " ;
		
		String sql= " select hostel_prev_fee from student_hostel b,student a where  a.student_host_id=b.id	and a.id=? " ;
				
		try
		{
		pst=con.prepareStatement(sql);
	
		pst.setInt(1, Integer.valueOf(id));
		
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			hostel_fee=	rs.getInt("hostel_prev_fee");
		
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return hostel_fee;
	
	
	
	
	}
	
	public String getHallticket_NO(String id) {




		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		String hallticket_no="";
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= "    select hallticket_no from student_admission_detail a,student b  where a.id=b.st_admission_id and b.id=?    " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
	
		pst.setInt(1, Integer.valueOf(id));
		
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			hallticket_no=	rs.getString("hallticket_no");
		
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return hallticket_no;
	
	
	
	
	}

	@Override
	public String courseName(String id) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		String courseName="";
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= " select name as course_name  from course    where id  =?  " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
	
		int courseId=Integer.parseInt(id);
		pst.setInt(1, courseId);
		
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			courseName=	rs.getString("course_name");
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return courseName;
	}

	@Override
	public String branchName(String course_id, String branch_id) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		String branchName="";
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= "  select name as branch_name  from branch  where id =? and  course_id  =?   " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
	
		int courseId=Integer.parseInt(course_id);
		int branchId=Integer.parseInt(branch_id);
		
		pst.setInt(1, branchId);
		pst.setInt(2,courseId);
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			branchName=	rs.getString("branch_name");
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return branchName;
	}

	@Override
	public String academicYear(String academic_year) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		String academicYear="";
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= " select academic_year_name from academic_year  where   id=? " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
	
		//int academicyearId=Integer.parseInt(academic_year);
		pst.setInt(1, Integer.parseInt(academic_year));
		
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			academicYear=	rs.getString("academic_year_name");
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return academicYear;
	}

	@Override
	public List<Student_ReportDTO> studentPromotionResetView(String course_id, String branch_id, String academic_year) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO > promote_resetList=new ArrayList<Student_ReportDTO>();
		
		int course=Integer.valueOf(course_id);
		int academic_year_id=Integer.valueOf(academic_year);
		Session session=	getSession();
		SessionImpl sessionImpl = (SessionImpl) session;
		String sql=null;
		
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		try
		{
			
		if(course_id.equalsIgnoreCase("2")||course_id.equalsIgnoreCase("3"))
		{
			
			sql=	"         select distinct  a.id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no ,promotion_id,c.id as actual_id " + 
					"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
					"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
					"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 " + 
					"         and  a.promotion_status=0 and a.id in(select student_id from " + 
					"         (select a.id as student_id ,count(1) " + 
					"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
					"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
					"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 and a.promotion_status=0" + 
					"         group by a.id having count(1)>=2 )subQry) " ;
			
			pst=con.prepareStatement(sql);
			pst.setInt(1, course);
			pst.setInt(2, academic_year_id);
			pst.setInt(3, Integer.valueOf(branch_id));
			
			pst.setInt(4, course);
			pst.setInt(5, academic_year_id);
			pst.setInt(6, Integer.valueOf(branch_id));
			
			rs=pst.executeQuery();
		}
		else
		{
			 sql=	  "   select id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no  "
					 + " from student  where    course_id =? and academic_year=? and branch_id=?  and promotion_status=0 and  course_comp_id is  null";
			   
			 
			 sql=	 "         select distinct  a.id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no ,promotion_id,c.id as actual_id " + 
				"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
				"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
				"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 " + 
				"         and  a.promotion_status=0 and a.id in(select student_id from " + 
				"         (select a.id as student_id ,count(1) " + 
				"	 from student a,student_tution_fee_detail b ,academic_year c,fee d where    a.course_id =? and a.academic_year=? and branch_id=? " + 
				"         and a.id=b.student_id and c.course_id=a.course_id and  promotion_id is not null and course_comp_id is  null " + 
				"         and c.id=a.academic_year and d.id=b.fee_type and b.fee_type=3 and a.promotion_status=0" + 
				"         group by a.id having count(1)>=1 )subQry) " ;
			 
			 
			 pst=con.prepareStatement(sql);
				pst.setInt(1, course);
				pst.setInt(2, academic_year_id);
				pst.setInt(3, Integer.valueOf(branch_id));
				
				pst.setInt(4, course);
				pst.setInt(5, academic_year_id);
				pst.setInt(6, Integer.valueOf(branch_id));
				rs=pst.executeQuery();

		}
		
		
		while(rs.next())
		{
			Student_ReportDTO srd=new Student_ReportDTO();
			srd.setStudent_id(rs.getString("student_id"));
			srd.setName(rs.getString("student_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setFather_name(rs.getString("father_name"));
			
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			
			srd.setPromotion_id(rs.getInt("promotion_id"));
			promote_resetList.add(srd);
			
	
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return promote_resetList;
	}

	@Override
	public List<Student_ReportDTO> getResetPromoted_Students(String student_id, String academic_year_id) {
		Connection con =null;
		PreparedStatement  pst=null;
		PreparedStatement  pst_fetch=null;
		ResultSet rs=null;
		List<Student_ReportDTO> promote_ResetList=new ArrayList<Student_ReportDTO>();
		
	//	int id_student=Integer.valueOf(student_id);
		int academic_year=Integer.valueOf(academic_year_id);
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	int status=0;
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql="   update student set promotion_status=0,   academic_year=?   where id in("+student_id+") ";
		String sql_fetch="   select id as student_id,name as student_name,father_name,bord_generated_admission_no  , uid_no   from student  where  promotion_status=0 and   id in("+student_id+")  ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setInt(1, academic_year);
		//pst.setInt(2, id_student);
		 status=pst.executeUpdate();

		 if(status>0)
		 {
			 pst_fetch=con.prepareStatement(sql_fetch);
				//pst.setInt(1, course);
				
				rs=pst_fetch.executeQuery();

				while(rs.next())
				{
					Student_ReportDTO srd=new Student_ReportDTO();
					srd.setStudent_id(rs.getString("student_id"));
					srd.setName(rs.getString("student_name"));
					srd.setUid_no(rs.getString("uid_no"));
					srd.setFather_name(rs.getString("father_name"));
					
					srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
					
					
					promote_ResetList.add(srd);
					
			
					
				}
				
			// getPromoteStudentDetails(student_promotion.getPrevious_course_id(),promotion_id);
		 }
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return promote_ResetList;
	}

	@Override
	public List<Student_ReportDTO> getStudentAdmissionList(String course_id, String branch_id, String academic_year) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> admissionList=new ArrayList<Student_ReportDTO>();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= "  select name,father_name,uid_no,hallticket_no,bord_generated_admission_no from   student a " + 
				"    left join student_admission_detail b on (a.st_admission_id=b.id )  " + 
				"    where  a.course_id=? and a.branch_id =? and a.academic_year=? " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
	
		//int academicyearId=Integer.parseInt(academic_year);
		pst.setInt(1, Integer.parseInt(course_id));
		pst.setInt(2, Integer.parseInt(branch_id));
		pst.setInt(3, Integer.parseInt(academic_year));
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			Student_ReportDTO srd=new Student_ReportDTO();
			
			srd.setName(rs.getString("name"));
			srd.setFather_name(rs.getString("father_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setHallticket_no(rs.getString("hallticket_no"));
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			
			admissionList.add(srd);
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return admissionList;
	}

	@Override
	public List<Student_ReportDTO> getFeenotPaidStudentList(String course_id, String branch_id, String academic_year,String fee_type,String availed_from, String availed_to) {
		
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> feeNotPaidList=new ArrayList<Student_ReportDTO>();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		java.util.Date date1 = null;
		try {
			date = sdf1.parse(availed_from);
			date1 = sdf1.parse(availed_to);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		java.sql.Date availedFromDate = new java.sql.Date(date.getTime());
	 //	System.out.println("availedFromDate=====>"+availedFromDate);
		java.sql.Date availedToDate = new java.sql.Date(date1.getTime());  
		
		
			
		String sql= "     select distinct a.id ,name,father_name,uid_no,bord_generated_admission_no from   student a where  " + 
				"				    a.id in " + 
				"				    (select id from student  " + 
				"				    except  " + 
				"				    select student_id from student_tution_fee_detail  where " + 
				"				     cast(paid_on as date)  BETWEEN ? AND ?  " + 
				"				     and fee_type=?  ) and " + 
				"				    a.course_id=? and a.branch_id =? and a.academic_year=? " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
	
		pst.setDate(1, availedFromDate);
		pst.setDate(2, availedToDate);
		pst.setInt(3, Integer.parseInt(fee_type));
		pst.setInt(4, Integer.parseInt(course_id));
		pst.setInt(5, Integer.parseInt(branch_id));
		pst.setInt(6, Integer.parseInt(academic_year));
		
		
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			Student_ReportDTO srd=new Student_ReportDTO();
			
			srd.setName(rs.getString("name"));
			srd.setFather_name(rs.getString("father_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			
			feeNotPaidList.add(srd);
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return feeNotPaidList;
	
	}

	@Override
	public List<Student_ReportDTO> getExamAndTutionFeePaidList(String course_id, String branch_id, String academic_year,
			String fee_type, String availed_from, String availed_to) {
		// TODO Auto-generated method stub
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> examAndTutionfeePaidList=new ArrayList<Student_ReportDTO>();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date = null;
	java.util.Date date1 = null;
	try {
		date = sdf1.parse(availed_from);
		date1 = sdf1.parse(availed_to);
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	java.sql.Date availedFromDate = new java.sql.Date(date.getTime());
 //	System.out.println("availedFromDate=====>"+availedFromDate);
	java.sql.Date availedToDate = new java.sql.Date(date1.getTime());  
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
		String sql= "    select name,father_name,uid_no,bord_generated_admission_no,fee_amount from   student a " + 
				"    inner  join student_tution_fee_detail b on (a.id=b.student_id )  " + 
				"    where  a.course_id=? and a.branch_id =? and a.academic_year=? and fee_type=? " + 
				"    and cast(paid_on as date)  BETWEEN ? AND ? " + 
				"    order by paid_on " ;
				
				
		try
		{
		pst=con.prepareStatement(sql);
		
		//int academicyearId=Integer.parseInt(academic_year);
		pst.setInt(1, Integer.parseInt(course_id));
		pst.setInt(2, Integer.parseInt(branch_id));
		pst.setInt(3, Integer.parseInt(academic_year));
		pst.setInt(4, Integer.parseInt(fee_type));
		pst.setDate(5, availedFromDate);
		pst.setDate(6, availedToDate);
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			Student_ReportDTO srd=new Student_ReportDTO();
			
			srd.setName(rs.getString("name"));
			srd.setFather_name(rs.getString("father_name"));
			srd.setUid_no(rs.getString("uid_no"));
			srd.setBord_generated_admission_no(rs.getString("bord_generated_admission_no"));
			srd.setFee_amount(rs.getInt("fee_amount"));
			
			examAndTutionfeePaidList.add(srd);
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return examAndTutionfeePaidList;
	}

	@Override
	public String feeTypeBasedonId(String fee_type) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		
		String feeType=null;
		
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
		String sql=" select fee_type from fee where id=? ";
		try
		{
		pst=con.prepareStatement(sql);
		pst.setInt(1, Integer.valueOf(fee_type));
		
		rs=pst.executeQuery();

		if(rs.next())
		{
			
			feeType=rs.getString("fee_type");
			
			
			
	//	System.out.println("%%%%%%%%%%%%%%%%%%"+cmdlist.size());
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return feeType;
	
	}

	@Override
	public List<Student_ReportDTO> getFeePaidDailyWise(String avialDate) {
		// TODO Auto-generated method stub
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> feePaidDailyList=new ArrayList<Student_ReportDTO>();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date = null;
	
	try {
		date = sdf1.parse(avialDate);
	
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	java.sql.Date availedFromDate = new java.sql.Date(date.getTime());
	
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
	/*	String sql= "  select name,father_name,uid_no,bord_generated_admission_no,fee_amount from   student a " 
				  +" inner  join student_tution_fee_detail b on (a.id=b.student_id )  "
				  +" where  cast(paid_on as date)=? order by uid_no ";*/
		String sql= "select  a.name as student_name,d.name as course_name,c.name as branch_name,academic_year_name,COALESCE(hallticket_no,'NA') as hallticket_no,receipt_no,f.fee_type,paid_on,fee_amount from   student a"  
					+" inner  join student_tution_fee_detail b on (a.id=b.student_id ) " 
					+" inner join branch c on(c.id=a.branch_id) "
					+" inner join course d on(d.id=a.course_id) "
					+" inner join academic_year e on(e.id=a.academic_year) "
					+" inner join fee f on(f.id=b.fee_type) "
					+" left outer join student_admission_detail g on(g.id=a.st_admission_id) "
					+" where  cast(paid_on as date)=? order by uid_no ";


				 
				
		
		try
		{
		pst=con.prepareStatement(sql);
		
		//int academicyearId=Integer.parseInt(academic_year);
	
		pst.setDate(1, availedFromDate);
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			Student_ReportDTO srd=new Student_ReportDTO();
			
			
			srd.setName(rs.getString("student_name"));
		    srd.setCourse_name(rs.getString("course_name"));
		    srd.setBranch_name(rs.getString("branch_name"));
		    srd.setAcademic_year_name(rs.getString("academic_year_name"));
			srd.setHallticket_no(rs.getString("hallticket_no"));
			srd.setFee_type(rs.getString("fee_type"));
			srd.setRegistered_on(rs.getDate("paid_on"));
			srd.setReceipt_no(rs.getString("receipt_no"));
			srd.setFee_amount(rs.getInt("fee_amount"));
			
			
			
			
			feePaidDailyList.add(srd);
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return feePaidDailyList;
	}

	@Override
	public List<Student_ReportDTO> hostelDetailsDailyWise(String avialDate) {
		Connection con =null;
		PreparedStatement  pst=null;
		ResultSet rs=null;
		List<Student_ReportDTO> hostedetailsList=new ArrayList<Student_ReportDTO>();
	Session session=	getSession();
	SessionImpl sessionImpl = (SessionImpl) session;
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date = null;
	
	try {
		date = sdf1.parse(avialDate);
	
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	java.sql.Date availedFromDate = new java.sql.Date(date.getTime());
	
	
		if(session!=null)
		{
	        con=sessionImpl.connection();
		}
			
			
	/*	String sql= "  select name,father_name,uid_no,bord_generated_admission_no,fee_amount from   student a " 
				  +" inner  join student_tution_fee_detail b on (a.id=b.student_id )  "
				  +" where  cast(paid_on as date)=? order by uid_no ";*/
		String sql= "select  a.name as student_name,d.name as course_name,c.name as branch_name,academic_year_name,cast(attendance_date as date) from   student a "  
				+ " inner  join student_attendance b on (a.id=b.student_id )  "
				+ " inner join branch c on(c.id=a.branch_id) "
				+ " inner join course d on(d.id=a.course_id) "
				+ " inner join academic_year e on(e.id=a.academic_year) "
				+ " where  cast(attendance_date as date)=? order by uid_no"; 

				 
				
		
		try
		{
		pst=con.prepareStatement(sql);
		
		//int academicyearId=Integer.parseInt(academic_year);
	
		pst.setDate(1, availedFromDate);
		
		rs=pst.executeQuery();

		while(rs.next())
		{
			
			Student_ReportDTO srd=new Student_ReportDTO();
			
			
			srd.setName(rs.getString("student_name"));
		    srd.setCourse_name(rs.getString("course_name"));
		    srd.setBranch_name(rs.getString("branch_name"));
		    srd.setAcademic_year_name(rs.getString("academic_year_name"));
			srd.setAttendance_date(rs.getDate("attendance_date"));
		
		
			
			
			
			
			hostedetailsList.add(srd);
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				//con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return hostedetailsList;
	}
}
