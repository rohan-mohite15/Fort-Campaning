<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<div class="col-7 offset-3">
<br/>
<h1>Registration Of Campaigns::</h1>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>RegID</th>
<th>CampD</th>
<th>FortName</th>
<th>NoofMawlas</th>
<th>Address</th>
<th>ContactNo</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from CampRegView");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
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