<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Startmin - Bootstrap Admin Theme</title>
<link rel="stylesheet" 	href="./css/font-awesome.min.css">
<link href="<c:url value='static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jquery.auto-complete.js"></script>

<link rel="stylesheet" 	href="./css/pure-min.css">



<link rel="stylesheet" 	href="./css/font-awesome.min.css">

<link rel="stylesheet" href="./js/jquery.auto-complete.css">
<style>
table {
	width: 100%;
}
</style>
<script>
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
		$("#actual_fee").text('');
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

			alert(jsonResponse.student_name);
			$("#s_name").text(jsonResponse.student_name);
			$("#f_name").text(jsonResponse.father_name);
			$("#c_name").text(jsonResponse.course_name);
			$("#m_name").text(jsonResponse.medium_name);
			$("#uid_no_id").text(jsonResponse.uid_no);
			$("#reg_on_id").text(jsonResponse.registered_on);
			$("#g_name").text(jsonResponse.gender_name);
			$("#b_name").text(jsonResponse.branch_name);
			$("#admission_year_id").text(jsonResponse.admission_year);

			$("#hidden_uid").val(jsonResponse.uid_no);
			$("#hidden_id").val(jsonResponse.id);

			// 		$("#stud_info").show();
			// 		$(".panel-footer").show();
		});
		// 	$("#stud_info").show();
		// 	$(".panel-footer").show();
	}
</script>
</head>
<body>
	<div class="generic-container" style="width: 98%">
	<div class="well lead">Search For Student Details
	
	<span class="floatRight"><a href="<c:url value="/logout" />">Logout</a></span>
	</div>
		<form onsubmit="$('#hero-demo').blur();return false;"
			class="pure-form"
			style="border-top: 1px solid #eee; border-bottom: 1px solid #eee; background: #fafafa; margin: 30px 0; padding: 20px 10px; text-align: center">
			<label style="font-style: normal">Student</label> : <input
				id="hero-demo" autofocus type="text"
				placeholder=" search with name  " class="uid_student"
				style="width: 800px; outline: 0">

			<button type="submit" class="searchButton" onclick="search_fun();">
				<span class='icon'><img src="./images/bigsearch-icon.jpg" style="height: 35px;width: 40px;"></span>
			</button>
		</form>
		<table id="stud_info" border="1" style="width: 1000px" align="center">
			<tr>
				<th>Student Name</th>
				<th>Father Name</th>
				<th>Uid NO</th>
				<th>Course Name</th>
				<th>Branch Name</th>
				<th>Medium Name</th>
				<th>Reg On</th>
				<th>Gender</th>
				<th>Admission Date</th>


			</tr>
			<tr>
				<td style="padding: 9px 0px 4px 0px;"><span id="s_name"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="f_name"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="uid_no_id"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="c_name"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="b_name"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="m_name"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="reg_on_id"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span id="g_name"></span></td>
				<td style="padding: 9px 0px 4px 0px;"><span
					id="admission_year_id"></span></td>
			</tr>

		</table>
		<div style="color: #0972a7;float: right;"><input type=button value="Cancel" onCLick="history.back()"></div>
	</div>
</body>
</html>