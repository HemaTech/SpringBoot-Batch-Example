<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Startmin - Bootstrap Admin Theme</title>



<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap_custom.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="./css/metisMenu.min.css" rel="stylesheet">

<script src="./js/jquery.min.js"></script>
<!-- Custom CSS -->
<link href="./css/startmin.css" rel="stylesheet">

<!-- Custom Fonts -->
<!--  <link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="./css/w3.css">

<link rel="stylesheet" href="./css/font-awesome.min.css">

<style type="text/css">
#stud_info {
	position: absolute;
	left: 650px;
	width: 350px;
}
.dropdown .caret {
    margin-top: -10px;

    margin-right: -10px;

}
#table_width {
	max-width: 591%;
}
/* #wrapper{
 position: absolute;
  width: 600px;
  right: 56%;
  
  margin-left: -300px; 
}
 */
.navbar-top-links>li>a:hover{
background-color: #000000;
} 
.navbar-top-links>.open>a:focus{
background-color: #000000;
}
.iconlogout {
    height: 2px;
    width: 2px;
   color: blue;
   
}
</style>

<script type="text/javascript">
        
        
        function Studen_with_uid(uid)
        {
        	       
        	      $("#stud_info").show();
        	      
        	$.get('studentuidbaseinfo',{uid_no:uid},function(jsonResponse) {
        		
        		$("#s_name").text(jsonResponse.student_name);
        		$("#f_name").text(jsonResponse.father_name);
        		$("#c_name").text(jsonResponse.course_name);
        		$("#m_name").text(jsonResponse.medium_name);
        		$("#uid_no_id").text(jsonResponse.uid_no);
        		$("#reg_on_id").text(jsonResponse.registered_on);
        		$("#g_name").text(jsonResponse.gender_name);
        		$("#b_name").text(jsonResponse.branch_name);
        		$("#admission_year_id").text(jsonResponse.admission_year);
        		
        		
        		});
        }

        
        
        
        
        
function post_details() {
    
 
	
	
event.preventDefault();
		
var	name=$("#name").val();
var	gender_id=$("#gender_id").val();
var	medium_id=$("#medium_id").val();
var	father_name=$("#father_name").val();
var	uid=$("#uid").val();
var	address=$("#address").val();



var	pincode=$("#pincode").val();
var	admission_year=$("#admission_year").val();
var	acadmic_year=$("#acadmic_year").val();

//alert(acadmic_year);
var	course_id=$("#course_id").val();
var	branch_id=$("#branch_id").val();
var	actual_fee=$("#actual_fee").val();
var	board_generated_admission_no=$("#board_generated_admission_no").val();


var	registered_on=$("#registered_on").val();
var	admissionid=$("#admissionid").val();

var	fee_amount=$("#fee_amount").val();
var	paid_on=$("#paid_on").val();
var	fee_type=$("#fee_type").val();



var	availed_from=$("#availed_from").val();

var	discontinued_on=$("#discontinued_on").val();


var	mobileno=$("#mobileno").val();


var student_hostel=[{"availed_from":availed_from,"discontinued_on":discontinued_on}]
var student_tution_fee_detail=[{"fee_amount":1,"paid_on":'2021-6-1',"fee_type":'1'}]
var student_admission_detail={"board_generated_admission_no":board_generated_admission_no}
	
   /*  var candidate = 
   {
		 "name": name,"gender_id": gender_id,"medium_id": medium_id,"father_name": father_name,"uid":uid,
		 "address":address,"pincode":pincode,"admission_year":admission_year,"course_id":course_id,"branch_id":branch_id,
		 "actual_fee":actual_fee,"board_generated_admission_no":board_generated_admission_no,"registered_on":registered_on,
		  "student_hostel":student_hostel,"student_tution_fee_detail":student_tution_fee_detail,
		  "student_admission_detail":student_admission_detail
		  
   };  */
   
   
    var candidate = 
   {
		 "name": name,"gender_id": gender_id,"medium_id": medium_id,"father_name": father_name,"uid":uid,
		 "address":address,"pincode":pincode,"admission_year":admission_year,"academic_year":acadmic_year,"course_id":course_id,"branch_id":branch_id,
		 "actual_fee":actual_fee,"board_generated_admission_no":board_generated_admission_no,
		 "mobile_no":mobileno
		  
   }; 
  
   //Form Validations
					
				 	 	if(name=="")
				 		{
					 		alert("Please Enter Your Name");  
					 		return false;
				 		}
				   
				 		if(father_name=="")
				 		{
					 		alert("Please Enter Your Father Name");  
					 		return false;
				 		}
				 		if(uid=="")
				 		{
					 		alert("Please Enter Your AadharNo");  
					 		return false;
				 		}
				 		if(address=="")
				 		{
					 		alert("Please Enter Your Address");  
					 		return false;
				 		}
				 	var pincodePattern = /(^\d{6}$)/;  
				 	if(pincode=="")
				 		{
				 		   alert("Please Enter Valid Pincode");  
				 		   return false;
				 		}
				    if (!pincodePattern.test(pincode)) 
				    {  
				        alert("Your Entered Pin Code Is Not Valid.");  
				        return false;
				    }   
				   
				    if(medium_id=="")
						{
							alert("Please Select Medium");  
							return false;
						}
				    
				    if(admission_year=="")
					{
						alert("Please Enter Admission Year");  
						return false;
					}
			    
				    
				    if(course_id=="")
					{
						alert("Please Select Course");  
						return false;
					}
				    if(branch_id=="")
					{
						alert("Please Select Branch");  
						return false;
					}
				    if(gender_id=="")
					{
						alert("Please Select Gender");  
						return false;
					}
				    if(registered_on=""){
				    	
				    	alert("Please Select Your Registration Date");  
						return false;
				    }
				    
				if(mobile_no=""){
				    	
				    	alert("Please Enter Mobile Number");  
						return false;
				    }
   
 //  alert(JSON.stringify(candidate));
    console.log(JSON.stringify(candidate));
  //  alert("Student Create Successfully with uid -- : ");
    $.ajax({
       url: "http://192.168.0.32:7771/api/student/create/",
     // 	url: "http://host.docker.internal:7771/api/student/create/",
        type: "post",
        data: JSON.stringify(candidate),
        contentType: "application/json",
        dataType: "json",
		 success: function(d) {
			 
            alert("Student Create Successfully with uid -- : "+d);
            
            Studen_with_uid(d);
            
            $("#student_form_reset")[0].reset();
        },
    	error: function (textStatus, errorThrown) {
        alert("Student Creation was failed.")
    }
    });
	
	
}


$(document).ready(function() {
	
	$('#course_id').change(function(event) {
    	
    	
    	var course_id = $('#course_id').val();
    	$.get('branch', {course_id : course_id},function(jsonResponse) {
    	
    	var branch_id = $('#branch_id');
    	
		branch_id.find('option').remove();
	
$('<option>').val('').text('Choose Branch').appendTo(branch_id);
	
	$.each(jsonResponse.bt, function(index, value) {
	$('<option>').val(value.id).text(value.name).appendTo(branch_id);

	});
	
    	
    	
    
    	
    var acadmic_year = $('#academic_year');
    	
    acadmic_year.find('option').remove();
    $('<option>').val('').text('Choose Acadmicyear').appendTo(acadmic_year);
    	$.each(jsonResponse.ct, function(index, value) {
    	$('<option>').val(value.id).text(value.name).appendTo(acadmic_year);

    	});
    	

    	});

    });
	
	$('#name').on('keydown', function(event) {
        if (this.selectionStart == 0 && event.keyCode >= 65 && event.keyCode <= 90 && !(event.shiftKey) && !(event.ctrlKey) && !(event.metaKey) && !(event.altKey)) {
           var $t = $(this);
           event.preventDefault();
           var charval = String.fromCharCode(event.keyCode);
           $t.val(charval + $t.val().slice(this.selectionEnd));
           this.setSelectionRange(1,1);
        }
    });
	
	
	$('#father_name').on('keydown', function(event) {
        if (this.selectionStart == 0 && event.keyCode >= 65 && event.keyCode <= 90 && !(event.shiftKey) && !(event.ctrlKey) && !(event.metaKey) && !(event.altKey)) {
           var $t = $(this);
           event.preventDefault();
           var charval = String.fromCharCode(event.keyCode);
           $t.val(charval + $t.val().slice(this.selectionEnd));
           this.setSelectionRange(1,1);
        }
    });
	
	$('#address').on('keydown', function(event) {
		
		var addressval=$('#address').val();
		$('#address').val(addressval.replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); }));
    });
	
	
	
	
	  $("#uid").keypress(function (e) {
		     
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        
		        $("#uid_errormsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
	  
	  $("#actual_fee ").keypress(function (e) {
		     
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        
		      //  $("#uid_errormsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
	  
	  $("#pincode").keypress(function (e) {
		     
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        
		      //  $("#uid_errormsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
	  
	  $("#mobileno").keypress(function (e) {
		     
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        
		      //  $("#uid_errormsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		   });
	  
	  
	  
	
	
	
	


	
	

	
	
});





</script>


<script type="text/javascript">
jQuery(document).ready(function($) {
    
});
function update_promotions_details()
{
		
	var student_info_promotion =  [];
	var values = new Array();
	var p_academic_year=$("#p_academic_year").val();
	
	$.each($("input[name='student_info_promotion[]']:checked"), function() {
		$(this).val().split("#");
		student_info_promotion.push({"student_id":$(this).val().split("#")[0],"promotion_id":$(this).val().split("#")[1]});
		console.log(student_info_promotion);
	});
	
var student_promotion = {
			"previous_course_id":'${course_id}',
			"previous_academic_year":'${academic_year}',
			"academic_year" : p_academic_year,
			"student_info_promotion" : student_info_promotion

		};

		console.log(JSON.stringify(student_promotion));

		$.ajax({
			url : "student_promoted_students_action",
			type : "POST",
			data : JSON.stringify(student_promotion),
			contentType : "application/json;",
			dataType : "json",
			success : function(d) {
			  alert("hello"+d);	
				
			},error : function(e) {
                console.log("ERROR: ", e);
              alert("====");
            }
		});
	
}
function display(data) {
    var json = "<h4>Ajax Response</h4>&lt;pre&gt;"
            + JSON.stringify(data, null, 4) + "&lt;/pre&gt;";
    $('#feedback').html(json);
}

function set_admission_detail(student_id,id)
{
	alert("--");
	var board_generated_admission_no=$("#admission_no"+id).val();
//	var student_info_promotion={"student_id":student_id,"board_generated_admission_no":board_generated_admission_no};
	
	
	$.ajax({
		url : "student_admission_students_action?student_id="+student_id+"&board_generated_admission_no="+board_generated_admission_no,
		type : "GET",
		
		contentType : "application/json;",
		dataType : "json",
		success : function(d) {
		  alert("hello"+d);	
			
		},error : function(e) {
            console.log("ERROR: ", e);
          alert("====");
        }
	});	
}


function update_admission_details(student_id,id,uid_no) {
	event.preventDefault();

	//var admissionid = $("#admissionid").val();
	var board_generated_admission_no=$("#admission_no"+id).val();
	
	var hallticet_no=$("#hallticket_no"+id).val();
	
	if(board_generated_admission_no=="")
		{
		alert("Board Admission is empty");
		return false;
		}
if(board_generated_admission_no!=null || board_generated_admission_no!=" ")
{
	var student_admission_detail = {
		
		"board_generated_admission_no" : board_generated_admission_no,
		"hallticketno":hallticet_no
	}
	
	var candidate = {
			"id" : student_id,
		"board_generated_admission_no" : board_generated_admission_no,
		"uid" : uid_no,
		"student_admission_detail" : student_admission_detail

	};
	console.log(JSON.stringify(candidate));

	$.ajax({
		//url : "http://host.docker.internal:7771/api/student/update",
		url : "http://192.168.0.32:7771/api/student/update",
		type : "PUT",
		data : JSON.stringify(candidate),
		contentType : "application/json",
		dataType : "json",
		success : function(d) {
			//alert(d);
			
		//	getStudent_Info_Details();
		
		$("#disable"+id).prop('disabled',true);
		$("#admission_no"+id).prop('disabled',true);
		$("#hallticket_no"+id).prop('disabled',true);
		
		alert("successfully updated")
			
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
</script>

</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<!-- 		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
		<div id="logout" style="padding-left: 1163px;padding-top: 0px;">
		
		<ul class="nav navbar-right navbar-top-links"
			style="padding-right: 100px;">


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><span class='iconlogout'>secondtruth</span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><span class='icon'><img
								src="./images/userprofile-icon.png"
								style="height: 25px; width: 25px;"> User Profile</span></a></li>
					<li><a href="#"><span class='icon'><img
								src="./images/setting-icon.png"
								style="height: 25px; width: 25px;"> Settings</span></a></li>
					<li class="divider"></li>
					<li><a href="logout"><span class='icon'><img
								src="./images/logout-icon.jpg"
								style="height: 25px; width: 25px;"> Logout</span></a></li>
				</ul></li>
		</ul>
		</div>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				
				<!---------------------------------------------------------  -->

				<!-- Sidebar/menu -->
				<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
					style="z-index: 3; width: 250px;" id="mySidebar">
					<br>
					<div class="w3-container w3-row">

						<div class="w3-col s8 w3-bar" style="width: 87%">
							<span>Welcome</span><br> <a href="#"
								class="w3-bar-item w3-button"> <span class='icon'><img
									src="./images/email-icon.png"
									style="height: 20px; width: 20px;"></span>
							</a> <a href="#" class="w3-bar-item w3-button"> <span
								class='icon'><img src="./images/smalluser-icon.png"
									style="height: 20px; width: 20px;"></span>
							</a> <a href="#" class="w3-bar-item w3-button"> <span
								class='icon'><img src="./images/setting-icon.png"
									style="height: 20px; width: 20px;"></span>
							</a>
						</div>
					</div>
					<hr>
					<div class="w3-container">
						<h5>Dashboard</h5>
					</div>
					<div class="w3-bar-block">
					<a href="#"
						class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
						onclick="w3_close()" title="close menu"><i
						class="fa fa-remove fa-fw"></i>  Close Menu</a> <a href="./"
						class="w3-bar-item w3-button w3-padding w3-blue"> <span
						class='icon'><img src="./images/group-users.png"
							style="height: 20px; width: 25px;"></span>Overview
					</a> <a href="student_promoted_students_view"
						class="w3-bar-item w3-button w3-padding w3-blue"> <span
						class='icon'><img src="./images/group-users.png"
							style="height: 20px; width: 25px;"> Promoted Module</span></a> <a
						href="student_admission_students_view"
						class="w3-bar-item w3-button w3-padding w3-blue"> <span
						class='icon'><img src="./images/group-users.png"
							style="height: 20px; width: 25px;"> Admission Module</span></a>
						<!-- 	<a
				href="student_promotionreset_view"
				class="w3-bar-item w3-button w3-padding w3-blue"> <span
				class='icon'><img src="./images/group-users.png"
					style="height: 20px; width: 25px;"> Promotion Reset Module</span></a> -->

				</div>
				</nav>

				<!---------------------------------------------------------------  -->

			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->


		<div id="page-wrapper" style="width: 1090px">
			<div class="container-fluid">
				<div class="row">
					<%-- <div class="col-lg-12">
						<h2 class="page-header" style="padding-left: 320px;">Student
							Admission Module ${courseName} ${branchName} ${academicYear}</h2>
					</div> --%>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Admissions For Students
							<c:if test="${courseName ne ''}">
							<font color="blue"><center>Course :	${courseName} and Branch :  ${branchName} and Year : ${academicYear}</center></font></div>
							</c:if>
							
							<div class="panel-body">
								<div class="row" style="margin-right: 101px;">

									<!-- /.col-lg-6 (nested) -->
									<div class="col-lg-4 ">


										<!-- <h3><font color="blue">Student Info Entry</font></h3> -->

										<form action="student_admission_students_view" method="GET">

											<table id="table_width" width="1000" align="center">
												<tr>
													<!-- <div class="control-group success"> -->
													<!-- <td>
            <label class="control-label" for="selectError">Select Course </label>
            <div class="controls">
      </td> -->
													<td style="padding: 0px 0 0px 87px;"><select
														id="course_id" name="course_id" style="font-size: 14px;">
															<option value="0">Choose Course</option>
															<option value="1">INTER</option>
															<option value="2">DEGREE</option>
															<option value="3">B.E.D</option>

													</select> <!--  </div> --> <!-- </div> --></td>
													<td>
														<!-- <div class="controls"> --> <select id="branch_id"
														name="branch_id" style="font-size: 14px;">
															<option value="0">Choose Branch</option>

													</select>
													</td>

													<!-- <td>    
              <div class="control-group success">
            <label class="control-label" for="selectError">Select Academic Year </label>
        </td>  -->

													<td>
														<!-- <div class="controls"> --> <select id="academic_year"
														name="academic_year" style="font-size: 14px;">
															<option value="0">Choose Academic Year</option>

													</select>
														</div> <!-- </div> -->

													</td>

													<td><input type="submit" class="btn btn-primary"
														value="Submit Details"></td>

												</tr>
											</table>

										</form>
									</div>
									<c:if test="${not empty admission_list}">
										<table
											class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white"
											style="font-size: 11px; width: 94%" align="center">
											<form action="student_promoted_students_action" method="GET">

												<tr>
													<th>S.NO</th>
													<th>Name</th>
													<th>Uid</th>
													<th>Father Name</th>
													<th>Admission No</th>
													<th>Hallticket No</th>
													<th>Action</th>

												</tr>

												<c:set var="sno" value="${1}" />
												<c:forEach items="${admission_list}" var="details">

													<tr>

														<td>${sno}</td>
														<td>${details.name}</td>
														<td>${details.uid_no}</td>
														<td>${details.father_name}</td>
														<td><input type="text" value="" name="admission_no"
															id="admission_no${sno}" placeholder="Enter admission no"
															style="height: 28px"></td>

														<td><input type="text" value="" name="hallticket_no"
															id="hallticket_no${sno}" placeholder="Enter hallticket no"
															style="height: 28px"></td>


														<td><input type="button" value="UPDATE"
															class="btn btn-primary" id="disable${sno}"
															onclick="update_admission_details('${details.student_id}','${sno}','${details.uid_no}')"></td>
														<c:set var="sno" value="${sno+1}" />
													</tr>

												</c:forEach>







											</form>
										</table>
									</c:if>
									<c:if test="${not empty promoted_list_result}">
										<table
											class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white"
											style="font-size: 11px; width: 94%" align="center">


											<tr>
												<th>S.NO</th>
												<th>Name</th>
												<th>Uid</th>
												<th>Father Name</th>
												<th>Admission No</th>

											</tr>

											<c:set var="sno" value="${1}" />
											<c:forEach items="${promoted_list_result}" var="details">
												<tr>

													<td>${sno}</td>
													<td>${details.name}</td>
													<td>${details.uid_no}</td>
													<td>${details.father_name}</td>
													<td>${details.bord_generated_admission_no}</td>

													<c:set var="sno" value="${sno+1}" />
												</tr>

											</c:forEach>

										</table>
									</c:if>
									<!-- <div>
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
							<td style="padding: 9px 0px 4px 0px;"><span id="admission_year_id"></span></td>
							</tr>
							
							</table></div> 	 	 -->



								</div>
								<!-- /.col-lg-6 (nested) -->
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
		
	</div>
	<!-- /#page-wrapper -->



	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="./js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./js/startmin.js"></script>

</body>
</html>
