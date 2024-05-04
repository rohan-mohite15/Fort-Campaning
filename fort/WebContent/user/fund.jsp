<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String id="",desc="",donate="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Save")){
	desc=request.getParameter("txtdesc");
	donate=request.getParameter("txtdonate");
	db.executeSql("Insert into Fund (Particulars,Donate,EmailID) values(?,?,?)", desc,donate,session.getAttribute("user"));
	msg="Fund is raised successfully...";
}	
}

%>
<div class="col-5 offset-2">
<br/>
<h3>Raise Fund::</h3>
<form method="post" id="form1">
<input type="hidden" name="txtid" value="<%=id%>"/>
<div class="form-group">
Particulars
<input name="txtdesc" class="form-control" placeholder="Particulars" value="<%=desc%>" autofocus/>
</div>
<div class="form-group">
Donation
<input name="txtdonate" type="number" class="form-control" placeholder="Donation" value="<%=donate%>"/>
</div>
<br/>
<input type="submit" name="btnsave" value="<%=btntext%>" class="btn btn-primary"/>
<a href="fund.jsp" class="btn btn-secondary">Clear</a>
</form>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>FundId</th>
<th>Particulars</th>
<th>Donation</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Fund where EmailID=?",session.getAttribute("user"));
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
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