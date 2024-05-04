<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
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
String path=request.getRealPath("/fortimages/");
UploadBean upBean=new UploadBean();
upBean.setFolderstore(path); //Store uploaded files in this directory/folder 
String fortid="",fortname="",info="",btntext="Save";
String fname="";
String title="Add Fort";

if(MultipartFormDataRequest.isMultipartFormData(request)){
	MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
	//request (MP) ===> Wrapper ===> MultipartFormDataRequest
	fortid=mrequest.getParameter("txtfortid");
	fortname=mrequest.getParameter("txtfortname");
	info=mrequest.getParameter("txtinfo");	
	Hashtable ht=mrequest.getFiles(); //HashTable - collection of key/value pairs
	if(ht!=null && ht.size()>0){
		UploadFile uf= (UploadFile)ht.get("txtimage"); //Return type==>Object
		if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
			fname=uf.getFileName();
			//Upload/Save file to server
			upBean.store(mrequest, "txtimage");
		}
	}
	if(mrequest.getParameter("btnsave").equals("Save")){
		db.executeSql("Insert into fort (fortName,Info,fortImage) values(?,?,?)", fortname,info,fname);
		msg="fort information is saved successfully...";
	}else{
		db.executeSql("Update fort set fortName=?,Info=?,fortImage=? where fortId=?", fortname,info,fname,fortid);
		msg="fort information is updated successfully...";
	}
}else{
	if(request.getParameter("eid")!=null){
		ResultSet rs=db.getRows("select * from fort where fortId=?",request.getParameter("eid"));
		if(rs.next()){
			fortid=rs.getString(1);
			fortname=rs.getString(2);
			info=rs.getString(3);
			fname=rs.getString(4);
			title="Edit Fort Information";
			btntext="Update";
		}
	}
}

%>
<div class="col-7 offset-2">
<br/>
<h3><%=title%>::</h3>
<form method="post" id="form1" enctype="multipart/form-data">
<input type="hidden" name="txtfortid" value="<%=fortid%>"/>
<div class="form-group">
Fort Name
<input name="txtfortname" id="txtfortname" class="form-control" placeholder="Fort Name" value="<%=fortname%>" autofocus/>
</div>
<div class="form-group">
Information
<textarea name="txtinfo" id="txtinfo" class="form-control"><%=info%></textarea>
</div>
<div class="form-group">
Browse Fort Image
<input type="file" name="txtimage" id="txtimage" class="form-control"/>
<img src="/fort/fortimages/<%=fname%>" width="70" height="70" alt="NA"/>
</div>
<br/>
<input type="submit" name="btnsave" value="<%=btntext%>" class="btn btn-primary"/>
<a href="addfort.jsp" class="btn btn-secondary">Clear</a>
<a href="fortlist.jsp" class="btn btn-info">Fort List</a>
</form>
<br/>
<br/>
</div>

<%@ include file="../footer.jsp"%>
<script>
 $(function(){
	$("#form1").validate({
		rules:{
			txtfortname:{
				required:true
			},
			txtinfo:{
				required:true
			},
			txtimage:{
				required:true
			}
		},
		messages:{
			txtfortname:{
				required:"Fort Name required"
			},
			txtinfo:{
				required:"Please enter fort information"
			},
			txtimage:{
				required:"Fort Image is required"
			}
		}
		
	}); 
 });
 
 </script>
