<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" href="favicon/favicon.ico">
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>



<script type="text/javascript">

function printDiv() 
{
	
	$("#printId").hide();
  var divToPrint=document.getElementById('print_details');

  
  var newWin=window.open('','Print-Window');
  
  newWin.document.open();

  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

  newWin.document.close();

  setTimeout(function(){newWin.close();},10);
  
  $("#printId").show();
}

</script>
</head>

<body>
<%

java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");


 
%>

    <div class="container-fluid" id="print_details" style="line-height: 35px">
    
     <div class="row">
     <div class="col-sm-0" >&nbsp;</div>
    <div class="col-sm-2" align="center">
	<span><img src="images/log1.jpg" alt="MISSING JPG" width="100" height="50"/></span>
    </div>
      <div class="col-sm-0" >&nbsp;</div>
    <div class="col-sm-8" align="center" >
       <span class="formtext bold" ><font size=4 color="blue"> ${college_label} </font></span>
    </div>
    
    <div class="col-sm-2" >&nbsp;</div>
    <div class="col-sm-7" align="center" >
      <span class="formtext bold">
				<font size=3 color="blue">Sarada Nagar - GAJAPATHINAGARAM - VZM Dist.-535 270, Ph:08965 - 285848</font>
		</span>
    </div>
    
   
    <div class="col-sm-2" >&nbsp;</div>
  </div>
 <!--  <hr style="width: 80%;
    float: left;
    background-color: #b7d0e2;"><br> -->
    <hr style="width: 100%;float: left;" >
    <p style="float: right;">Date:<b>${dbdate}</b></P><br>
       <table  style="width: 90%">
           <tr>
                <td>Receipt No</td>
                <td>:</td>
                <th>${printdetails.receipt_no}</th>
           </tr>
           <tr><td><br></td></tr>
           <tr>
                <td>Student Name</td> 
                  <td>:</td>
                <th>${printdetails.student_name}</th>
                <tr><td><br></td></tr>
           </tr>
           
           <tr>
                <td>Father Name</td>
                <td>:</td>
                <th>${printdetails.father_name}</th>
                <tr><td><br></td></tr>
           </tr>
           
           <tr>
                <td>Group & Year</td>
                  <td>:</td>
                <th>${printdetails.group_name},${printdetails.branch_name}</th>
                <tr><td><br></td></tr>
           </tr>
           
           <tr>
                <td>Fee Type</td>
                 <td>:</td>
                <th>${printdetails.fee_type}</th>
                <tr><td><br></td></tr>
           </tr>
           
           <tr>
                <td>Amount Paid</td>
                  <td>:</td>
                <th>${printdetails.fee_amount}</th>
                <tr><td><br></td></tr>
           </tr>
           
           <tr>
                <td>In words</td>
                  <td>:</td>
                <th>${printdetails.in_words}</th>
                
           </tr>
              
           
                   
       </table>
       <br>
       <br>
              <div class="row">
                <div class="col-sm-10" align="center">
    	        <button onclick="printDiv();" id="printId" class="btn btn-success">Print</button>
            </div>
            
            <!-- <div class="col-sm-20" >&nbsp;</div>  -->
  </div><br><br><br>
          <div class="row">
<!--            <div class="col-sm-10" style="padding: 400px 0 0 0;">&nbsp;</div> -->
            <div class="col-sm-9" align="right">
              <span class="formtext bold">
				<font size=3 color="blue">Seal & Signature</font>
		      </span>
           </div>
    <!-- <div class="col-sm-2" >&nbsp;</div> -->
  </div>
  </div>
  
  
		

</body></html>