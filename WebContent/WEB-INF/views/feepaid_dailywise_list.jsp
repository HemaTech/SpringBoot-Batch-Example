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
#wrapper{
 position: absolute;
  width: 600px;
  right: 56%;
  
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
								<b>Student Fee Paid Daily Wise</b>
								
							</div>
							<div class="panel-body">
								<div class="row" style="margin-right: 101px;">

									<!-- /.col-lg-6 (nested) -->
									<div class="col-lg-4 ">


										<!-- <h3><font color="blue">Student Info Entry</font></h3> -->

									<form action="feepaid_dailywise_list" method="GET">
											
											<table id="table_width" width="1000">
												
													<tr>
													<td>Choose Date:<input type="date" id="availed_from" name="availed_from" style="line-height: 20px; "></td>
													</tr>
													<tr><td><br></td></tr>
													<tr>
													<td><input type="submit"  class="btn btn-primary" id="submitId"
														value="Submit Details"   style="margin-left: 360px;"></td>

												</tr>
											</table>

										</form>
									</div>
									
			
									<c:if test="${not empty examFeePaidDailyList}">
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
													<th>Course</th>
													<th>Branch</th>
													<th>AcademicYear</th>
													<th>HallTicketNo</th>
													<th>FeeType</th>
													<th>Paidon</th>
													<th>ReceiptNo</th>
													<th>Amount</th>

												</tr>
												
												<!--      <br><br><br> -->
												<c:set var="sno" value="${1}" />
												<c:set var="total" value="${0}"/>
												<c:forEach items="${examFeePaidDailyList}" var="details">
													<tr>
														<td>${sno}</td>
														<td>${details.name}</td>
														<td>${details.course_name}</td>
														<td>${details.branch_name}</td>
														<td>${details.academic_year_name}</td>
														<td>${details.hallticket_no}</td>
														<td>${details.fee_type}</td>
														<td>${details.registered_on}</td>
														<td>${details.receipt_no}</td>
														<td>${details.fee_amount}</td>
														
														 <c:set var="total" value="${total+details.fee_amount}" />
														<c:set var="sno" value="${sno+1}" />
													</tr>

												</c:forEach>
												<tr align="right"><th>Total:</th>
												<th>${total}</th></tr>
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
		<div id="logout" style="padding-left: 1258px;padding-top: 0px;">
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
