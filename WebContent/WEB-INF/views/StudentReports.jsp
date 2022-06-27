<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jquery.auto-complete.js"></script>
<meta name="description"
	content="A lightweight autocomplete plugin for jQuery.">
<!-- <link rel="shortcut icon" href="https://pixabay.com/favicon.ico"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.rawgit.com/yahoo/pure-release/v0.6.0/pure-min.css"> -->
<link href="./css/pure-min.css" rel="stylesheet">
<title>Startmin - Bootstrap Admin Theme</title>

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

<!-- Custom Fonts -->
<!--  <link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<!--  <link rel="stylesheet" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


<link rel="stylesheet" href="./js/jquery.auto-complete.css">
<style>
table {
	width: 100%;
}
#enable_button{
   background-color: #337ab7;
}
/* #wrapper{ */
/* position: absolute;   */
/*   width: 600px; */
/*   right: 56%; */
  
/*   margin-left: 2px;  */
/* } */
 .icon {
    height: 2px;
    width: 2px;
   color: blue;
    /* Other styles here */
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
		$('#advanced-demo')
				.autoComplete(
						{
							minChars : 0,
							source : function(term, suggest) {
								term = term.toLowerCase();
								var choices = [ [ 'Australia', 'au' ],
										[ 'Austria', 'at' ],
										[ 'Brasil', 'br' ],
										[ 'Bulgaria', 'bg' ],
										[ 'Canada', 'ca' ], [ 'China', 'cn' ],
										[ 'Czech Republic', 'cz' ],
										[ 'Denmark', 'dk' ],
										[ 'Finland', 'fi' ],
										[ 'France', 'fr' ],
										[ 'Germany', 'de' ],
										[ 'Hungary', 'hu' ], [ 'India', 'in' ],
										[ 'Italy', 'it' ], [ 'Japan', 'ja' ],
										[ 'Netherlands', 'nl' ],
										[ 'Norway', 'no' ],
										[ 'Portugal', 'pt' ],
										[ 'Romania', 'ro' ],
										[ 'Russia', 'ru' ], [ 'Spain', 'es' ],
										[ 'Swiss', 'ch' ], [ 'Turkey', 'tr' ],
										[ 'USA', 'us' ] ];
								var suggestions = [];
								for (i = 0; i < choices.length; i++)
									if (~(choices[i][0] + ' ' + choices[i][1])
											.toLowerCase().indexOf(term))
										suggestions.push(choices[i]);
								suggest(suggestions);
							},
							renderItem : function(item, search) {
								search = search.replace(
										/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
								var re = new RegExp("("
										+ search.split(' ').join('|') + ")",
										"gi");
								return '<div class="autocomplete-suggestion" data-langname="'+item[0]+'" data-lang="'+item[1]+'" data-val="'+search+'"><img src="img/'+item[1]+'.png"> '
										+ item[0].replace(re, "<b>$1</b>")
										+ '</div>';
							},
							onSelect : function(e, term, item) {
								console
										.log('Item "'
												+ item.data('langname')
												+ ' ('
												+ item.data('lang')
												+ ')" selected by '
												+ (e.type == 'keydown' ? 'pressing enter or tab'
														: 'mouse click') + '.');
								$('#advanced-demo').val(
										item.data('langname') + ' ('
												+ item.data('lang') + ')');
							}
						});
	});

	if (~window.location.href.indexOf('http')) {
		(function() {
			var po = document.createElement('script');
			po.type = 'text/javascript';
			po.async = true;
			po.src = 'https://apis.google.com/js/plusone.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(po, s);
		})();
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=114593902037957";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
					.test(d.location) ? 'http' : 'https';
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = p + '://platform.twitter.com/widgets.js';
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, 'script', 'twitter-wjs');
		$('#github_social')
				.html(
						'\
                <iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-autoComplete&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
                <iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-autoComplete&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
            ');
	}
</script>

<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});

	function student_info() {
		$.ajax({
			url : 'student_info',
			type : 'get',
			dataType : 'json',

			success : function(response) {

			}
		});
	}

	function search_fun() {

		$("#stud_info").show();
		$(".panel-footer").show();

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

		
	//	alert("===="+stuid)
		  
		    $.ajax({
		        type: "GET",
		        url: "studentuidbaseinfo",
		        dataType: "json",
		        async: false,
		        data: {"uid_no": stuid},
		      		        
		        success: function (jsonResponse) {
		        	//alert("SatusFlag===>"+jsonResponse.status_flag)
		        	if(jsonResponse.status_flag!='0' && jsonResponse.uid_no!=null )
					{
		        		$("#s_name").text(jsonResponse.student_name);
		    			
		    			if(jsonResponse.father_name==null){
		    				$("#f_name").text("NA");
		    			}else{
		    				$("#f_name").text(jsonResponse.father_name);
		    			}
		        	$("#c_name").text(jsonResponse.course_name);
					$("#m_name").text(jsonResponse.medium_name);
					$("#uid_no_id").text(jsonResponse.uid_no);
					$("#reg_on_id").text(jsonResponse.registered_on);
					$("#g_name").text(jsonResponse.gender_name);
					$("#b_name").text(jsonResponse.branch_name);
					$("#admission_year_id").text(jsonResponse.admission_year);

					$("#hidden_uid").val(jsonResponse.uid_no);
					$("#hidden_id").val(jsonResponse.id);
					$("#error_lab").text('');
					$("#stud_info").show();
					$("#enable_button").show();
		           // alert(jsonResponse);
		        }
		        	else{
						$("#error_lab").text(' not valid input ! ');
						$("#stud_info").hide();
						$("#enable_button").hide();
					}
		        	},
		        
		        error: function (textStatus, errorThrown) {
		        	$("#error_lab").text(' not valid input ! ');
					$("#stud_info").hide();
					$("#enable_button").hide();
		        }
		    });
		    
		
		
		//---------------------------------------------------------//
		
	/* 	
		$.get('studentuidbaseinfo', {
			uid_no : stuid
		}, function(jsonResponse) {

			
			if(jsonResponse.status_flag!='0')
				{
			$("#s_name").text(jsonResponse.student_name);
			
			if(jsonResponse.father_name==null){
				$("#f_name").text("NA");
			}else{
				$("#f_name").text(jsonResponse.father_name);
			}
		
			$("#c_name").text(jsonResponse.course_name);
			$("#m_name").text(jsonResponse.medium_name);
			$("#uid_no_id").text(jsonResponse.uid_no);
			$("#reg_on_id").text(jsonResponse.registered_on);
			$("#g_name").text(jsonResponse.gender_name);
			$("#b_name").text(jsonResponse.branch_name);
			$("#admission_year_id").text(jsonResponse.admission_year);

			$("#hidden_uid").val(jsonResponse.uid_no);
			$("#hidden_id").val(jsonResponse.id);
			$("#error_lab").text('');
			$("#stud_info").show();
			$("#enable_button").show();
				}
			else
			{
			//alert(' not valid input ! ');
			$("#error_lab").text(' not valid input ! ');
			$("#stud_info").hide();
			$("#enable_button").hide();
			
			}

		});
		*/
		
		//===================================================///
	}
</script>
<link rel="stylesheet" href="./css/font-awesome.min.css">
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



		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>



		<ul class="nav navbar-right navbar-top-links">

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> 
						
			<span class='icon'>secondtruth</span>  <b class="caret"></b>


			</a>
				<ul class="dropdown-menu dropdown-user">

					<li><a href="#"><span class='icon'><img
								src="./images/userprofile-icon.png"
								style="height: 25px; width: 25px;"> User Profile</span></a><li><a href="#"><span class='icon'><img
								src="./images/setting-icon.png"
								style="height: 25px; width: 25px;"> Settings</span></a><li class="divider"></li>
					
					 <li><a href="logout"><span class='icon'><img
								src="./images/logout-icon.jpg"
								style="height: 25px;width: 25px; "> Logout</span></a>
				
				</ul></li>
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					
					<li><a href="./">
					<span class='icon'><img src="./images/bfa_dashboard_simple-blue.png" style="height: 20px;width: 20px;"> Dashboard</span>	</a></li>

					<li><a href="student_reports">
					 <span class='icon'><img src="./images/reports.png" style="height: 20px;width: 25px;"> Reports</span></a>
					  
					 </li>
					<li><a href="student_creation_form">
					 <span class='icon'><img src="./images/edit-icon.svg" style="height: 20px;width: 25px; "> Forms</span></a>
					 </li>
					<li><a href="#">
					<span class='icon'><img src="./images/information-icon.png" style="height: 20px;width: 20px;"> Student Information</span>
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
						
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->


		<div id="page-wrapper">
			<!-- <div
				style="max-width: 900px; padding: 0 10px; margin: 40px auto; text-align: center">

				<h2>
					SSS Junior and Degree College
					An extremely lightweight completion suggester plugin for jQuery.
				</h2>

				&nbsp;

			</div>
			 -->
			<div style="text-align: center;  font-size: 35px; color: #337ab7;">
  
        <!-- Declare all the characters of text 
            one-by-one, inside span tags -->
        <span class="G1">SSS Junior and Degree College</span>
        <!-- <span class="e1">e</span>
        <span class="e2">e</span>
        <span class="k1">k</span>
        <span class="s1">s</span> -->
       
        </div>
			
			<form onsubmit="$('#hero-demo').blur();return false;"
				class="pure-form"
				style="border-top: 1px solid #eee; border-bottom: 1px solid #eee; background: #fafafa; margin: 30px 0; padding: 20px 10px; text-align: center">
				<label style="font-style: normal">Search Student</label> : <input
					id="hero-demo" autofocus type="text"
					placeholder=" search with name  " class="uid_student"
					style="width: 800px; outline: 0">

				<button type="submit" class="searchButton" onclick="search_fun();">
					<span class='icon'><img src="./images/bigsearch-icon.jpg" style="height: 40px;width: 38px;"></span>
				</button>
				
				<label style="font-style: normal;color: red" id="error_lab"></label>
			</form>
			<!-- /.container-fluid -->

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

			<div class="panel-footer">
				<form action="student_info">

					<input type="hidden" name="hidden_uid" id="hidden_uid"> <input
						type="hidden" name="hidden_id" id="hidden_id">
					<center>
						<button type="submit" id="enable_button" class="btn btn-primary btn">Update Info</button>
					</center>
				</form>
			</div>
		</div>


		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->


	<!-- Bootstrap Core JavaScript -->
	<script src="./js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="./js/dataTables/jquery.dataTables.min.js"></script>
	<script src="./js/dataTables/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./js/startmin.js"></script>


	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>
</html>
