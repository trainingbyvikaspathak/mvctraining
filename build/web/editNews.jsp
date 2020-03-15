<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>

<jsp:include page="base.jsp"></jsp:include>
</head>
 
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","");
        String sql = "select * from news where id=?";
        PreparedStatement smt = con.prepareStatement(sql);
        smt.setInt(1, id);
        ResultSet rs = smt.executeQuery();
        if(rs.next())
        {%>
            
           
    
<form class="form" method="post" enctype="multipart/form-data" action="NewsController?op=update">
    <input type="hidden" name="id" value="<%=id%>"/>    
    <b>Title</b>    <input type="text" placeholder="Title of news" name="title" value="<%=rs.getString("title")%>" class="form-control"/><br/><br/>
    
    <b>Description</b> 
    <textarea name="description" class="form-control" rows="10" cols="30">
        <%=rs.getString("description")%>
    </textarea>
<br/>

<img src="media/<%=rs.getString("image")%>" width="200" height="300" class="img img-thumbnail"/>
<br/><br/>
<input type="file" name="ImageFile" id="ImageFile" class="form-control" />
<br/><br/>

<input type="submit" name="submit" value="Update" class="btn btn-primary form-control" />
 
</form>
        
        <%}
        
    }catch(Exception e){
        System.out.println("Error : "+ e.getMessage());
    }
    %>
 
</body>
</html>