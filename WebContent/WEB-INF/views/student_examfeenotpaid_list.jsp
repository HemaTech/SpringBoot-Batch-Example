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


<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jquery.auto-complete.js"></script>
<meta name="description"
	content="A lightweight autocomplete plugin for jQuery.">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Startmin - Bootstrap Admin Theme</title>
<!-- Custom CSS -->
<link href="./css/startmin.css" rel="stylesheet">


<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="./css/dataTables/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="./css/dataTables/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="./css/startmin.css" rel="stylesheet">

<link rel="stylesheet" href="./css/font-awesome.min.css">
<link rel="stylesheet" href="./js/jquery.auto-complete.css">
<link rel="stylesheet" href="./css/w3.css">

<style type="text/css">
#table_width {
	max-width: 591%;
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

<script language="javascript">             var tableToExcel = (function() {
                var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
 , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
    return function(table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
    }
})()
        </script>

 
 
<script type="text/javascript">

        $(document).ready(function() {
        	
        	$('#course_id').change(function(event) {
            	
            	
            	var course_id = $('#course_id').val();
            	
            $.get('branch', {course_id : course_id},function(jsonResponse) {
            	

            	
            	var branch_id = $('#branch_id');
            	
            	branch_id.find('option').remove();

            	
            var acadmic_year = $('#academic_year');
            	
            acadmic_year.find('option').remove();
            	
            	
            	
            	$('<option>').val('').text('Choose Branch').appendTo(branch_id);
            	
            	$.each(jsonResponse.bt, function(index, value) {
            	$('<option>').val(value.id).text(value.name).appendTo(branch_id);

            	});
            	
            	
            	
          
            $('<option>').val('').text('Choose Academicyear').appendTo(acadmic_year);
            
            	$.each(jsonResponse.ct, function(index, value) {
            	$('<option>').val(value.id).text(value.name).appendTo(acadmic_year);

            	});
            	
            	
            
            });

            });
        	
        	
        	
        	$.get('feetypes',function(jsonResponse) {
        		
        		var fee_type = $('#fee_type');
        		
        		fee_type.find('option').remove();

        		
        		
        		$('<option>').val('').text('Choose Fee Type').appendTo(fee_type);
        		
        		$.each(jsonResponse, function(index, value) {
        		$('<option>').val(value.id).text(value.fee_type).appendTo(fee_type);

        		});
        		
        	});
        	
        	
        });


		       
		/* $("#submitId").click(function(){
		  alert("The paragraph was clicked.");
		});
 */
 /* function submitFee(){
	 //alert("hai");
	 var course_id=$("#course_id").val();
	 var branch_id=$("#branch_id").val();
	 var academic_year=$("#academic_year").val();
	 var fee_type=$("#fee_type").val();
	 var availed_from=$("#availed_from").val();
	 var availed_to=$("#availed_to").val();
	 
	 $.ajax({
	        type: "GET",
	        url: "student_examandtution_feepaid_list",
	        dataType: "json",
	        async: false,
	        data: {"course_id": course_id,"branch_id": branch_id,"academic_year": academic_year,"fee_type": fee_type,"availed_from": availed_from,"availed_to": availed_to},
	      		        
	        success: function (jsonResponse) {
	        	console.log(jsonResponse)
	        },
	        	error: function (textStatus, errorThrown) {
		        	
		        
	        }
 });
 } */


</script>

<style>
/* @import url(https://fonts.googleapis.com/css?family=Open+Sans); */
body {
	background: #f2f2f2;
	font-family: 'Open Sans', sans-serif;
}

.search {
	width: 100%;
	position: relative;
	display: flex;
}

.searchTerm {
	width: 100%;
	border: 3px solid #00B4CC;
	border-right: none;
	padding: 5px;
	height: 36px;
	border-radius: 5px 0 0 5px;
	outline: none;
	color: #9DBFAF;
}

.searchTerm:focus {
	color: #00B4CC;
}

.searchButton {
	width: 40px;
	height: 40px;
	border: 1px solid #00B4CC;
	background: #00B4CC;
	text-align: center;
	color: #fff;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
	font-size: 20px;
	padding: 0px 0 7px 0;
}

/*Resize the wrap to see the search bar change!*/
.wrap {
	width: 30%;
	position: absolute;
	top: 24%;
	left: 55%;
	transform: translate(-50%, -50%);
}
</style>

</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<!-- 		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
		<div id="logout" style="padding-left: 1163px;padding-top: 0px;">
			<ul class="nav navbar-right navbar-top-links " style="position: relative;">
                    
                    <li class="dropdown" style="margin-top: -10px;">
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
								style="height: 20px; width: 20px;"> Student Information</span> <!-- 					 <span class="fa arrow"></span></a> -->
							<span class='icon'><img src="./images/arrow-icon.png"
								style="height: 20px; width: 20px;"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="student_attendence_information">Hostel
									Attendence</a></li>
							<li><a href="student_admission_list">Student Admission
									</a></li>
							<li><a href="student_examfeenotpaid_list">Student Fee
									NotPaid</a></li>
									 <li>
										<a href="student_examandtution_feepaid_list">Student Exam & Tution Fee Paid</a>
                                    </li>
                                    <li>
										<a href="feepaid_dailywise_list">Fee Paid DailyWise</a>
                                    </li>
                                      <li>
										<a href="hostedetails_dailywise">Hostel Report DailyWise</a>
                                    </li>
						</ul> <!-- /.nav-second-level --></li>

				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
		<!-- 		</nav> -->

		<div id="page-wrapper" style="width: 1090px;">
			<div class="container-fluid">

				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<b>Student Fee Not Paid</b>
								<c:if test="${courseName ne ''}">
									<font color="blue"><center>Course :
											${courseName} and Branch : ${branchName} and Year :
											${academicYear} and Feetype:${feeType} and From Date:${fromDate} and To Date:${toDate}</center></font>
								</c:if>
							</div>
							<div class="panel-body">
								<div class="row" style="margin-right: 101px;">

									<!-- /.col-lg-6 (nested) -->
									<div class="col-lg-4 ">


										<!-- <h3><font color="blue">Student Info Entry</font></h3> -->

									<form action="student_examfeenotpaid_list" method="GET">
											
											<table id="table_width" width="1000">
												<tr>

													<td style="padding: 0px 0 0px 87px;"><select
														id="course_id" name="course_id" style="font-size: 14px;  width: 42%;">
															<option value="0">Choose Course</option>
															<option value="1">INTER</option>
															<option value="2">DEGREE</option>
															<option value="3">B.E.D</option>

													</select> <!--  </div> --> <!-- </div> --></td>
													<td>
														<!-- <div class="controls"> --> <select id="branch_id"
														name="branch_id" style="font-size: 14px; width: 85%">
																<option value="0">Choose Branch</option>

													</select>
													</td>
													<td>
														<!-- <div class="controls"> --> <select id="academic_year"
														name="academic_year" style="font-size: 14px; margin-left: 50px;">
															<option value="0">Choose Academic Year</option>

													</select></td>
													</tr><tr><td><br></td></tr>
													<tr>
													
													<td>
													<select id="fee_type" name="fee_type"
														style="font-size: 14px; margin-left:88px;">
															<option value="0">Choose Fee Type</option>

													</select>
													</td>
													<td>From:<input type="date" id="availed_from" name="availed_from" style="line-height: 20px;"></td>
													<td>To:<input type="date" id="availed_to" name="availed_to" style="line-height: 20px;"></td>
													</tr>
													<tr>
													<td><input type="submit"  class="btn btn-primary" id="submitId"
														value="Submit Details"   style="margin-left: 360px;"></td>
												</tr>
											</table>

										</form>
									</div>
									
			
									<c:if test="${not empty feeNotPaidList}">
									<table align="left" id="distexid" style="display: none"><tr><td colspan="11" align="center" >
									<input type="button" onclick="tableToExcel('principalcard', 'AePDS')" value="For Excel Sheet Download"></td></tr>
									</table>
										<table
											class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white"
											style="font-size: 11px; width: 94%; border: 1px"
											align="center" id="principalcard">
											<form>

												<tr>
													<th>S.NO</th>
													<th>Name</th>
													<th>Father Name</th>
													<th>Uid</th>
													<th>Admission No</th>

												</tr>
												<!--      <br><br><br> -->
												<c:set var="sno" value="${1}" />
												<c:forEach items="${feeNotPaidList}" var="details">
													<tr>
														<td>${sno}</td>
														<td>${details.name}</td>
														<td>${details.father_name}</td>
														<td>${details.uid_no}</td>
														<td>${details.bord_generated_admission_no}</td>

														<c:set var="sno" value="${sno+1}" />
													</tr>

												</c:forEach>
											</form>
										</table>
									</c:if>

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
