<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-12">
<br/>
<h3>Fort List::</h3>

<div class="accordion" id="accordionExample">
<%
ResultSet rs=db.getRows("select * from Fort");
while(rs.next()){
%>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne<%=rs.getString(1)%>">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%=rs.getString(1)%>"" aria-expanded="true" aria-controls="collapseOne<%=rs.getString(1)%>"">
        <%=rs.getString(2) %>
      </button>
    </h2>
    <div id="collapseOne<%=rs.getString(1)%>"" class="accordion-collapse collapse show" aria-labelledby="headingOne<%=rs.getString(1)%>"" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <img src="/fort/fortimages/<%=rs.getString(4) %>" width="200" height="150" alt="NA"/><br/>
        <%=rs.getString(3) %>
      </div>
    </div>
  </div>
  <%
}
  %>
</div>
</div>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>