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

#table_width {
	max-width: 591%;
}
#wrapper{
 position: fixed;
  width: 600px;
  right: 56%;
  
  margin-left: -300px; 
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {

				$('#course_id').change(
						function(event) {

							var course_id = $('#course_id').val();
							$.get('branch', {
								course_id : course_id
							}, function(jsonResponse) {

								var branch_id = $('#branch_id');

								branch_id.find('option').remove();

								$('<option>').val('').text(
										'-------Select Branch------').appendTo(
										branch_id);

								$.each(jsonResponse.bt, function(index, value) {
									$('<option>').val(value.id)
											.text(value.name).appendTo(
													branch_id);

								});

								var acadmic_year = $('#academic_year');

								acadmic_year.find('option').remove();

								$.each(jsonResponse.ct, function(index, value) {
									$('<option>').val(value.id)
											.text(value.name).appendTo(
													acadmic_year);

								});

							});

						});

			});
</script>



</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<!-- 		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
		<ul class="nav navbar-right navbar-top-links"
			style="padding-right: 100px;">


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <span class='icon'><img
						src="./images/user-icon.png" style="height: 40px; width: 60px;">
						secondtruth</span> <b class="caret"></b>
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
				<a
				href="student_promotionreset_view"
				class="w3-bar-item w3-button w3-padding w3-blue"> <span
				class='icon'><img src="./images/group-users.png"
					style="height: 20px; width: 25px;"> Promotion Reset Module</span></a>
					</div>
				</nav>

				<!---------------------------------------------------------------  -->

			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->


		<div id="page-wrapper" style="width: 1200px">
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
							<div class="panel-heading">
								Promotion Reset For Students
								<c:if test="${courseName ne ''}">
									<font color="blue"><center>Course :
											${courseName} and Branch : ${branchName} and Year :
											${academicYear}</center></font>
							</div>
							</c:if>

							<div class="panel-body">
								<div class="row" style="margin-right: 101px;">

									<!-- /.col-lg-6 (nested) -->
									<div class="col-lg-4 ">


										<!-- <h3><font color="blue">Student Info Entry</font></h3> -->

										<form action="student_promotionreset_view" method="GET">

											<table id="table_width" width="1000" align="center">
												<tr>

													<td style="padding: 0px 0 0px 87px;"><select
														id="course_id" name="course_id" style="font-size: 14px;">
															<option value="0">---select course---</option>
															<option value="1">INTER</option>
															<option value="2">DEGREE</option>
															<option value="3">B.E.D</option>

													</select> <!--  </div> --> <!-- </div> --></td>
													<td>
														<!-- <div class="controls"> --> <select id="branch_id"
														name="branch_id" style="font-size: 14px;">
															<option value="0">--select Branch---</option>

													</select>
													</td>



													<td>
														<!-- <div class="controls"> --> <select id="academic_year"
														name="academic_year" style="font-size: 14px;">
															<option value="0">--select Academic Year--</option>

													</select>
														</div> <!-- </div> -->

													</td>

													<td><input type="submit" class="btn btn-primary"
														value="Submit Details"></td>

												</tr>
											</table>
											
										</form>
									</div>
												<c:if test="${not empty promoted_ResetList}">
										<table
											class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white"
											style="font-size: 11px; width: 94%" align="center">
											<form action="student_promoted_reset_students_action" method="GET">

												<tr>
													<th>S.NO</th>
													<th>Name</th>
													<th>Uid</th>
													<th>Father Name</th>
													<th>Admission No</th>

												</tr>

												<c:set var="sno" value="${1}" />
												<c:forEach items="${promoted_ResetList}" var="details">
													<tr>
														<td>${sno}<input type="checkbox"
															value="${details.student_id}#${details.promotion_id}"
															id="student_id" name="student_info"></td>
														<td>${details.name}</td>
														<td>${details.uid_no}</td>
														<td>${details.father_name}</td>
														<td>${details.bord_generated_admission_no}</td>

														<c:set var="sno" value="${sno+1}" />
													</tr>

												</c:forEach>

												<tr>

													<td colspan="5" align="center">
														<center>

															<input type="submit" class="btn btn-primary "
																value="Submit Details">
														</center>
													</td>
												</tr>
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
