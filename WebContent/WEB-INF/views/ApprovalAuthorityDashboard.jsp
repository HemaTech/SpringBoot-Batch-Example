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

/* #wrapper{
 position: absolute;
  width: 600px;
  right: 56%;
  
  margin-left: -300px; 
} */
.iconlogout {
	height: 2px;
	width: 2px;
	color: blue;
}
</style>


<script type="text/javascript">


jQuery(document).ready(function($) {
    
});
function approved_info(action,student_id,certificate_id)
{
	
	alert(action);
    alert(student_id);
	$.ajax({
        type: "POST",       
        data: "action="+action+"&student_id="+student_id+"&certificate_id="+certificate_id,
        url: "student_approveStatus?${_csrf.parameterName}=${_csrf.token}",
        cache: false,
        success: function (res)
        {
        	alert(' Approved Successfully!');
        }  ,
        error: function (textStatus, errorThrown) {
            alert("Student Creation was failed."+textStatus)
        }
    });	
}
//////////////////////    from query secretariat_code value passed here in the hidden and this value setted in controller @Requestparam   ////////////////////////
</script>


</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<!-- 		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->


   <div id="logout" style="padding-left: 1163px; padding-top: 0px;">
		<ul class="nav navbar-right navbar-top-links"
			style="padding-right: 100px;">


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <span class='iconlogout'>
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
		</div>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<!-- <ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> /input-group
						</li>
						<li><a href="./"><i class="fa fa-dashboard fa-fw"></i>
								Dashboard</a></li>
						<li></li>
						<li>
                                 <a href="student_reports"><i class="fa fa-database"></i> Reports</a>
                            </li>
                            <li>
                                <a href="student_creation_form"><i class="fa fa-edit fa-fw"></i> Forms</a>
                            </li>
                            <li style="display: none">
                                <a href="#"><i class="fa fa-info-circle"></i> Student Information<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="student_info">Student Info Actions</a>
                                    </li>
                                    
                                </ul>
                                /.nav-second-level
                            </li>


					</ul> -->
				<!---------------------------------------------------------  -->

				<!-- Sidebar/menu -->

				<div class="w3-container w3-row">

					<div class="w3-col s8 w3-bar" style="width: 87%">
						<span>Welcome</span><br> <a href="#"
							class="w3-bar-item w3-button"> <span class='icon'><img
								src="./images/email-icon.png"
								style="height: 20px; width: 20px;"></span>
						</a> <a href="#" class="w3-bar-item w3-button"> <span class='icon'><img
								src="./images/smalluser-icon.png"
								style="height: 20px; width: 20px;"></span>
						</a> 
						<a href="#" class="w3-bar-item w3-button"> <span class='icon'><img
								src="./images/setting-icon.png"
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
						<!-- <a
				href="student_promotionreset_view"
				class="w3-bar-item w3-button w3-padding w3-blue"> <span
				class='icon'><img src="./images/group-users.png"
					style="height: 20px; width: 25px;"> Promotion Reset Module</span></a> -->
				</div>


				<!---------------------------------------------------------------  -->

			</div>
			<!-- /.sidebar-collapse -->
				<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
			
		</div>
		<!-- /.navbar-static-side -->
		<!-- 		</nav> -->

		<div id="page-wrapper" style="width: 1100px">
			<div class="w3-main" style="margin-left: 9px; margin-top: 43px;">

		<!-- Header -->
		<header class="w3-container" style="padding-top: 22px">
			<h5>
				<b><i class="fa fa-dashboard"></i> My Dashboard</b>
			</h5>
		</header>

		<div class="w3-row-padding w3-margin-bottom">
			<div class="w3-quarter">
				<div class="w3-container w3-red w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-comment w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>52</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>Messages</h4>
				</div>
			</div>
			<div class="w3-quarter">
				<div class="w3-container w3-blue w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-eye w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>99</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>Views</h4>
				</div>
			</div>
			<div class="w3-quarter">
				<div class="w3-container w3-teal w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-share-alt w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>23</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>Shares</h4>
				</div>
			</div>
			<div class="w3-quarter">
				<div class="w3-container w3-orange w3-text-white w3-padding-16">
					<div class="w3-left">
						<i class="fa fa-users w3-xxxlarge"></i>
					</div>
					<div class="w3-right">
						<h3>50</h3>
					</div>
					<div class="w3-clear"></div>
					<h4>Users</h4>
				</div>
			</div>
		</div>




		<div class="w3-container">
			<h5>Countries</h5>
			<table
				class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white"
				style="font-size: 11px">
				<tr>
					<th>Name</th>
					<th>Uid</th>
					<th>Certificate Name</th>
					<th>Admission No</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
				<c:forEach items="${cert_list}" var="details">
					<tr>

						<td>${details.name}</td>
						<td>${details.uid_no}</td>
						<td>${details.certificate_name}</td>
						<td>${details.bord_generated_admission_no}</td>
						<td>${details.certificate_status}</td>
						<td><input type="button" value="APPROVED"
							onclick="approved_info('${details.action}','${details.student_id}','${details.certificate_id}');"></td>
					</tr>
				</c:forEach>

			</table>
			<br>

		</div>
		<hr>

		<hr>

		<div class="w3-container">
			<h5></h5>
			<div class="w3-row">

				<div class="w3-col m10 w3-container">

					<p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum
						dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua.</p>
					<br>
				</div>
			</div>

			<div class="w3-row">

				<div class="w3-col m10 w3-container"></div>
			</div>
		</div>
		<br>



	</div>
			
	</div>
	</div>
	
	<!-- /#page-wrapper -->

	<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

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
