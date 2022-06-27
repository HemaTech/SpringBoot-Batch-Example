<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Startmin - Bootstrap Admin Theme</title>
<link rel="stylesheet" href="./css/font-awesome.min.css">
<link href="<c:url value='static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jquery.auto-complete.js"></script>

<link rel="stylesheet" href="./css/pure-min.css">

<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link rel="stylesheet" href="./css/font-awesome.min.css">

<link rel="stylesheet" href="./js/jquery.auto-complete.css">
<style>
table {
	width: 100%;
}

#studentDetailsId {
	margin: 0 auto;
	width: 350px;
}


</style>
<script>
/* $( document ).ready(function() {
	("#studentDetailsId").hide();
}); */

	$(function() {

		$("#stud_info").hide();

		$(".panel-footer").hide();

		var choicesfecth = [];
		$.get('searchidex', function(jsonResponse) {
			//choicesfecth='<font color="green">'+jsonResponse+'</font>';
			choicesfecth = jsonResponse;
			//	alert(jsonResponse);
			//console.log(jsonResponse);
		});

		$('#hero-demo').autoComplete({
			minChars : 1,
			source : function(term, suggest) {
				term = term.toLowerCase();
				// alert("=="+choicesfecth)
				var choices = choicesfecth; //['ActionScript', 'AppleScript', 'Asp', 'Assembly', 'BASIC', 'Batch', 'C', 'C++', 'CSS', 'Clojure', 'COBOL', 'ColdFusion', 'Erlang', 'Fortran', 'Groovy', 'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp', 'Perl', 'PHP', 'PowerShell', 'Python', 'Ruby', 'Scala', 'Scheme', 'SQL', 'TeX', 'XML'];
				var suggestions = [];
				for (i = 0; i < choices.length; i++)
					if (~choices[i].toLowerCase().indexOf(term))
						suggestions.push(choices[i]);
				suggest(suggestions);
			}
		});
	});
	function search_fun() {

		$("#s_name").text('');
		$("#s_gender").text('');
		$("#s_father_name").text('');
		$("#branch_name").text('');
		$("#course_name").text('');
		$("#s_fee").text('');
		$("#admission_year").text('');
		$("#register_year").text('');
		$("#address").text('');
		$("#s_uid").text('');
		$("#medium_name").text('');

		$("#hidden_uid").text('');

		var stuid = $(".uid_student").val();

		$.get('studentuidbaseinfo', {
			uid_no : stuid
		}, function(jsonResponse) {

			if(jsonResponse.status_flag!='0' && jsonResponse.uid_no!=null)
				{
				//alert(jsonResponse.status_flag);
			
			$("#s_name").text(jsonResponse.student_name);
			$("#f_name").text(jsonResponse.father_name);
			$("#c_name").text(jsonResponse.course_name);
			$("#m_name").text(jsonResponse.medium_name);
			$("#uid_no_id").text(jsonResponse.uid_no);
			$("#reg_on_id").text(jsonResponse.registered_on);
			$("#g_name").text(jsonResponse.gender_name);
			$("#b_name").text(jsonResponse.actual_fee);
			$("#s_fee").text(jsonResponse.branch_name);
			$("#admission_year_id").text(jsonResponse.admission_year);

			$("#uid_no_id").val(jsonResponse.uid_no);
			$("#hidden_id").val(jsonResponse.id);
			$("#s_name").val(jsonResponse.student_name);
			$("#s_fee").val(jsonResponse.actual_fee);
			$("#h_s_fee").val(jsonResponse.hostel_fee);
			$("#hallticket_no").val(jsonResponse.hallticket_no);
			$("#admission_no").val(jsonResponse.board_generated_admission_no);
			
			$("#error_lab").text('');
			$("#stud_info").show();
			$("#enable_button").show();
			
			
			getStudent_Info_Details(jsonResponse.uid_no,jsonResponse.id);
				}
			else
				{
				$("#error_lab").text(' not valid input ! ');
				$("#stud_info").hide();
				$("#enable_button").hide();
				}

			// 		$("#stud_info").show();
			// 		$(".panel-footer").show();
		});
		// 	$("#stud_info").show();
		// 	$(".panel-footer").show();
	}
	
	
	function getStudent_Info_Details(uid_check,id_check) {
		
		var dateObj=null;
		var date=null;
		var month=null;
		var year=null;
		var hours=null;
		var minutes=null;
		var seconds=null;
		var paiddate=null;
		
		var uid = uid_check;
		var student_id = id_check;

		$.ajax({
			// url: "http://host.docker.internal:7771/api/student/"+student_id,
			 
			 url: "http://192.168.0.32:7771/api/student/"+student_id,
			//url : 'http://host.docker.internal:7771/api/student/update,
			type : "GET",
			
			contentType : "application/json",
			dataType : "json",
			success : function(json) {
				 
				
				 course_id_fetch=json.course_id;
				
				var tr=[];
				tr.push('<tr>');
				tr.push('<th>Amount</th>');
				tr.push('<th>Date and Time</th>');
				tr.push('<th>Recipt Number</th>');
				tr.push('<th>Fee Type</th>');
				tr.push('<th>Action</th>');
				
				tr.push('</tr>');
				
				for (var i = 0; i < json.student_tution_fee_detail.length; i++) {
					convertDate= json.student_tution_fee_detail[i].paid_on;
					dateObj=new Date(convertDate);
					 date = ("0" + dateObj.getDate()).slice(-2);
					 month = ("0" + (dateObj.getMonth() + 1)).slice(-2);
					 year = dateObj.getFullYear();
					 hours = dateObj.getHours();
					 minutes = dateObj.getMinutes();
					 seconds = dateObj.getSeconds();
					paiddate=date + "-" + month + "-" + year + " " + hours + ":" + minutes + ":" + seconds;
					
					
					tr.push('<tr>');
					tr.push('<td>' + json.student_tution_fee_detail[i].fee_amount + '</td>');
					tr.push('<td>' + paiddate + '</td>');
					tr.push('<td>' + json.student_tution_fee_detail[i].receipt_no + '</td>');
					tr.push('<td>' + json.student_tution_fee_detail[i].fee_type_name + '</td>');
					tr.push('<td><a href="#" data-toggle="modal" data-target="#myModal" data-remote="false" data-toggle="modal" data-toggle="tooltip" onclick="deleteStudentData(\''+uid+'\',\''+student_id+'\',\''+json.student_tution_fee_detail[i].id+'\')">DELETE</a></td>');
					
					tr.push('</tr>');
				}
				$('#feedetails').html($(tr.join('')));
				
				/* <!-- =======================================================================  --> */
				
				if(json.course_completion!=null)
					{
				var tr_course=[];
				tr_course.push('<tr>');
				tr_course.push('<th>Course_completed</th>');
				tr_course.push('<th>Tc_issued</th>');
				tr_course.push('<th>Tc_issued_date</th>');
				
				
				tr_course.push('</tr>');
				
				
				tr_course.push('<tr>');
				if(json.course_completion.course_completed==true)
					{
					  	tr_course.push('<td>YES</td>');
					}else if(json.course_completion.course_completed==false){
						tr_course.push('<td>No</td>');
					}
				/* tr_course.push('<td>' + json.course_completion.course_completed + '</td>'); */
				if(json.course_completion.tc_issued==true){
					tr_course.push('<td>YES</td>');
				}else if(json.course_completion.tc_issued==false){
					tr_course.push('<td>No</td>');
				}
				
				/*tr_course.push('<td>' + json.course_completion.tc_issued + '</td>');*/
				tr_course.push('<td>' + json.course_completion.tc_issued_date + '</td>');
					
					
				tr_course.push('</tr>');
				
				$('#coursecompletion').html($(tr_course.join('')));
					}
				/* <!-- =======================================================================  --> */
				
				/* <!-- =======================================================================  --> */
				if(json.student_hostel!=null)
					{
				var tr_hostel=[];
				tr_hostel.push('<tr>');
				tr_hostel.push('<th>Availed From</th>');
				tr_hostel.push('<th>Discontinued On</th>');
				tr_hostel.push('<th>Hostel Fee</th>');
				
				
				
				tr_hostel.push('</tr>');
				
				
				
					tr_hostel.push('<tr>');
					tr_hostel.push('<td>' + json.student_hostel.availed_from + '</td>');
					tr_hostel.push('<td>' + json.student_hostel.discontinued_on + '</td>');
					tr_hostel.push('<td>' + json.student_hostel.hostel_fee + '</td>');
					
					
					tr_hostel.push('</tr>');
				
				
				
				
				$('#hostel_info').html($(tr_hostel.join('')));
					}
				/* <!-- =======================================================================  --> */
				
				
				/* <!-- =======================================================================  --> */
				if(json.student_admission_detail!=null)
					{
				var tr_admission=[];
				tr_admission.push('<tr>');
				tr_admission.push('<th>Admission Number</th>');
				tr_admission.push('<th>Board Admission Number</th>');
				tr_admission.push('<th>Hallticket Number</th>');
				
				
				
				tr_admission.push('</tr>');
				
				
				tr_admission.push('<tr>');
				tr_admission.push('<td>' + json.student_admission_detail.admissionid + '</td>');
				if(json.student_admission_detail.board_generated_admission_no==null)
					{
				tr_admission.push('<td>' + 'NA' + '</td>');
					}
				else
					{
					tr_admission.push('<td>' + json.student_admission_detail.board_generated_admission_no + '</td>');
					$("#board_generated_admission_no").hide();
					$("#admission_label").hide();
					
					}
				
				
				if(json.student_admission_detail.hallticketno==null)
				{
			tr_admission.push('<td>' + 'NA' + '</td>');
				}
			else
				{
				tr_admission.push('<td>' + json.student_admission_detail.hallticketno + '</td>');
				$("#hallticket_no").hide();
				$("#hallticket_label").hide();
				
				}
				
				
					
					
				tr_admission.push('</tr>');
				
				$('#studentadmission').html($(tr_admission.join('')));
					}
				/* <!--  =======================================================================  --> */
				
				
				/* ------------------------------------------------------------ */
				
				if(json.certificate_student_info!=null)
					{
					//alert("=======certificate_status====");
				var tr_certificate=[];
				tr_certificate.push('<tr>');
				tr_certificate.push('<th>Certificate Name</th>');
				tr_certificate.push('<th>Action Name</th>');
				tr_certificate.push('<th>Action Time</th>');
				tr_certificate.push('<th>Remarks</th>');
				
				
				tr_certificate.push('</tr>');
				
				for (var i = 0; i < json.certificate_student_info.length; i++) {
					
					
					
					tr_certificate.push('<tr>');
					tr_certificate.push('<td>' + json.certificate_student_info[i].certificate_name + '</td>');
					tr_certificate.push('<td>' + json.certificate_student_info[i].action_name + '</td>');
					tr_certificate.push('<td>' + json.certificate_student_info[i].generateTime + '</td>');
					tr_certificate.push('<td>' + json.certificate_student_info[i].remarks + '</td>');
				
					
					
					tr_certificate.push('</tr>');
				}
				if(json.certificate_student_info.length==0)
					{
					
				//	alert("=======certificate_status=else==="+certificate_status);
					$("#action_type option[value='2']").remove();
					}
				$('#studentcertificates').html($(tr_certificate.join('')));
					}
				
				
				/* ---------------------------------------------------------------- */
				
				
			//	getAdmission_NO();
			}
		});

	}
	
	function deleteStudentData(uid,student_id,deleteId){
		alert(deleteId);
		$.ajax({
			//url : "http://192.168.0.32:7771/api/student/update",
			//url : "http://host.docker.internal:7771/api/student-TutionFeeTranaction-delete/"+deleteId,
			url : "http://192.168.0.32:7771/api/student-TutionFeeTranaction-delete/"+deleteId,
			type : "DELETE",
			//data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "text",
			 async: false,
			success : function(d) {
				console.log(d);
				alert("Student Details Deleted Sucessfully");
				getStudent_Info_Details(uid,student_id);
				
			},
	    	error: function (textStatus, errorThrown) {
	            alert("Student Details Deletion was failed.")
	        }
		})
		
	}
	
</script>
</head>
<body>
	<div class="generic-container" style="width: 98%">
		<div class="well lead">
			Search For Student Details <span class="floatRight"><a
				href="<c:url value="/logout" />">Logout</a></span>
		</div>
		<form onsubmit="$('#hero-demo').blur();return false;"
			class="pure-form"
			style="border-top: 1px solid #eee; border-bottom: 1px solid #eee; background: #fafafa; margin: 30px 0; padding: 20px 10px; text-align: center">
			<label style="font-style: normal">Student</label> : <input
				id="hero-demo" autofocus type="text"
				placeholder=" search with name  " class="uid_student"
				style="width: 800px; outline: 0">

			<button type="submit" class="searchButton" onclick="search_fun();">
				<span class='icon'><img src="./images/bigsearch-icon.jpg"
					style="height: 35px; width: 40px;"></span>
			</button>
		</form>

		<form id="studentDetailsId">
		
			<label style="font-style: normal;color: red" id="error_lab"></label>
		</form>
		<div style="color: #0972a7; float: right;">
			<input  class="btn btn-primary btn" type=button value="Cancel" onCLick="history.back()">
		</div>
		
		<form id="studentDetailsId">
		<div>
				<table id="stud_info">
					<tr>
						<td>Student ID</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="hidden_id" id="hidden_id" disabled="disabled"></td>
					</tr>
					
					<tr>
						<td>Student Name</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="s_name" id="s_name" disabled="disabled"></td>
					</tr>
					
					<tr>
						<td>Student UID</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="uid_no_id" id="uid_no_id" disabled="disabled"></td>
					</tr>
					
					<tr>
						<td>Fee</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="s_fee" id="s_fee"></td>
					</tr>
					
					<tr>
						<td>Hostel Fee</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="h_s_fee" id="h_s_fee"></td>
					</tr>
					
					<tr>
						<td>Admission NO</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="admission_no" id="admission_no"></td>

					</tr>
					
					<tr>
						<td>Hallticket NO</td>
						<td>&nbsp;&nbsp;</td>
						<th>:</th>
						<td>&nbsp;&nbsp;</td>
						<td><input type="text" name="hallticket_no"
							id="hallticket_no"></td>
					</tr>
					<!-- 	<tr><td></br></td></tr>
					<tr>
						<td colspan="10"><button type="submit" class="btn btn-primary btn" id="enable_button" 
								style="margin-left: 70px;" onclick="student_update_details()">UPDATE
								DETAILS</button></td>
					</tr> -->
				</table>
			</div>
			<label style="font-style: normal;color: red" id="error_lab"></label>
		</form>
		
		<table id="feedetails" border="1" style="width: 1000px"
												align="center"></table>
	
</body>
</html>