<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link id="style" href="./login_assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./login_assets/plugins/web-fonts/icons.css" rel="stylesheet" />
    <link href="./login_assets/plugins/web-fonts/font-awesome/font-awesome.min.css" rel="stylesheet">
    <link href="./login_assets/plugins/web-fonts/plugin.css" rel="stylesheet" />
    <link href="./login_assets/css/style.css" rel="stylesheet">
    <link href="./login_assets/css/boxed.css" rel="stylesheet" />
    <link href="./login_assets/css/dark-boxed.css" rel="stylesheet" />
    <link href="./login_assets/css/skins.css" rel="stylesheet">
    <link href="./login_assets/css/dark-style.css" rel="stylesheet">
    <link href="./login_assets/css/colors/default.css" rel="stylesheet">
    <link id="theme" rel="stylesheet" type="text/css" media="all" href="./login_assets/css/colors/color.css">
    <link href="./login_assets/plugins/select2/css/select2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./login_assets/plugins/multipleselect/multiple-select.css">
    <link href="./login_assets/switcher/css/switcher.css" rel="stylesheet">
    <link href="./login_assets/switcher/demo.css" rel="stylesheet">

    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600&display=swap" rel="stylesheet">
        <script type="text/javascript">


        function Studen_with_uid(uid) {

            $("#stud_info").show();

            $.get('studentuidbaseinfo', { uid_no: uid }, function (jsonResponse) {

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


        function course_compeletion(uid) {

            var uid = $("#uid").val();
            var response_status = null;
            $.get('student-coursecompletedetails', { uid_no: uid }, function (jsonResponse) {

                //alert("Student Course was not completed xx : "+jsonResponse);
                if (jsonResponse == '0') {
                    alert("Student Course was not completed : " + uid);

                    return false;
                }
                else {
                    post_details();

                }

            });
        }



        function post_details() {




            event.preventDefault();

            var name = $("#name").val();
            var gender_id = $("#gender_id").val();
            var medium_id = $("#medium_id").val();
            var father_name = $("#father_name").val();
            var uid = $("#uid").val();
            var address = $("#address").val();



            var pincode = $("#pincode").val();
            var admission_year = $("#admission_year").val();
            var acadmic_year = $("#acadmic_year").val();

            //alert(acadmic_year);
            var course_id = $("#course_id").val();
            var branch_id = $("#branch_id").val();
            var actual_fee = $("#actual_fee").val();
            var board_generated_admission_no = $("#board_generated_admission_no").val();


            var registered_on = $("#registered_on").val();
            var admissionid = $("#admissionid").val();

            var fee_amount = $("#fee_amount").val();
            var paid_on = $("#paid_on").val();
            var fee_type = $("#fee_type").val();



            var availed_from = $("#availed_from").val();

            var discontinued_on = $("#discontinued_on").val();


            var mobileno = $("#mobileno").val();

            var previous_fee = $("#previous_fee").val();
            var hostel_prev_fee = $("#hostel_previous_fee").val();
            var student_hostel = { "hostel_prev_fee": hostel_prev_fee }
            var student_tution_fee_detail = [{ "fee_amount": 1, "paid_on": '2021-6-1', "fee_type": '1' }]
            var student_admission_detail = { "board_generated_admission_no": board_generated_admission_no }

            /*  var candidate =
            {
                  "name": name,"gender_id": gender_id,"medium_id": medium_id,"father_name": father_name,"uid":uid,
                  "address":address,"pincode":pincode,"admission_year":admission_year,"course_id":course_id,"branch_id":branch_id,
                  "actual_fee":actual_fee,"board_generated_admission_no":board_generated_admission_no,"registered_on":registered_on,
                   "student_hostel":student_hostel,"student_tution_fee_detail":student_tution_fee_detail,
                   "student_admission_detail":student_admission_detail

            };  */


            var candidate = null;



            if (hostel_prev_fee == '0') {
                candidate =
                    {
                        "name": name, "gender_id": gender_id, "medium_id": medium_id, "father_name": father_name, "uid": uid,
                        "address": address, "pincode": pincode, "admission_year": admission_year, "academic_year": acadmic_year, "course_id": course_id, "branch_id": branch_id,
                        "actual_fee": actual_fee, "board_generated_admission_no": board_generated_admission_no,
                        "mobile_no": mobileno, "previous_fee": previous_fee

                    };

            }
            else {
                candidate =
                    {
                        "name": name, "gender_id": gender_id, "medium_id": medium_id, "father_name": father_name, "uid": uid,
                        "address": address, "pincode": pincode, "admission_year": admission_year, "academic_year": acadmic_year, "course_id": course_id, "branch_id": branch_id,
                        "actual_fee": actual_fee, "board_generated_admission_no": board_generated_admission_no,
                        "mobile_no": mobileno, "previous_fee": previous_fee, "student_hostel": student_hostel

                    };
            }

            //Form Validations

            if (name == "") {
                alert("Please Enter Your Name");
                return false;
            }

            if (father_name == "") {
                alert("Please Enter Your Father Name");
                return false;
            }
            if (uid == "") {
                alert("Please Enter Your AadharNo");
                return false;
            }
            if (address == "") {
                alert("Please Enter Your Address");
                return false;
            }
            var pincodePattern = /(^\d{6}$)/;
            if (pincode == "") {
                alert("Please Enter Valid Pincode");
                return false;
            }
            if (!pincodePattern.test(pincode)) {
                alert("Your Entered Pin Code Is Not Valid.");
                return false;
            }

            if (medium_id == "") {
                alert("Please Select Medium");
                return false;
            }

            if (admission_year == "") {
                alert("Please Enter Admission Year");
                return false;
            }


            if (course_id == "") {
                alert("Please Select Course");
                return false;
            }
            if (branch_id == "") {
                alert("Please Select Branch");
                return false;
            }
            if (gender_id == "") {
                alert("Please Select Gender");
                return false;
            }
            if (registered_on = "") {

                alert("Please Select Your Registration Date");
                return false;
            }

            if (mobile_no = "") {

                alert("Please Enter Mobile Number");
                return false;
            }

            //  alert(JSON.stringify(candidate));
            console.log(JSON.stringify(candidate));
            //  alert("Student Create Successfully with uid -- : ");
            $.ajax({
               	 url: "http://192.168.0.32:7771/api/student/create/",
               // url: "http://host.docker.internal:7771/api/student/create/",
                type: "post",
                data: JSON.stringify(candidate),
                contentType: "application/json",
                dataType: "json",
                success: function (d) {

                    alert("Student Create Successfully with uid -- : " + d);

                    Studen_with_uid(d);

                    $("#student_form_reset")[0].reset();
                },
                error: function (textStatus, errorThrown) {
                    alert("Student Creation was failed.")
                }
            });


        }


        $(document).ready(function () {



            $('#name').on('keydown', function (event) {
                if (this.selectionStart == 0 && event.keyCode >= 65 && event.keyCode <= 90 && !(event.shiftKey) && !(event.ctrlKey) && !(event.metaKey) && !(event.altKey)) {
                    var $t = $(this);
                    event.preventDefault();
                    var charval = String.fromCharCode(event.keyCode);
                    $t.val(charval + $t.val().slice(this.selectionEnd));
                    this.setSelectionRange(1, 1);
                }
            });


            $('#father_name').on('keydown', function (event) {
                if (this.selectionStart == 0 && event.keyCode >= 65 && event.keyCode <= 90 && !(event.shiftKey) && !(event.ctrlKey) && !(event.metaKey) && !(event.altKey)) {
                    var $t = $(this);
                    event.preventDefault();
                    var charval = String.fromCharCode(event.keyCode);
                    $t.val(charval + $t.val().slice(this.selectionEnd));
                    this.setSelectionRange(1, 1);
                }
            });

            $('#address').on('keydown', function (event) {

                var addressval = $('#address').val();
                $('#address').val(addressval.replace(/(?:^|\s)\S/g, function (a) { return a.toUpperCase(); }));
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

            $.get('course', function (jsonResponse) {

                var course_id = $('#course_id');

                course_id.find('option').remove();



                $('<option>').val('').text('----------------------Select Course-----------------------------').appendTo(course_id);

                $.each(jsonResponse, function (index, value) {
                    $('<option>').val(value.id).text(value.name).appendTo(course_id);

                });

            });



            $.get('medium', function (jsonResponse) {

                var medium_id = $('#medium_id');

                medium_id.find('option').remove();



                $('<option>').val('').text('----------------------Select Medium-----------------------------').appendTo(medium_id);

                $.each(jsonResponse, function (index, value) {
                    $('<option>').val(value.id).text(value.name).appendTo(medium_id);

                });

            });



            $.get('gender', function (jsonResponse) {

                var gender_id = $('#gender_id');

                gender_id.find('option').remove();



                $('<option>').val('').text('----------------------Select Gender-----------------------------').appendTo(gender_id);

                $.each(jsonResponse, function (index, value) {
                    $('<option>').val(value.id).text(value.name).appendTo(gender_id);

                });

            });

            $('#course_id').change(function (event) {


                var course_id = $('#course_id').val();

                $.get('branch', { course_id: course_id }, function (jsonResponse) {

                    var branch_id = $('#branch_id');

                    branch_id.find('option').remove();



                    $('<option>').val('').text('----------------------Select Branch-----------------------------').appendTo(branch_id);

                    $.each(jsonResponse.bt, function (index, value) {
                        $('<option>').val(value.id).text(value.name).appendTo(branch_id);

                    });

                    var acadmic_year = $('#acadmic_year');

                    acadmic_year.find('option').remove();




                    $('<option>').val('').text('----------------------Select Academicyear-----------------------------').appendTo(acadmic_year);

                    $.each(jsonResponse.ct, function (index, value) {
                        $('<option>').val(value.id).text(value.name).appendTo(acadmic_year);

                    });




                });

            });



            $('#branch_id').change(function (event) {


                var course_id = $('#course_id').val();
                var branch_id = $('#branch_id').val();

                var uid_no = $('#uid').val();

                $.get('branch_fee', { course_id: course_id, branch_id: branch_id, uid_no: uid_no }, function (jsonResponse) {



                    //alert("======"+jsonResponse);
                    console.log(jsonResponse);
                    $("#actual_fee").val(jsonResponse.current_fee)
                    $("#previous_fee").val(jsonResponse.previous_fee)
                    $("#hostel_previous_fee").val(jsonResponse.hostel_previous_fee)



                });

            });

            $('#uid').keyup(function (event) {

                var uid = $("#uid").val();
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

                if (uid.length == 12) {
                    $.get('studentuidbaseinfo', { uid_no: uid }, function (jsonResponse) {

                        if (uid = jsonResponse.uid_no) {

                            alert("uid already exists" + jsonResponse.uid_no)
                        }

                    });
                }
            });


        });





    </script>
    
</head>
<body class="main-body leftmenu">

<div id="global-loader" style="display: none;">
        <img src="./login_assets/img/loader.svg" class="loader-img" alt="Loader">
    </div>
    <div class="page">
        <!-- Header -->
        <!-- Main Content-->
        <div class="main-content side-content pt-0">
            <div class="container-fluid">
                <div class="inner-body">
                    <!-- Page Header -->
                    <div class="page-header">
                        <div>
                            <h2 class="main-content-title tx-24 mg-b-5">Student Info Entry</h2>
                        </div>

                    </div>
                    <!-- End Page Header -->
                    <!-- Row -->
                    <div class="row row-sm">
                        <div class="col-xl-1 col-lg-12 col-md-12"></div>
                        <div class="col-xl-10 col-lg-12 col-md-12">
                            <div class="card custom-card">
                                <div class="card-body">
                                    <div>
                                        <h6 class="main-content-label mb-3">Basic Form Elements</h6>
                                    </div>

                                    <div class="">
                                        <div class="row row-sm">
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Student Name: <span class="tx-danger">*</span></label>
                                                <input class="form-control" id="name" placeholder="Student Name" required="" type="text">
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Father Name: <span class="tx-danger">*</span></label>
                                                <input class="form-control" id="father_name" placeholder="Father Name" required="" type="text">
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Uid No: <span class="tx-danger">*</span></label>
                                                <input class="form-control" id="uid" placeholder="Uid No" required="" type="text">
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Address: <span class="tx-danger">*</span></label>
                                                <textarea name="address" id="address" class="form-control" placeholder="Address"></textarea>
                                            </div>
                                        </div>
                                        <div class="row row-sm">
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Pincode: <span class="tx-danger">*</span></label>
                                                <input class="form-control" id="pincode" placeholder="Pincode" required="" type="text" maxlength="6">
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Mobile No: <span class="tx-danger">*</span></label>
                                                <input class="form-control" id="mobileno" placeholder="Mobile No" required="" type="text" maxlength="10">
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Medium: <span class="tx-danger">*</span></label>
                                                <select id="medium_id" name="medium_id" class="form-control select2"></select>
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Course: <span class="tx-danger">*</span></label>
                                                <select id="course_id" name="course_id" class="form-control select2"></select>
                                            </div>
                                        </div>
                                        <div class="row row-sm">
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Academic Year: <span class="tx-danger">*</span></label>
                                                <select id="acadmic_year" name="acadmic_year" class="form-control select2"></select>
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Branch: <span class="tx-danger">*</span></label>
                                                <select id="branch_id" name="branch_id" class="form-control select2"></select>
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <label class="form-label">Gender: <span class="tx-danger">*</span></label>
                                                <select id="gender_id" name="gender_id" class="form-control select2"></select>
                                            </div>
                                            <div class="col-lg-2 form-group">
                                                <label class="form-label">Actual Fee: <span class="tx-danger">*</span></label>
                                                <input class="form-control" id="actual_fee" name="actual_fee" placeholder="Current Fee" required="" type="text">
                                            </div>
                                            <div class="col-lg-2 form-group">
                                                <label class="form-label mt-4"></label>
                                                <input class="form-control" id="previous_fee" name="previous_fee" placeholder="Previous Fee" required="" type="text">
                                            </div>
                                            <div class="col-lg-2 form-group">
                                                <label class="form-label mt-4"></label>
                                                <input class="form-control" id="hostel_previous_fee" name="hostel_previous_fee" placeholder="Hostel Pprevious Fee" required="" type="text">
                                            </div>
                                        </div>
                                        <button type="button" class="btn ripple btn-main-primary" onclick="course_compeletion()">Submit  Details</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Row -->

                </div>
            </div>
        </div>
        <!-- Footer -->
        
        
    </div>

<script src="./login_assets/plugins/jquery/jquery.min.js"></script>
    <script src="./login_assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="./login_assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="./login_assets/plugins/chart.js/Chart.bundle.min.js"></script>
    <script src="./login_assets/plugins/peity/jquery.peity.min.js"></script>
    <script src="./login_assets/plugins/select2/js/select2.min.js"></script>
    <script src="./login_assets/js/select2.js"></script>
    <script src="./login_assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="./login_assets/plugins/sidemenu/sidemenu.js" id="leftmenu"></script>
    <script src="./login_assets/plugins/sidebar/sidebar.js"></script>
    <script src="./login_assets/plugins/raphael/raphael.min.js"></script>
    <script src="./login_assets/plugins/morris.js/morris.min.js"></script>
    <script src="./login_assets/js/circle-progress.min.js"></script>
    <script src="./login_assets/js/chart-circle.js"></script>
    <script src="./login_assets/js/index.js"></script>
    <script src="./login_assets/js/sticky.js"></script>
    <script src="./login_assets/js/custom.js"></script>
    <script src="./login_assets/switcher/js/switcher.js"></script>
    <div class="main-navbar-backdrop"></div>

</body>
</html>