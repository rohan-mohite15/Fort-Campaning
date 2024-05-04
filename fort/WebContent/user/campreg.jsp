<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("btnsignup")!=null) 
{
	String cid=request.getParameter("id");
	String nm=request.getParameter("txtm");
	String address=request.getParameter("txta");
	String mobile=request.getParameter("txtmobile");
	String user=session.getAttribute("user")+"";
	db.executeSql("Insert into CampReg (Cid,Noofmawla,Address,ContactNo,EmailID) values(?,?,?,?,?)", cid,nm,address,mobile,user);
	msg="You have successfully registered with campaigns";
}

%>
<!-- Signup Page Specific Contents -->
<div class="container">
<form method="post" id="form1">
<div class="col-5 offset-3">
<br/>
<br/>
<h2>Register Form::</h2>
<div class="form-group">
No. of Mawla
<input type="text" name="txtm" id="txtm" class="form-control" placeholder="Enter No. of Mawla"/>
</div>
<div class="form-group">
Village,Taluka,District
<input type="text" name="txta" id="txta" class="form-control" placeholder="Enter Village,Taluka,District"/>
</div>
<div class="form-group">
Contact No
<input type="text" name="txtmobile" id="txtmobile" class="form-control" placeholder="Enter Mobile No"/>
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
			txtm:{
				required:true,
				digit:true
			},
			txta:{
				required:true
			},
			txtmobile:{
				required:true,
				pattern:/^\d{10}$/
			}
		},
		messages:{
			txtm:{
				required:"Mawla Info is required",
				digit:"Should be number"
			},
			txta:{
				required:"Address is required"
			},
			txtmobile:{
				required:"Mobile No is required",
				pattern:"Mobile No allows only 10 digits"
			}
		}
		
	}); 
 });
 
 </script>
 