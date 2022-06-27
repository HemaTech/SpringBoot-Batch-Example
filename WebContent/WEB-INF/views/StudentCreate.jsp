<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="utf-8"> 
<title>Twitter Bootstrap Version2.0 form error example</title> 
<meta name="description" content="Twitter Bootstrap Version2.0 form error example from w3resource.com."> 
<link href="css/bootstrap_custom.css" rel="stylesheet">
<script src="./js/jquery.min.js"></script>
<style>
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
.control-group.error input, .control-group.error select, .control-group.error textarea {
    color: #b94a48;
    border-color: #b94a48;
}
.control-group.success input, .control-group.success select, .control-group.success textarea {
    color: #468847;
    border-color: #468847;
}
.control-group.warning input, .control-group.warning select, .control-group.warning textarea {
    color: #c09853;
    border-color: #c09853;
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

a {
    color: white;
    text-decoration: none;
    font-size: 21px;
}
/* Page Content */
.content {padding:20px;}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

li {
  display: inline;
}
</style>
</style>

<script type="text/javascript">

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

var student_hostel=[{"availed_from":availed_from,"discontinued_on":discontinued_on}]
var student_tution_fee_detail=[{"fee_amount":fee_amount,"paid_on":paid_on,"fee_type":fee_type}]
var student_admission_detail={"board_generated_admission_no":board_generated_admission_no,"admissionid":admissionid}
	
   var candidate = 
   {
		 "name": name,"gender_id": gender_id,"medium_id": medium_id,"father_name": father_name,"uid":uid,
		 "address":address,"pincode":pincode,"admission_year":admission_year,"course_id":course_id,"branch_id":branch_id,
		 "actual_fee":actual_fee,"board_generated_admission_no":board_generated_admission_no,"registered_on":registered_on,
		  "student_hostel":student_hostel,"student_tution_fee_detail":student_tution_fee_detail,
		  "student_admission_detail":student_admission_detail
		  
   };
   
 //  alert(JSON.stringify(candidate));
    console.log(JSON.stringify(candidate));

    $.ajax({
    	  url: "http://192.168.0.32:7771/api/student/create/",
     //  url: "http://host.docker.internal:7771/api/student/create/",
        type: "post",
        data: JSON.stringify(candidate),
        contentType: "application/json",
        dataType: "json",
		 success: function(d) {
            alert(d);
        }
    });
	
	
}


function getdetails()
{
	
	 $.ajax({
	  url: "http://192.168.0.32:7008/candidate/candidatebyrollno/26161",
	   //   url: "http://localhost:7008/candidate/candidatebyrollno/26161",
	    cache: false,
	    type: "GET",
	    success: function(response) {
//alert("=="+response)
console.log(response);

$('#capt_img1').attr('src','data:image/jpeg;base64,'+response.photo.image);

$("#applicationNo").val(response.applicationNo);
$("#canFatherName").val(response.canFatherName);
$("#canName").val(response.canName);




	    },
	    error: function(xhr) {

	    }
	}); 
	
	
}
</script>

</head>
<body>
<div class="header" style="width: 138%">
  <ul>
  <li ><a href="./">Home</a></li>
  <li><a href="#news">News</a></li>
  <li><a href="#contact">Contact</a></li>
  <li style="float:right"><a href="logout">Logout</a></li>
</ul>
</div>
<form class="form-horizontal">
        <fieldset>
        <div class="flex-container" style="padding-left: 156px;  padding-top: 110px;">
        <div class="flex-child purple">
          <legend>Student Information</legend>
          <div class="control-group error">
            <label class="control-label" for="inputError">Name</label>
            <div class="controls">
              <input type="text" id="name" name="name">
              <span class="help-inline"></span>
            </div>
          </div>
          
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Father Name</label>
            <div class="controls">
              <input type="text" id="father_name" name="father_name">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Uid</label>
            <div class="controls">
              <input type="text" id="uid" name="uid">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Address</label>
            <div class="controls">
              <textarea id="inputSuccess" name="address" id="address" rows="4" cols="40" style="margin: 0px; width: 212px; height: 67px;"></textarea>
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Pincode</label>
            <div class="controls">
              <input type="text" id="pincode" name="pincode">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess" >Meadium</label>
            <div class="controls">
              <input type="text" id="medium_id" name="medium_id">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Admission Year</label>
            <div class="controls">
              <input type="text" id="admission_year" name="admission_year">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Course</label>
            <div class="controls">
              <input type="text" id="course_id" name="course_id">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Branch</label>
            <div class="controls">
              <input type="text" id="branch_id" name="branch_id">
              <span class="help-inline"></span>
            </div>
          </div>
          
          
          
		  <div class="control-group warning">
            <label class="control-label" for="inputWarning">Gender</label>
            <div class="controls">
              <input type="text" id="gender_id" name="gender_id">
              <span class="help-inline"></span>
            </div>
          </div>
		  <div class="control-group success">
            <label class="control-label" for="inputSuccess">Actual Fee</label>
            <div class="controls">
              <input type="text" id="actual_fee" name="actual_fee">
              <span class="help-inline"></span>
            </div>
          </div>
          
           <div class="control-group success">
            <label class="control-label" for="inputSuccess">Registered On</label>
            <div class="controls">
              <input type="date" id="registered_on" name="registered_on">
              <span class="help-inline"></span>
            </div>
          </div>
          
          
		  <div class="control-group success">
            <label class="control-label" for="selectError">Select with success</label>
            <div class="controls">
              <select id="selectError">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select>
              <span class="help-inline">Successfully selected</span>
            </div>
          </div>
          </div>
          
          <div class="flex-child purple">
          <legend>Student Admission Details</legend>
          <div class="control-group error">
            <label class="control-label" for="inputError">Board Generation Admission No</label>
            <div class="controls">
              <input type="text"  name="board_generated_admission_no" id="board_generated_admission_no">
              <span class="help-inline"></span>
            </div>
          </div>
          
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Admission No</label>
            <div class="controls">
              <input type="text" id="admissionid" name="admissionid">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="flex-child purple">
          <legend>Student Hostel</legend>
          <div class="control-group error">
            <label class="control-label" for="inputError">Availed From</label>
            <div class="controls">
              <input type="date" id="availed_from" name="availed_from">
              <span class="help-inline"></span>
            </div>
          </div>
          
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Discountinued On</label>
            <div class="controls">
              <input type="date" id="discontinued_on" name="discontinued_on">
              <span class="help-inline"></span>
            </div>
          </div>
          
          </div>
          
          <div class="flex-child purple">
          <legend>Student Fee Details</legend>
          <div class="control-group error">
            <label class="control-label" for="inputError">Fee Type</label>
            <div class="controls">
              <input type="text" id="fee_type" name="fee_type">
              <span class="help-inline"></span>
            </div>
          </div>
          
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Amount</label>
            <div class="controls">
              <input type="text" id="fee_amount" name="fee_amount">
              <span class="help-inline"></span>
            </div>
          </div>
          
          <div class="control-group success">
            <label class="control-label" for="inputSuccess">Paid On </label>
            <div class="controls">
              <input type="date" id="paid_on" name="paid_on">
              <span class="help-inline"></span>
            </div>
          </div>
          
          </div>
          
          </div>
          
          
          
          
          
          </div>
          </div>
        </fieldset>
     <center><input type="button" value="SUBMIT" onclick="post_details()"></center> 
</form>
<div class="header" style="width: 138%">
  <h1>FOOTER</h1>
  <p>My supercool header</p>
</div>
</body>
</html>
