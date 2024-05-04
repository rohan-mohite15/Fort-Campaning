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
if(request.getParameter("did")!=null){
	db.executeSql("delete from Fort where FortId=?", request.getParameter("did"));
}
if(request.getParameter("eid")!=null){
	session.setAttribute("eid",request.getParameter("eid"));
	response.sendRedirect("editFort.jsp"); //Redirect to/ go to given page
}
%>
<div class="col-12">
<br/>
<h3>Fort List::</h3>
<a href="addfort.jsp" class="btn btn-primary float-end me-4">Add Fort</a>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>FortId</th>
<th>Fort Name</th>
<th>Information</th>
<th>Fort Image</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Fort");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td>
<img src="/fort/fortimages/<%=rs.getString(4) %>" width="70" height="70" alt="NA"/>
</td>
<td>
<a href="addfort.jsp?eid=<%=rs.getString(1) %>" class="btn btn-info">Edit</a>
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