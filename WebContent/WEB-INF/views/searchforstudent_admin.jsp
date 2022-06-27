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
	
	
	function student_update_details(){
		
	/* 	var uid = '${hidden_uid}';
		var id = '${hidden_id}'; */
		var id = $("#hidden_id").val();
		var uid = $("#uid_no_id").val(); 
		var name = $("#s_name").val();
		var actual_fee = $("#s_fee").val();
		
		var hostel_fee = $("#h_s_fee").val();
		var admission_no = $("#admission_no").val();
		var hallticketno = $("#hallticket_no").val();
		
		var student_hostel={
			"hostel_fee" :hostel_fee,
			
		};
		var student_admission_detail={
			"hallticketno":hallticketno,
			 "board_generated_admission_no":admission_no
		};
		var candidate = {
				"id" : id,
			   "uid" : uid,
			  
			   "actual_fee":actual_fee,
			   "student_hostel":student_hostel,
			   "bord_generated_admission_no":admission_no,
			   "student_admission_detail":student_admission_detail

		};
		console.log(JSON.stringify(candidate));
	//alert(JSON.stringify(candidate));
		$.ajax({
			url : "http://192.168.0.32:7771/api/student/update",
			//url : "http://host.docker.internal:7771/api/student/update",
			type : "PUT",
			data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "json",
			 async: false,
			success : function(d) {
				console.log(d);
				alert("Student Details updated Sucessfully");
			
							
			},
	    	error: function (textStatus, errorThrown) {
	            alert("Student Details updation was failed.")
	        }
		});
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
						<tr><td></br></td></tr>
					<tr>
						<td colspan="10"><button type="submit" class="btn btn-primary btn" id="enable_button" 
								style="margin-left: 70px;" onclick="student_update_details()">UPDATE
								DETAILS</button></td>
					</tr>
				</table>
			</div>
			<label style="font-style: normal;color: red" id="error_lab"></label>
		</form>
		<div style="color: #0972a7; float: right;">
			<input  class="btn btn-primary btn" type=button value="Cancel" onCLick="history.back()">
		</div>
	
</body>
</html>