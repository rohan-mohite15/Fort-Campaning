<style>
body{
background-repeat:no-repeat;
background-size:cover;
}
</style>
<body background="/fort/images/admin.jpg" style="height:100vh;width:22%" alt="NA"/>
<%@ include file="../header.jsp"%>
<div class="row">
<div class="col-7 offset-2">
<h1>Admin Dashboard</h1>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">Admin Roles::</a>
  <a href="fortlist.jsp" class="list-group-item list-group-item-action">Manage Fort & Information</a>
  <a href="imp.jsp" class="list-group-item list-group-item-action">Manage Importance</a>
  <a href="campaigns.jsp" class="list-group-item list-group-item-action">Manage Campaigns</a>
  <a href="travell.jsp" class="list-group-item list-group-item-action">Travelling Details</a>
  <a href="fund.jsp" class="list-group-item list-group-item-action">See Funds Raising</a>
  <a href="camphistory.jsp" class="list-group-item list-group-item-action">Registration Of Campaign</a>      
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>