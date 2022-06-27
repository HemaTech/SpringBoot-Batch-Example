<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="stm" uri="/WEB-INF/studment_management.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<style type="text/css">
panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 2px solid transparent;
	/* border-radius: 4px; */
	-webkit-box-shadow: 0 1px 1px rgb(0 0 0/ 5%);
	box-shadow: 0 1px 1px rgb(0 0 0/ 5%);
}

.modal-header {
	padding: 9px 15px;
	border-bottom: 1px solid #eee;
	background-color: #428bca;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-topright: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-radius: 1px; @media ( max-width : @screen-xs-min) { .modal-xs {
	width: @modal-sm;
}

}
}
.modal-footer {
	border-bottom-left-radius: 6px;
	border-bottom-right-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-webkit-border-bottom-right-radius: 6px;
	-moz-border-radius-bottomleft: 6px;
	-moz-border-radius-bottomright: 6px;
	background-color: #428bca;
	border-radius: 1px; @media ( max-width : @screen-xs-min) { .modal-xs {
	width: @modal-sm;
}

}
}
/* #wrapper {
	position: absolute;
	width: 600px;
	right: 56%;
	margin-right: -750px;
} */
</style>

<title>Startmin - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="css/bootstrap_custom.css" rel="stylesheet"> -->
<!-- MetisMenu CSS -->
<link href="./css/metisMenu.min.css" rel="stylesheet">
<script src="./js/jquery.min.js"></script>
<!-- Custom CSS -->
<link href="./css/startmin.css" rel="stylesheet">

<!-- Custom Fonts -->
<!--  <link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->

<link rel="stylesheet" href="./css/font-awesome.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<style type="text/css">
style>input, textarea, select, .uneditable-input {
	display: inline-block;
	width: 210px;
	height: 28px;
	padding: 4px;
	margin-bottom: 9px;
	font-size: 13px;
	line-height: 18px;
	color: #555;
	border: 1px solid #ccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.control-group.error input, .control-group.error select, .control-group.error textarea
	{
	color: #b94a48;
	border-color: #b94a48;
}

.control-group.success input, .control-group.success select,
	.control-group.success textarea {
	color: #468847;
	border-color: #468847;
}

.control-group.warning input, .control-group.warning select,
	.control-group.warning textarea {
	color: #c09853;
	border-color: #c09853;
}

input, textarea, select, .uneditable-input {
	display: inline-block;
	width: 210px;
	height: 28px;
	padding: 4px;
	margin-bottom: 9px;
	font-size: 13px;
	line-height: 18px;
	color: #555;
	border: 1px solid #ccc;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/* .row { */
/* 	width: 1062px; */
/* } */
input, textarea {
	-webkit-box-shadow: inset 0 1px 1px rgb(0 0 0/ 8%);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgb(0 0 0/ 8%);
	-webkit-transition: border linear .2s, box-shadow linear .2s;
	-moz-transition: border linear .2s, box-shadow linear .2s;
	-ms-transition: border linear .2s, box-shadow linear .2s;
	-o-transition: border linear .2s, box-shadow linear .2s;
	transition: border linear .2s, box-shadow linear .2s;
}

.form-horizontal .control-label {
	float: left;
	width: 140px;
	padding-top: 5px;
	text-align: right;
}

.form-horizontal .control-group {
	margin-bottom: 18px;
	*zoom: 1;
}

.form-horizontal .controls {
	margin-left: 160px;
}

.flex-container {
	display: flex;
}

.flex-child {
	flex: 1;
	border: 0px solid green;
}

.flex-child:first-child {
	margin-right: 20px;
}

.header {
	padding: 10px;
	text-align: center;
	background: #1abc9c;
	color: white;
	font-size: 30px;
}

/* Page Content */
.content {
	padding: 20px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

li {
	display: inline;
}

#wrapper{
 position: absolute;
  width: 600px;
left: 22%; 
  
margin-left: -300px;  
}

.navbar-top-links>li>a:hover{
background-color: #000000;
} 
.navbar-top-links>.open>a:focus{
background-color: #000000;
}
.icon {
    height: 2px;
    width: 2px;
   color: blue;
   
}
</style>



<script type="text/javascript">

var course_id_fetch=null;
var course_name_fetch=null;
var certificate_status=null;

$(document).ready(function() {
	//var IP_ADDRESS='${IP_ADDRESS}';
	
	//alert(IP_ADDRESS);
});

function print_receipt_no(receipt_no,course_name)
{
	
    var rec_no=receipt_no ;
      $.ajax({
        type: "GET",       
        data: "receipt_no="+rec_no+"&course_name="+course_name,
        url: "print_receipt_no",
        cache: false,
         success: function (html)
        {
        	 $("#details_blue").html(html);
            
        } 
     
    });
	
	}
	
function application_fee_details()
{
	$.ajax({
		url : "student-token_check",
		type : "get",
		
		contentType : "application/json",
		dataType : "json",
		success : function(d) {
			update_fee_details();
		}
	});
}

function application_certification_details()
{
	$.ajax({
		url : "student-token_check",
		type : "get",
		
		contentType : "application/json",
		dataType : "json",
		success : function(d) {
			update_certificate_details();
		}
	});
}

function application_hostel_details()
{
	$.ajax({
		url : "student-token_check",
		type : "get",
		
		contentType : "application/json",
		dataType : "json",
		success : function(d) {
			update_hostel_details();
		}
	});
}

function application_admission_details()
{
	$.ajax({
		url : "student-token_check",
		type : "get",
		
		contentType : "application/json",
		dataType : "json",
		success : function(d) {
			update_admission_details();
		}
	});
}

function application_course_details()
{
	$.ajax({
		url : "student-token_check",
		type : "get",
		
		contentType : "application/json",
		dataType : "json",
		success : function(d) {
			update_course_comletion_details();
		}
	});
}





	function update_fee_details() {

		event.preventDefault();

		var fee_amount = $("#fee_amount").val();
		var paid_on = $("#paid_on").val();
		var fee_type = $("#fee_type").val();
		var recipt_no = $("#recipt_no").val();
		
		var challen_no = $("#challen_no").val();

		if(challen_no=="" && fee_type==3 && (course_id_fetch==2 || course_id_fetch==3))
			{
			alert("challen_no field is empty");
			return false;
			}
		
		
		if(fee_amount=="")
		{
		alert("amout field is empty");
		return false;
		}
		
		
		
		if(paid_on=="")
		{
		alert("paid on field is empty");
		return false;
		}
		
		if(fee_type=="")
		{
		alert("fee type field is empty");
		return false;
		}
		
		var student_tution_fee_detail = [ {
			"fee_amount" : fee_amount,
			
			"fee_type" : fee_type,
			"receipt_no":recipt_no,
			"challen_no":challen_no
		} ]

		var uid = '${hidden_uid}';
		var id = '${hidden_id}';
		
		var candidate = {
			"id" : id,	
			"uid" : uid,
			"student_tution_fee_detail" : student_tution_fee_detail

		};

		
		console.log(JSON.stringify(candidate));

		$.ajax({
			 url: "http://192.168.0.32:7771/api/student/update",
		//	url : "http://localhost:7771/api/student/update",
			//url:"http://host.docker.internal:7771/api/student/update",
			type : "PUT",
			data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "json",
			success : function(d) {
				
				getStudent_Info_Details();
			}
		});
		
		$("#challen_no").val('');
		$("#fee_amount").val('');
		$("#fee_type").val('');
		$("#challen_no").hide();
		
		
		
	}

	function update_course_comletion_details() {

		event.preventDefault();

		var course_completed = $("#course_completed").val();
		var tc_issued = $("#tc_issued").val();
		var tc_issued_date = $("#tc_issued_date").val();
if(course_completed=="")
	{
	alert("course completed field empty");
	return false;
	}
if(tc_issued=="")
{
alert("tc issued field empty");
return false;
}
if(tc_issued_date=="")
{
alert("tc issued date field empty");
return false;
}

		var course_completion = {
			"course_completed" : course_completed,
			"tc_issued" : tc_issued,
			"tc_issued_date" : tc_issued_date
		}

		var uid = '${hidden_uid}';
		var id = '${hidden_id}';
		//  alert("=========="+uid);
		var candidate = {
			"id" : id,
			"uid" : uid,
			"course_completion" : course_completion

		};

		//  alert(JSON.stringify(candidate));
		console.log(JSON.stringify(candidate));

		$.ajax({
			 url: "http://192.168.0.32:7771/api/student/update",
			// url : "http://localhost:7771/api/student/update",
			//url : "http://host.docker.internal:7771/api/student/update",
			type : "PUT",
			data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "json",
			success : function(d) {
				getStudent_Info_Details();
			}
		});

	}

	function update_admission_details() {
		event.preventDefault();

		var admissionid = $("#admissionid").val();
		var hallticket_no = $("#hallticket_no").val();
		var board_generated_admission_no = $("#board_generated_admission_no").val();
		
		
		/* if(board_generated_admission_no=="")
			{
			alert("Board Admission is empty");
			return false;
			} */
		
		
if(board_generated_admission_no!=null || board_generated_admission_no!=" ")
	{
		var student_admission_detail = {
			"admissionid" : '',
			"board_generated_admission_no" : board_generated_admission_no,
			"hallticketno" : hallticket_no
		}
		
		
		var uid = '${hidden_uid}';
		var id = '${hidden_id}';
		var candidate = {
				"id" : id,
			"board_generated_admission_no" : board_generated_admission_no,
			"uid" : uid,
			"student_admission_detail" : student_admission_detail

		};
		console.log(JSON.stringify(candidate));

		$.ajax({
			 url: "http://192.168.0.32:7771/api/student/update",
			//url : "http://localhost:7771/api/student/update",
			//url : "http://host.docker.internal:7771/api/student/update",
			type : "PUT",
			data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "json",
			success : function(d) {
				//alert(d);
				
				getStudent_Info_Details();
				
			},
	    	error: function (textStatus, errorThrown) {
	            alert("Student Admission Details updation was failed.")
	        }
		});
	}
else
	{
	alert("Board Admission is empty");
	}
$('#board_generated_admission_no').val('');
	}
	
	function update_hostel_details() {
		event.preventDefault();

		var availed_from = $("#availed_from").val();
		var discontinued_on = $("#discontinued_on").val();
		var hostel_fee=$("#hostelfee_id").val();
		
if(availed_from=="")
	{
	alert("Availed From is Empty");
	return false;
	}
if(discontinued_on=="")
{
alert("Discountinued is Empty");
return false;
}
if(hostel_fee=="")
{
alert("Hostel fee is Empty");
return false;
}

		var student_hostel_info =  {
			"availed_from" : availed_from,
			"discontinued_on" : discontinued_on,
			"hostel_fee" : hostel_fee
		};
		var uid = '${hidden_uid}';
		var id = '${hidden_id}';
		var candidate = {
			//"discontinued_on" : discontinued_on,
			"id" : id,
			"uid" : uid,
			"student_hostel" : student_hostel_info,
			"hostel_fee":hostel_fee

		};
		console.log(JSON.stringify(candidate));

		$.ajax({
			 url: "http://192.168.0.32:7771/api/student/update",
			//url : "http://localhost:7771/api/student/update",
			//url : "http://host.docker.internal:7771/api/student/update",
			type : "PUT",
			data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "json",
			success : function(d) {
				getStudent_Info_Details();
			}
		});

	}
	
	
	function update_certificate_details() {
		event.preventDefault();
//-------------------------------------------------------------//

var student_certificate_info =  [];
var values = new Array();
var action_val=$("#action_type").val();
var remarks=$("#remarks").val();
//alert("remarks")
$.each($("input[name='certificate_info[]']:checked"), function() {
	student_certificate_info.push({"certificate_id":$(this).val(),"action":action_val,"remarks":remarks});
	console.log(student_certificate_info);
  
});

if(student_certificate_info.length==0)
	{
	alert("Must Select Certificate.");
	return false;
	}
if(action_val=="0")
{
alert("Action is empty");
return false;
}
if(remarks=="")
{
alert("Remarks is empty");
return false;
}


		
//-------------------------------------------------------------//		
		
		var uid = '${hidden_uid}';
		var id = '${hidden_id}';

		var candidate = {
			
			"id" : id,
			"uid" : uid,
			"certificate_student_info" : student_certificate_info

		};
		//console.log(JSON.stringify(candidate+"=="));

		$.ajax({
			 url: "http://192.168.0.32:7771/api/student/update",
			//url : "http://localhost:7771/api/student/update",
			//url : "http://host.docker.internal:7771/api/student/update",
			type : "PUT",
			data : JSON.stringify(candidate),
			contentType : "application/json",
			dataType : "json",
			success : function(d) {
				getStudent_Info_Details();
			}
		});
		//$('input').val('');
		
		$('#certificate_info').prop('checked', false);
		$('#action_type').val('0');
		$('#remarks').val('');
		
	}
	
	$(document).ready(function() {
	
		
		
		$("#challen_no_div").hide();
		$("#challen_no").hide();
		
		
		$("#board_generated_admission_no").keypress(function (e) {
		     
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        
		        $("#board_generated_error").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
		
		
		$("#fee_amount").keypress(function (e) {
		     
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        
		    //    $("#board_generated_error").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
		
		
		
		
		var uid = '${hidden_uid}';
	
$.get('feetypes',function(jsonResponse) {
	
	var fee_type = $('#fee_type');
	
	fee_type.find('option').remove();


	
	
	
	$('<option>').val('').text('Choose Fee Type').appendTo(fee_type);
	
	$.each(jsonResponse, function(index, value) {
	$('<option>').val(value.id).text(value.fee_type).appendTo(fee_type);

	});
	
	
	
	});


	

$.get('studentuidbaseinfo',{uid_no:uid},function(jsonResponse) {
	
	$("#s_name").text(jsonResponse.student_name);
	$("#f_name").text(jsonResponse.father_name);
	$("#c_name").text(jsonResponse.course_name);
	$("#m_name").text(jsonResponse.medium_name);
	$("#uid_no_id").text(jsonResponse.uid_no);
	$("#reg_on_id").text(jsonResponse.registered_on);
	$("#g_name").text(jsonResponse.gender_name);
	$("#b_name").text(jsonResponse.branch_name);
	$("#admission_no").text(jsonResponse.board_generated_admission_no);
	$("#hallticket").text(jsonResponse.hallticket_no);
	$("#fee").text(jsonResponse.actual_fee);
	$("#p_fee").text(jsonResponse.previous_fee);
	$("#h_fee").text(jsonResponse.hostel_fee);
	$("#h_p_fee").text(jsonResponse.hostel_prev_fee);
	
	course_name_fetch=jsonResponse.course_name;
	///alert(course_name_fetch);
	});
		
		
		
		
		getStudent_Info_Details();
	//	getAdmission_NO();
	
	
		$('#fee_type').change(function(event) {
			
			//alert(course_id_fetch);
			
			var fee_type=$("#fee_type").val();
			//var course_id=$("#course_id").val();
			
			if(fee_type==3 && (course_id_fetch==2||course_id_fetch==3))
				{
		    $("#challen_no_div").show();
		    $("#challen_no").show();
				}
			else
				{
				$("#challen_no_div").hide();
				$("#challen_no").hide();
				$("#challen_lab").hide()
				}
			
		});
		
	});
	
	
	
	function getStudent_Info_Details() {
				
		var dateObj=null;
		var date=null;
		var month=null;
		var year=null;
		var hours=null;
		var minutes=null;
		var seconds=null;
		var paiddate=null;
		
		var uid = '${hidden_uid}';
		var student_id = '${hidden_id}';

		$.ajax({
			url: "http://192.168.0.32:7771/api/studentid/"+student_id,
			//url : 'http://localhost:7771/api/studentid/'+student_id,
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
					
					//alert(json.student_tution_fee_detail[i].fee_type_name);
					//console.log(json.student_tution_fee_detail);
					
					tr.push('<tr>');
					tr.push('<td>' + json.student_tution_fee_detail[i].fee_amount + '</td>');
					tr.push('<td>' + paiddate + '</td>');
					tr.push('<td>' + json.student_tution_fee_detail[i].receipt_no + '</td>');
					tr.push('<td>' + json.student_tution_fee_detail[i].fee_type_name + '</td>');
					tr.push('<td><a href="#" data-toggle="modal" data-target="#myModal" data-remote="false" data-toggle="modal" data-toggle="tooltip" onclick="print_receipt_no(\''+json.student_tution_fee_detail[i].receipt_no+'\',\''+json.course_id+'\')">PRINT PDF</a></td>');
					
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
	
	
	
	
	
	
	
	function getAdmission_NO() {
		
		var uid = '${hidden_uid}';
	
		$.get('generateadmissionno',{uid_no:uid},function(jsonResponse1) {
		
			
		 $('#admissionid').val(jsonResponse1.admission_no);
		
		 $('#recipt_no').val(jsonResponse1.receipt_no);

	});
	
	}
	

	
	
	
/* function getRecipt_NO() {
		
		var uid = '${hidden_uid}';
	alert("==============>"+uid);
	
		$.get('generateareciptno',{uid_no:uid},function(jsonResponse2) {
		
			alert(jsonResponse2);
		// $('#recipt_no').val(jsonResponse2);
		
		

	});
	
	} */
	
	
	
	
	
</script>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<!-- 		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
		<div class="navbar-header">

			<ul class="nav navbar-right navbar-top-links">

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <span class='icon'>
							secondtruth</span> <b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-user">

						<li><a href="#"><span class='icon'><img
									src="./images/userprofile-icon.png"
									style="height: 25px; width: 25px;"> User Profile</span></a>
						<li><a href="#"><span class='icon'><img
									src="./images/setting-icon.png"
									style="height: 25px; width: 25px;"> Settings</span></a>
						<li class="divider"></li>


						<li><a href="logout"><span class='icon'><img
									src="./images/logout-icon.jpg"
									style="height: 25px; width: 25px;"> Logout</span></a>
					</ul></li>
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">

						<li><a href="./"> <span class='icon'><img
									src="./images/bfa_dashboard_simple-blue.png"
									style="height: 20px; width: 20px;"> Dashboard</span>
						</a></li>

						<li><a href="student_reports"> <span class='icon'><img
									src="./images/reports.png" style="height: 20px; width: 25px;">
									Reports</span></a></li>
						<li><a href="student_creation_form"> <span class='icon'><img
									src="./images/edit-icon.svg" style="height: 20px; width: 25px;">
									Forms</span></a></li>
						<li><a href="#"> <span class='icon'><img
									src="./images/information-icon.png"
									style="height: 20px; width: 20px;"> Student Information</span> <span><img
									src="./images/arrow-icon.png"
									style="height: 20px; width: 20px;"></span></a>

							<ul class="nav nav-second-level">
								<li><a href="student_attendence_information">Hostel
										Attendence</a></li>
								<li><a href="student_admission_list">Student Admission
								</a></li>
								<li><a href="student_examfeenotpaid_list">Student Fee
										NotPaid</a></li>
								<li><a href="student_examandtution_feepaid_list">Student
										Exam & Tution Fee Paid</a></li>
							</ul>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
			<!-- 		</nav> -->
             <br>
			<div id="page-wrapper">
				<div class="container-fluid">
					<%-- <div class="row">
					<div class="col-lg-12">
						<h4 class="page-header">
							<center>Student Management System</center>
						</h4>
					</div>
					<!-- /.col-lg-12 -->
				</div> --%>
					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->
					<div class="row">
						<div class="col-lg-15">
							<div class="panel panel-primary" style="border-radius: 4px">
								<div class="panel-heading">Student Info</div>
								<!-- /.panel-heading -->
								<br>
								<table id="stud_info" border="1"
									style="width: 1000px; font-size: 14" align="center">
									<tr>
										<th>Student Name</th>

										<th>Uid</th>
										<th>Course</th>
										<th>Branch</th>
										<th>Medium</th>

										<th>Gender</th>
										<th>B.Admission</th>
										<th>HallTicket</th>

										<th>Fee</th>
										<th>Previous Fee</th>
										<th>Hostel Fee</th>
										<th>Hostel Previous Fee</th>

									</tr>
									<tr>
										<td style="padding: 9px 0px 4px 0px;"><span id="s_name"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span
											id="uid_no_id"></span></td>


										<td style="padding: 9px 0px 4px 0px;"><span id="c_name"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span id="b_name"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span id="m_name"></span></td>

										<td style="padding: 9px 0px 4px 0px;"><span id="g_name"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span
											id="admission_no"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span
											id="hallticket"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span id="fee"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span id="p_fee"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span id="h_fee"></span></td>
										<td style="padding: 9px 0px 4px 0px;"><span id="h_p_fee"></span></td>
									</tr>

								</table>

								<div class="panel-body">
									<!-- Nav tabs -->
									<ul class="nav nav-tabs">

										<li class=""><a href="#certificates" data-toggle="tab">Student
												Certificates Info</a></li>

										<li class="active"><a href="#home" data-toggle="tab">Student
												Hostel Info</a></li>
										<li><a href="#profile" data-toggle="tab">Student
												Admission Detail</a></li>
										<li><a href="#messages" data-toggle="tab">Course
												Completion</a></li>
										<li><a href="#settings" data-toggle="tab">Student Fee
												Details</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">
										<br>
										<div class="tab-pane fade in active" id="home">

											<div class="control-group error">
												<label class="control-label" for="inputError">Availed
													From</label>
												<div class="controls">
													<input type="date" id="availed_from" name="availed_from">
													<span class="help-inline"></span>
												</div>
											</div>

											<div class="control-group error">
												<%-- <label class="control-label" for="inputError">Discontinued
												On</label>
											<div class="controls">
												<input type="date" id="discontinued_on"
													name="discontinued_on"> <span class="help-inline"></span>
											</div> --%>
												<label class="control-label" for="inputError">Hostel
													Fee </label>
												<div class="controls">
													<input type="text" id="hostelfee_id" name="hostelfee_id">
													<span class="help-inline"></span>
												</div>
											</div>

											<div class="control-group success">

												<div class="controls">
													<center>
														<button type="button" class="btn btn-primary "
															onclick="application_hostel_details()">Submit
															Details</button>
													</center>

												</div>
											</div>
											<br>
											<table id="hostel_info" border="1" style="width: 1000px"
												align="center"></table>
										</div>

										<!-- ============================================================================================ -->

										<div class="tab-pane fade " id="certificates">
											<div class="control-group error">
												<label class="control-label" for="inputError">Action
												</label>
												<div class="controls">
													<select id="action_type" name="action_name">
														<option value="0">Choose one</option>
														<option value="1">Student to College</option>

														<option value="2">College to Student</option>


													</select> <span class="help-inline"></span>
												</div>
											</div>
											<div class="control-group error">
												<label class="control-label" for="inputError">Certificate
													Details </label>
												<div class="controls">
													<c:set var="count" value="${1}" />
													<c:forEach items="${cetificate}" var="details">

														<c:set var="checkcount" value="${0}" />
														<table>
															<tr class="odd gradeX" style="color: green">

																<td>${count}</td>
																<td><input type="checkbox"
																	value="${details.certificate_id}" id="certificate_info"
																	name="certificate_info[]"
																	style="width: 15px; height: 15px;">
																	${details.certificate_name}</td>




																<c:set var="count" value="${count+1}" />
															</tr>

														</table>
													</c:forEach>





												</div>
											</div>

											<div class="control-group error">
												<div class="control-group success">
													<label class="control-label" for="inputError">Remarks
													</label>
													<div class="controls">

														<input type="text" name="remarks" id="remarks">

													</div>
												</div>
											</div>
											<%-- <div align="right">
												<table>
													<tr>
														<td><a
															href="http://localhost:8080/SpringMVCHibernateSecurity/files/TC/${hidden_uid}">Transfer
																Certificate</a></td>
													</tr>
													<tr>
														<td><a
															href="http://localhost:8080/SpringMVCHibernateSecurity/files/Bonafied/${hidden_uid}">Bonafied
																Certificate</a></td>
													</tr>
													<tr>
														<td><a
															href="http://localhost:8080/SpringMVCHibernateSecurity/files/Conduct/${hidden_uid}">Study&Conduct
																Certificate</a></td>
													</tr>
													<tr>
														<td><a
															href="http://localhost:8080/SpringMVCHibernateSecurity/files/Memo/${hidden_uid}">MarksMemo
																Certificate</a></td>
													</tr>
												</table>
											</div> --%>

											<div class="control-group success">

												<div class="controls">
													<center>
														<button type="button" class="btn btn-primary "
															onclick="application_certification_details()">Submit
															Details</button>
													</center>

												</div>
											</div>
											<br>
											<table id="studentcertificates" border="1"
												style="width: 1000px" align="center"></table>

											<table id="certificate_info" border="1" style="width: 1000px"
												align="center"></table>
										</div>

										<!-- =================================================== -->



										<div class="tab-pane fade" id="profile">



											<div class="control-group error">
												<label class="control-label" for="inputError"
													id="admission_label">Board Admission Number</label>
												<div class="controls">
													<input type="text" id="board_generated_admission_no"
														name="board_generated_admission_no"> <span
														class="help-inline" id="board_generated_error"><font
														color="red"></font></span>
												</div>


											</div>

											<div class="control-group error">
												<label class="control-label" for="inputError"
													id="hallticket_label"> Hallticket Number</label>
												<div class="controls">
													<input type="text" id="hallticket_no" name="hallticket_no">
													<span class="help-inline" id=hallticket_generated_error"><font
														color="red"></font></span>
												</div>


											</div>

											<div class="control-group success">

												<div class="controls">
													<center>
														<button type="button" class="btn btn-primary "
															onclick="application_admission_details()">Submit
															Details</button>
													</center>

												</div>
											</div>
											<br>

											<table id="studentadmission" border="1" style="width: 1000px"
												align="center"></table>
										</div>


										<div class="tab-pane fade" id="messages">


											<div class="control-group error">
												<label class="control-label" for="inputError">Course
													Completed</label>
												<div class="controls">
													<%-- <input type="text" id="course_completed"
													name="course_completed"> <span class="help-inline"></span> --%>

													<select id="course_completed" name="course_completed">
														<option value="0">Choose one</option>
														<option value="true">Completed</option>

														<option value="false">Not Completed</option>


													</select>

												</div>
											</div>


											<div class="control-group success">
												<label class="control-label" for="inputSuccess">TC
													issued</label>
												<div class="controls">
													<%-- <input type="text" id="tc_issued" name="tc_issued">
												<span class="help-inline"></span> --%>

													<select id="tc_issued" name="tc_issued">
														<option value="0">Choose one</option>
														<option value="true">Issued</option>

														<option value="false">Not Issued</option>


													</select>
												</div>
											</div>

											<div class="control-group success">
												<label class="control-label" for="inputSuccess">TC
													Issued Date </label>
												<div class="controls">
													<input type="date" id="tc_issued_date"
														name="tc_issued_date"> <span class="help-inline"></span>
												</div>
											</div>

											<div class="control-group success">

												<div class="controls">
													<center>
														<button type="button" class="btn btn-primary "
															onclick="application_course_details()">Submit
															Details</button>
													</center>

												</div>
											</div>
											<table id="coursecompletion" border="1" style="width: 1000px"
												align="center"></table>
										</div>




										<div class="tab-pane fade" id="settings">

											<div class="control-group error">
												<label class="control-label" for="inputError">Fee
													Type</label>
												<div class="controls">
													<select id="fee_type" name="fee_type">
													</select> <span class="help-inline"></span>
												</div>
											</div>


											<div class="control-group success">
												<label class="control-label" for="inputSuccess">Amount</label>
												<div class="controls">
													<input type="text" id="fee_amount" name="fee_amount">
													<span class="help-inline"></span>
												</div>
											</div>

											<%-- <div class="control-group success">
											<label class="control-label" for="inputSuccess">Paid
												On </label>
											<div class="controls">
												<input type="date" id="paid_on" name="paid_on"> <span
													class="help-inline"></span>
											</div>
										</div> --%>


											<div class="control-group success" style="display: none;">

												<div class="controls">
													<input type="hidden" id="recipt_no" name="recipt_no">
													<span class="help-inline"></span>
												</div>
											</div>

											<div class="control-group success" id="challen_no_div">
												<label class="control-label" for="inputSuccess"
													id="challen_lab">Challan Number </label>
												<div class="controls">
													<input type="text" id="challen_no" name="challen_no">
													<span class="help-inline"></span>
												</div>
											</div>



											<div class="control-group success">

												<div class="controls">
													<center>
														<button type="button" class="btn btn-primary "
															onclick="application_fee_details()">Submit
															Details</button>
													</center>

												</div>
											</div>
											<br>
											<table id="feedetails" border="1" style="width: 1000px"
												align="center"></table>
										</div>

									</div>
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-6 -->

						<!-- /.col-lg-6 -->
					</div>

					<div class="row">
						<div class="col-lg-15">
							<div class="panel panel-primary">
								<div class="panel-heading"></div>
							</div>
						</div>
					</div>

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->

					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /#page-wrapper -->
		</div>
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="./js/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="./js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="./js/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="./js/startmin.js"></script>


		<div class="modal fade" id="myModal" role="dialog"
			style="min-width: 1044px">
			<div class="modal-dialog modal-lg" style="min-width: 900px">
				<div class="modal-content" style="min-width: 900pxpx">
					<div class="modal-header" style="min-width: 898px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h5 class="modal-title">
							<font color='blue'> </font>
						</h5>
					</div>
					<div class="modal-body" style="min-width: 887px" id="details_blue">



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		</div>
		

		<%--    ${fn:toUpperCase(stm:Certificate_Name('1','1'))} --%>
</body>
</html>
