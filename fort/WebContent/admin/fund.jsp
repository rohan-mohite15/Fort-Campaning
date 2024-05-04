<%@page import="java.sql.ResultSet"%>
<style>
body{
background-repeat:no-repeat;
background-size:cover;
}
</style>
<body background="/fort/images/admin.jpg" style="height:80vh;width:100%" alt="NA"/>
<%@ include file="../header.jsp"%>
<div class="col-5 offset-2">
<br/>
<h3>Raising Fund Details::</h3>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>FundId</th>
<th>Particulars</th>
<th>Donation</th>
<th>EmailID</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Fund");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
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