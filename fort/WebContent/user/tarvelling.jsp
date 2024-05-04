<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("btnsignup")!=null) 
{
	String name=request.getParameter("txtname");
	String adhar=request.getParameter("txtadhar");	
	String mobile=request.getParameter("txtmobile");
	String upi=request.getParameter("txtupi");
	String user=session.getAttribute("user")+"";
	db.executeSql("Insert into Travelling (Name,Adhar,Mobile,UPI) values(?,?,?,?)", name,adhar,mobile,upi);
	msg="You have successfully registered for Travelling";
}

%>
<!-- Signup Page Specific Contents -->
<div class="container">
<form method="post" id="form1">
<div class="col-5 offset-3">
<br/>
<br/>
<h2>Travelling Register Form::</h2>
<div class="form-group">
Name
<input type="text" name="txtname" id="txtname" class="form-control" placeholder="Enter Name"/>
</div>
<div class="form-group">
Adhar No
<input type="text" name="txtadhar" id="txtadhar" class="form-control" placeholder="Enter Adhar No"/>
</div>
<div class="form-group">
Mobile No
<input type="text" name="txtmobile" id="txtmobile" class="form-control" placeholder="Enter Mobile No"/>
</div>
<div class="form-group">
UPI ID
<input type="text" name="txtupi" id="txtupi" class="form-control" placeholder="Enter UPI ID"/>
</div>
<br/>
<input type="submit" name="btnsignup" value="Submit" class="btn btn-primary"/>
</div>
</form>
</div>
<%@ include file="../footer.jsp"%>
 <script>
 $(function(){
	$("#form1").validate({
		rules:{
			txtname:{
				required:true
			},
			txtadhar:{
				required:true,
				pattern:/^\d{12}$/
			},
			txtmobile:{
				required:true,
				pattern:/^\d{10}$/
			},
			txtupi:{
				required:true
			}
		},
		messages:{
			txtname:{
				required:"Name is required"
			},
			txtadhar:{
				required:"Adhar is required",
				pattern: "Adhar number should be of 12 digits"
			},
			txtmobile:{
				required:"Mobile No is required",
				pattern:"Mobile No allows only 10 digits"
			},
			txtupi:{
				required:"UPI ID is required"
			}
		}
		
	}); 
 });
 
 </script>
 