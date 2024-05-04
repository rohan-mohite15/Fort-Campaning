<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<div class="col-7 offset-3">
<br/>
<h1>Campaigns Detailed List::</h1>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>CampId</th>
<th>FortId</th>
<th>FortName</th>
<th>Day</th>
<th>Date</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from CampView where CDate>curdate()");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td>
<a href="reg.jsp?id=<%=rs.getString(1) %>" class="btn btn-info">Click Here</a>
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