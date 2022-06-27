<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Startmin - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./css/metisMenu.min.css" rel="stylesheet">
<script src="./js/jquery.min.js"></script>
<!-- Custom CSS -->
<link href="./css/startmin.css" rel="stylesheet">

<!-- Custom Fonts -->
 <link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
        
        <style type="text/css">
     
        #stud_info{
            position: absolute;
    		left: 650px;
    		width: 350px;
    }
       img {
  border-radius: 50%;
}   
.icon {
    height: 2px;
    width: 2px;
   color: blue;
    /* Other styles here */
}
.navbar-top-links>li>a:hover{
background-color: #000000;
} 
.navbar-top-links>.open>a:focus{
background-color: #000000;
}
#logout{
/* position: relative; */
left:50%;
}

/* .wrapper{
position: absolute;  
    width: 600px;
   right: 56%;
  
  margin-left: 2px;  
}  */ 
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
        
        
        function course_compeletion(uid)
        {
        	       
        	var	uid=$("#uid").val();
        	    var response_status=null;  
        	$.get('student-coursecompletedetails',{uid_no:uid},function(jsonResponse) {
        		
        		//alert("Student Course was not completed xx : "+jsonResponse);
        		if(jsonResponse=='0')
        			{
        			alert("Student Course was not completed : "+uid);
        			 
        			return false;
        			}
        		else
        			{
        			post_details();
        			
        			}
        		
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

var previous_fee=$("#previous_fee").val();
var hostel_prev_fee=$("#hostel_previous_fee").val();
var student_hostel={"hostel_prev_fee":hostel_prev_fee}
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
   
   
    var candidate = null; 
  
   
   
   if(hostel_prev_fee=='0')
	   {
	   candidate = 
	   {
			 "name": name,"gender_id": gender_id,"medium_id": medium_id,"father_name": father_name,"uid":uid,
			 "address":address,"pincode":pincode,"admission_year":admission_year,"academic_year":acadmic_year,"course_id":course_id,"branch_id":branch_id,
			 "actual_fee":actual_fee,"board_generated_admission_no":board_generated_admission_no,
			 "mobile_no":mobileno,"previous_fee":previous_fee
			  
	   };
	   
	   }
   else
   {
   candidate = 
   {
		 "name": name,"gender_id": gender_id,"medium_id": medium_id,"father_name": father_name,"uid":uid,
		 "address":address,"pincode":pincode,"admission_year":admission_year,"academic_year":acadmic_year,"course_id":course_id,"branch_id":branch_id,
		 "actual_fee":actual_fee,"board_generated_admission_no":board_generated_admission_no,
		 "mobile_no":mobileno,"previous_fee":previous_fee,"student_hostel":student_hostel
		  
   }; 
   }
  
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
				    
				    if(acadmic_year=="")
					{
						alert("Please Enter Acadmic_year Year");  
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
      //  url: "http://host.docker.internal:7771/api/student/create/",
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
	  
	  
	  
	
	$("#stud_info").hide();         
	
	$.get('course', function(jsonResponse) {
		
		var course_id = $('#course_id');
		
		course_id.find('option').remove();


		
		$('<option>').val('').text('Select Course').appendTo(course_id);
		
		$.each(jsonResponse, function(index, value) {
		$('<option>').val(value.id).text(value.name).appendTo(course_id);

		});

	});
	
	
	
 $.get('medium', function(jsonResponse) {
		
 		var medium_id = $('#medium_id');
		
		medium_id.find('option').remove();


		
 		$('<option>').val('').text('Select Medium').appendTo(medium_id);
		
 		$.each(jsonResponse, function(index, value) {
 		$('<option>').val(value.id).text(value.name).appendTo(medium_id);

 		});

 	});
	
	
	
$.get('gender', function(jsonResponse) {
	
	var gender_id = $('#gender_id');
	
	gender_id.find('option').remove();


	
	$('<option>').val('').text('Select Gender').appendTo(gender_id);
	
	$.each(jsonResponse, function(index, value) {
	$('<option>').val(value.id).text(value.name).appendTo(gender_id);

	});

});

$('#course_id').change(function(event) {
	
	
	var course_id = $('#course_id').val();
	
$.get('branch', {course_id : course_id},function(jsonResponse) {
	
	var branch_id = $('#branch_id');
	
	branch_id.find('option').remove();


	
	$('<option>').val('').text('Select Branch').appendTo(branch_id);
	
	$.each(jsonResponse.bt, function(index, value) {
	$('<option>').val(value.id).text(value.name).appendTo(branch_id);

	});

	var acadmic_year = $('#acadmic_year');
		
	acadmic_year.find('option').remove();
		
		
	
	
$('<option>').val('').text('Select Academicyear').appendTo(acadmic_year); 
	
	$.each(jsonResponse.ct, function(index, value) {
	$('<option>').val(value.id).text(value.name).appendTo(acadmic_year);

	});
	
	
	

});

});

	
	
$('#branch_id').change(function(event) {
	
	
	var course_id = $('#course_id').val();
	var branch_id = $('#branch_id').val();
	
	var uid_no = $('#uid').val();
	
$.get('branch_fee', {course_id : course_id,branch_id : branch_id,uid_no:uid_no},function(jsonResponse) {
	
	

//alert("======"+jsonResponse);
	console.log(jsonResponse);
	$("#actual_fee").val(jsonResponse.current_fee)
	$("#previous_fee").val(jsonResponse.previous_fee)
	$("#hostel_previous_fee").val(jsonResponse.hostel_previous_fee)
	
	

});

});
	
$('#uid').keyup(function(event) {
	
	var uid=$("#uid").val();
	/* 
	 var adharcard = /^\d{12}$/;
	
	if (uid != '') {
	     if (!uid.match(adharcard))
	     {
	         alert("Invalid Aadhar Number");
	         return false;
	     }
	 }
	 	alert(uid); */
	 
	if(uid.length==12)
		{
		$.get('studentuidbaseinfo',{uid_no:uid},function(jsonResponse) {
    		
    		if(uid=jsonResponse.uid_no)
    			{
		
    		alert("uid already exists" + jsonResponse.uid_no)
    			}
		
    		});
		}
});	
	
	
});





</script>

</head>
<body>

	<div class="wrapper">

          
          <div id="logout" style="padding-left: 1163px;padding-top: 0px;">
			<ul class="nav navbar-right navbar-top-links " style="position: relative;">
                    
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="line-height: 1px;padding: 25px;">
<!--                             <span class='icon'><img src="./images/user-icon.png" style="height: 40px;width: 60px; "> secondtruth</span>  <b class="caret"></b> -->
					 <span class='icon'>secondtruth</span>  <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user" style="right: -12px;">
                            <li><a href="#"><span class='icon'><img src="./images/userprofile-icon.png" style="height: 25px;width: 25px; "> User Profile</span></a>
                            </li>
                            <li><a href="#"><span class='icon'><img src="./images/setting-icon.png" style="height: 25px;width: 25px; "> Settings</span></a>
                            
                            </li>
                            <li class="divider"></li>
                            <li><a href="logout"><span class='icon'><img src="./images/logout-icon.jpg" style="height: 25px;width: 25px; "> Logout</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
  				</div> 
			

			
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						
						<li><a href="./">
							<span class='icon'><img src="./images/bfa_dashboard_simple-blue.png" style="height: 20px;width: 20px;"> Dashboard</span>	</a></li>
						<li></li>
						<li>
                                 <a href="student_reports">
                                 <span class='icon'><img src="./images/reports.png" style="height: 20px;width: 25px;"> Reports</span></a>
                                 
                                 </li>
                           			
                            <li>
                                
                                <a href="student_creation_form">
                                 <span class='icon'><img src="./images/edit-icon.svg" style="height: 20px;width: 25px; "> Forms</span></a></li>
                           
                           
                            <li>
                                <a href="#"> <span class='icon'><img src="./images/information-icon.png" style="height: 20px;width: 20px;"> Student Information</span>
                                
                                <span><img src="./images/arrow-icon.png" style="height: 20px;width: 20px;"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                       
										<a href="student_attendence_information">Hostel Attendence</a>

                                    </li>
                                    <li>
										<a href="student_admission_list">Student Admission</a>
                                    </li>
                                    <li>
										<a href="student_examfeenotpaid_list">Student Fee NotPaid</a>
                                    </li>
                                    <li>
										<a href="student_examandtution_feepaid_list">Student Exam & Tution Fee Paid</a>
                                    </li>
                                    <li>
										<a href="feepaid_dailywise_list">Fee Paid DailyWise</a>
                                    </li>
                                      <li>
										<a href="hostedetails_dailywise">Hostel Report DailyWise</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>


					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
			 
<!-- 		</nav> -->

		<div id="page-wrapper" style="width: 1093px;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12" style="width: 95%">
						<!-- <h1 class="page-header">Forms</h1> -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #0972a7"><center><font color="white">Student Info Entry</font></center></div>
							
							<div class="panel-body">
								<div class="row">
							
									<!-- /.col-lg-6 (nested) -->
									<div class="col-lg-4 ">


										<!-- <h3><font color="blue">Student Info Entry</font></h3> -->
										<form role="form" autocomplete="off" name="student_form" id="student_form_reset">
										<!-- STUDENT DATA TABLE START -->
										<div id="student_data">
							 				 <table id="stud_info" class="table  table-striped">
							 				 <tr>
							    				<td>Student Name</td>
							                     <th>:</th>
							    				 <td><span id="s_name"></span></td>
							  				</tr>
							  				<tr>
											   <td>Father Name</td>
											    <th>:</th>
											   <td><span id="f_name"></span></td>
										   </tr>
							     			<tr>
							    				<td>Uid NO</td>
							    				 <th>:</th>
							     				<td><span id="uid_no_id"></span></td>
							  				</tr>
							  				<tr>
							   					<td>Course Name</td>
							   					 <th>:</th>
							   					<td><span id="c_name"></span></td>
							   				</tr>
							     			<tr>
							    				<td>Branch Name</td>
							    				 <th>:</th>
							     				<td><span id="b_name"></span></td>
							  				</tr>
							 				 <tr>
							   					<td>Medium Name</td>
							   					 <th>:</th>
							   					<td><span id="m_name"></span></td>
							   				</tr>
							     			<tr>
							    				<td>Reg On</td>
							    				 <th>:</th>
							     				<td><span id="reg_on_id"></span></td>
							 				 </tr>
							  				<tr>
							   					<td>Gender</td>
							   					 <th>:</th>
							   					<td><span id="g_name"></span></td>
							   				</tr>
<!-- 							     			<tr> -->
<!-- 							    				<td>Admission Date</td> -->
<!-- 							    				 <th>:</th> -->
<!-- 							     				<td><span id="admission_year_id"></span></td> -->
<!-- 							  				</tr> -->
							  
							  			</table>
									</div> 
									<!-- STUDENT DATA TABLE START -->	
											<div class="form-outline mb-4" >
												<label class="control-label" for="inputError">Name<span style="color: red">*</span></label>
												<div class="controls">
													<input type="text" id="name" name="name"
														class="form-control"> <span class="help-inline"></span>
												</div>
											</div>


											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Father
													Name<span style="color: red">*</span></label>
												<div class="controls">
													<input type="text" id="father_name" name="father_name" class="form-control">
													<span class="help-inline"></span>
												</div>
											</div>

											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Uid<span style="color: red">*</span></label>
												<div class="controls">
													<input type="text" id="uid" name="uid" class="form-control"  maxlength="12" > <span
														class="help-inline" id="uid_errormsg"></span>
												</div>
											</div>

											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Address<span style="color: red">*</span></label>
												<div class="controls">
													<textarea  name="address" id="address" class="form-control"></textarea>
													<span class="help-inline"></span>
												</div>
											</div>

											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Pincode<span style="color: red">*</span></label>
												<div class="controls">
													<input type="text" id="pincode" name="pincode" class="form-control" maxlength="6"> <span
														class="help-inline"></span>
												</div>
											</div>
											
											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Mobile No<span style="color: red">*</span></label>
												<div class="controls">
													<input type="text" id="mobileno" name="mobileno" class="form-control" maxlength="10"> <span
														class="help-inline"></span>
												</div>
											</div>
											

											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Medium<span style="color: red">*</span></label>
												<div class="controls">
													<select id="medium_id" name="medium_id" class="form-control"></select>
													<span class="help-inline"></span>
												</div>
											</div>

											<!-- <div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Admission
													Year</label>
												<div class="controls">
													
														
														<select id="admission_year" name="admission_year" class="form-control">
												<option value="2015">2015</option>
												<option value="2016">2016</option>
												<option value="2017">2017</option>
												<option value="2018">2018</option>
												<option value="2019">2019</option>
												<option value="2020">2020</option>
												<option value="2021">2021</option>
												<option value="2022">2022</option>
												<option value="2023">2023</option>
												<option value="2024">2024</option>
												<option value="2025">2025</option>
												<option value="2026">2026</option>
												
												</select>
														
														<span class="help-inline"></span>
												</div>
											</div> -->
											
											

											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Course<span style="color: red">*</span></label>
												<div class="controls">
													<select id="course_id" name="course_id" class="form-control"></select>
													
													<span class="help-inline"></span>
												</div>
											</div>
											
											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Academic Year<span style="color: red">*</span>
													</label>
												<div class="controls">
												<select id="acadmic_year" name="acadmic_year" class="form-control" required="required">
												
												</select>
													<span class="help-inline"></span>
												</div>
											</div>

											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Branch<span style="color: red">*</span></label>
												<div class="controls">
													<select id="branch_id" name="branch_id" class="form-control"></select>
													<span class="help-inline"></span>
												</div>
											</div>



											<div class="form-outline mb-4">
												<label class="control-label" for="inputWarning">Gender<span style="color: red">*</span></label>
												<div class="controls">
													<select type="text" id="gender_id" name="gender_id" class="form-control"></select>
													<span class="help-inline"></span>
												</div>
											</div>
											<div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Actual
													Fee</label>
												<div class="controls">
													<input type="text" id="actual_fee" name="actual_fee" class="form-control" style="width: 33%;float: left;" placeholder="  current fee  " >
													<input type="text" id="previous_fee" name="previous_fee" class="form-control" style="width: 33%;float: left;" placeholder="  previous fee  " disabled="disabled">
													<input type="text" id="hostel_previous_fee" name="hostel_previous_fee" class="form-control" style="width: 33%;float: left;" placeholder="  hostel previous fee  " disabled="disabled">
													<span class="help-inline"></span>
												</div>
											</div>

											<!-- <div class="form-outline mb-4">
												<label class="control-label" for="inputSuccess">Registered
													On</label>
												<div class="controls">
													<input type="date" id="registered_on" name="registered_on" class="form-control">
													<span class="help-inline"></span>
												</div>
											</div> -->
			&nbsp;&nbsp;

		<center><button type="button" class="btn btn-primary btn" onclick="course_compeletion()">Submit  Details</button></center>
					
											
										</form>
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

</body>
</html>
