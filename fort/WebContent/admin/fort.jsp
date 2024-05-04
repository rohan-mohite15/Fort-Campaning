<%@page import="java.sql.ResultSet"%>
<style>
body{
background-repeat:no-repeat;
background-size:cover;
}
</style>
<body background="/fort/images/admin.jpg" style="height:80vh;width:100%" alt="NA"/>
<%@ include file="../header.jsp"%>
<%
String catid="",catname="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Save")){
	catname=request.getParameter("txtcategory");
	db.executeSql("Insert into Category (CategoryName) values(?)", catname);
	msg="Category is saved successfully...";
}else{
	catid=request.getParameter("txtcatid");
	catname=request.getParameter("txtcategory");
	db.executeSql("Update Category set CategoryName=? where CategoryId=?", catname,catid);
	msg="Category is updated successfully...";
}
}else{
	
	if(request.getParameter("eid")!=null){
		catid=request.getParameter("eid");
		ResultSet rs=db.getRows("select * from Category where CategoryId=?", catid);
		if(rs.next()){
			catname=rs.getString(2);
			btntext="Update";
		}
	}else if(request.getParameter("did")!=null){
		catid=request.getParameter("did");
		db.executeSql("Delete from Category Where CategoryId=?", catid);
		msg="Category is deleted successfully....";
	}
	
}

%>
<div class="col-5 offset-2">
<br/>
<h1>Manage Product Categories::</h1>
<form method="post" id="form1">
<input type="hidden" name="txtcatid" value="<%=catid%>"/>
<div class="form-group">
Category Name
<input name="txtcategory" class="form-control" placeholder="Category Name" value="<%=catname%>" autofocus/>
</div>
<br/>
<input type="submit" name="btnsave" value="<%=btntext%>" class="btn btn-primary"/>
<a href="categories.jsp" class="btn btn-secondary">Clear</a>
</form>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>CategoryId</th>
<th>Category Name</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Category");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td>
<a href="?eid=<%=rs.getString(1) %>" class="btn btn-info">Edit</a>
<a href="?did=<%=rs.getString(1) %>" onclick="return confirm('Do you want to delete this record?');"  class="btn btn-danger">Delete</a>
</td>
</tr>

<%
}
%>

</tbody>
</table>
</div>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>