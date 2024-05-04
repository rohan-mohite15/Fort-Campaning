<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String cid=request.getParameter("id");
ResultSet rs=db.getRows("select * from CampView where CId=?", cid);
if(rs.next()){
%>
<div class="card mb-3 col-8 offset-2">
  <h3 class="card-header"><%=rs.getString(3) %> Conservation Campaign</h3>
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString(3) %></h5>    
  </div>
  <img src="/fort/fortimages/<%=rs.getString(5) %>" width="100%" height="200" alt="NA"/>  
  <div class="card-body">
    <p class="card-text"><%=rs.getString(4) %></p>
  </div>
  <div class="card-body">
    <a href="campreg.jsp?id=<%=rs.getString(1) %>" class="card-link">Register Now</a>    
  </div>
  
</div>
<%
}
%>
<%@ include file="../footer.jsp"%>