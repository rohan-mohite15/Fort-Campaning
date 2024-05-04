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
String cid="",fortid="",day="",cdate="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Save")){
	fortid=request.getParameter("txtfortid");
	day=request.getParameter("txtday");
	cdate=request.getParameter("txtcdate");
	db.executeSql("Insert into Campaigns (FortId,Day,CDate) values(?,?,?)", fortid,day,cdate);
	msg="Campaigns Details are saved successfully...";
}else{
	cid=request.getParameter("txtcid");
	fortid=request.getParameter("txtfortid");
	day=request.getParameter("txtday");
	cdate=request.getParameter("txtcdate");
	db.executeSql("Update Campaigns set FortId=?,Day=?,CDate=? where CId=?", fortid,day,cdate,cid);
	msg="Campaigns Details are updated successfully...";
}
}else{
	
	if(request.getParameter("eid")!=null){
		cid=request.getParameter("eid");
		ResultSet rs=db.getRows("select * from Campaigns where CId=?", cid);
		if(rs.next()){
			fortid=rs.getString(2);
			day=rs.getString(3);
			cdate=rs.getString(4);
			btntext="Update";
		}
	}else if(request.getParameter("did")!=null){
		cid=request.getParameter("did");
		db.executeSql("Delete from Campaigns Where CId=?", cid);
		msg="Campaigns Details are deleted successfully....";
	}
	
}


%>
<div class="col-7 offset-3">
<br/>
<h1>Manage Campaigns Details::</h1>
<form method="post" id="form1">
<input type="hidden" name="txtcatid" value="<%=cid%>"/>
<div class="form-group">
Fort
<select name="txtfortid" id="txtfortid" class="form-select">
<option value="">-- Select Fort --</option>
<%
ResultSet rs=db.getRows("select * from Fort");
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>" <%=fortid.equals(rs.getString(1))?"selected":"" %>><%=rs.getString(2)%></option>
<%
}
%>
</select>
</div>
<div class="form-group">
Day
<select name="txtday" id="txtday" class="form-select">
<option value="">-- Select Day --</option>
<option <%=day.equals("Sunday")?"selected":"" %> value="Sunday">Sunday</option>
<option <%=day.equals("Monday")?"selected":"" %> value="Monday">Monday</option>
<option <%=day.equals("Tuesday")?"selected":"" %> value="Tuesday">Tuesday</option>
<option <%=day.equals("Wednesday")?"selected":"" %> value="Wednesday">Wednesday</option>
<option <%=day.equals("Thursday")?"selected":"" %> value="Thursday">Thursday</option>
<option <%=day.equals("Friday")?"selected":"" %> value="Friday">Friday</option>
<option <%=day.equals("Saturday")?"selected":"" %> value="Saturday">Saturday</option>
</select>
</div>
<div class="form-group">
Choose Date
<input name="txtcdate" id="txtcdate" type="date" class="form-control" value="<%=cdate%>"/>
</div>

<br/>
<input type="submit" name="btnsave" value="<%=btntext%>" class="btn btn-primary"/>
<a href="campaigns.jsp" class="btn btn-secondary">Clear</a>
</form>
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
rs=db.getRows("select * from CampView");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
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