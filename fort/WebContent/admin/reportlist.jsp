<style>
body{
background-repeat:no-repeat;
background-size:cover;
}
</style>
<body background="/fort/images/admin.jpg" style="height:80vh;width:100%" alt="NA"/>
<%@include file="../header.jsp"%>
<div class ="row">
<div class ="col-7 offset-2">
<h1>Reports</h1>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">Fort Conservation Campaign Reports List</a>
  <a href="/fort/admin/report.jsp?page=CampReg" class="list-group-item list-group-item-action">Signup Reports</a>
  <a href="/fort/admin/report.jsp?page=fortList" class="list-group-item list-group-item-action">Fort Reports</a>
  <a href="/fort/admin/report.jsp?page=fund" class="list-group-item list-group-item-action">Fund Raiseing Reports</a>
  <a href="/fort/admin/report.jsp?page=feedback" class="list-group-item list-group-item-action">Feedbacks Reports</a>
</div>
</div>
</div>
<%@include file="../footer.jsp"%>