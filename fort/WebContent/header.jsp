<%@page import="com.util.db.DataAccess"%>
<style>
body{
background-repeat:no-repeat;
background-size:cover;
}
</style>
<body background="/fort/images/sahyadri.jpg" style="height:100vh;width:100%" alt="NA"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DataAccess db=new DataAccess();
String msg="",search="",icon="success";
if(request.getParameter("btnsearch")!=null){
	search=request.getParameter("txtsearch");
	session.setAttribute("search",search);
	response.sendRedirect("/fort/products.jsp?q="+search);
	//Redirects or moves from one page to another page (State lost)
}
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fort Conservation</title>
<link href="/fort/css/bootstrap.css" rel="stylesheet"/>
<link href="/fort/js/DataTables/datatables.css" rel="stylesheet"/>

<style>
label.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-primary" style="border-bottom:1px solid yellow" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/fort/index.jsp">
    <img src="/fort/images/logo.jpeg" class="rounded-circle" width="150px" height="70px' alt="NA"/>
    Fort Conservation
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      if(session.getAttribute("user")==null) //if No login
      {      
      %>
        <li class="nav-item">
          <a class="nav-link active" href="/fort/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/fort/forts.jsp">Forts</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/fort/about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/feedbacks.jsp">Feedback</a>
        </li>  
              
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
       %> 
       <li class="nav-item">
          <a class="nav-link active" href="/fort/admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/fortlist.jsp">Forts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/addfort.jsp">Add Forts</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/campaigns.jsp">Campaigns</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/user/fund.jsp">Fund</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/feedbacks.jsp">Feedbacks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/reportlist.jsp">Reports</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/admin/changepass.jsp">Change Password</a>
        </li>       
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
       %>
       <li class="nav-item">
          <a class="nav-link active" href="/fort/user/user.jsp">User
            <span class="visually-hidden">(current)</span>
          </a>
        <li class="nav-item">
          <a class="nav-link active" href="/fort/user/campaigns.jsp">Campaigns</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/user/tarvelling.jsp">Travelling</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/user/checkout.jsp">Fund</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/user/imp.jsp">Importance</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/user/camphistory.jsp">CampaginHistory</a>
        </li>            
        <li class="nav-item">
          <a class="nav-link" href="/fort/changepass.jsp">ChangePassword</a>
        </li>
        
       <%
       }
       %>
      </ul>
      <%
      if(session.getAttribute("user")==null || (session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")) ) //if No login
      {      
      %>
      <form class="d-flex" method="post">
        <input class="form-control me-sm-2" type="search" name="txtsearch" placeholder="Search Fort" value="<%=session.getAttribute("search")==null?"":session.getAttribute("search")%>"/>
        <button class="btn btn-dark my-2 my-sm-0" type="submit" name="btnsearch" value="Search">Search</button>
      </form>
      <%
      }
      %>
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="/fort/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/signup.jsp">Signup</a>
        </li>
      </ul>
      <%
      }else{
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="#"><%=session.getAttribute("user")%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/fort/logout.jsp">Logout</a>
        </li>
      </ul>
      <%
      }
      %>
    </div>
  </div>
</nav>