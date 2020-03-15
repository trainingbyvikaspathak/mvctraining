<%-- 
    Document   : show
    Created on : 26-Jan-2020, 11:29:15
    Author     : Dell
--%>

<%@page import="com.beans.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.PersonDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Person List</title>
        <link rel="icon" href="assets/images/favicon.ico" type="x/image"/>
        <jsp:include page="base.jsp"></jsp:include>
    </head>
    <body>
     
    <center><h2>List of Persons</h2> </center>
    <table width='700' border='1' cellspacing='0' class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Father's Name </th>
            <th>UserID</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Hobbies </th>
            <th>Photo</th>
            <th>Operations</th>
        </tr>
        <%
            PersonDao pd = new PersonDao();
            ArrayList<Person> rows =new ArrayList();
            int start= request.getParameter("start")!=null? Integer.parseInt(request.getParameter("start")):0;
            int end=3;
            int total= pd.getRecordCount();
            rows = pd.getRowsByLimit(start, end);
            for(Person person : rows)
              {%>
              <tr>
                  <td><%=person.getId()%> </td>
                  <td><%=person.getName()%> </td>
                  <td><%=person.getFname()%> </td>
                  <td><%=person.getUserid()%> </td>
                  <td><%=person.getAge()%></td>
                  <td><%=person.getGender()%> </td>
                  <td><%=person.getHobbies()%> </td>
                  <td><img src="<%=person.getImage()%>" style="width:64px; height: 64px;"/></td>
                  <td><a href="edit.jsp?id=<%=person.getId()%>" class="btn btn-success"> <i class="fa fa-pencil" aria-hidden="true"></i></a>  |  <a href="PersonController?id=<%=person.getId()%>&op=delete" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a> </td>
              </tr>
            <%}%>  
              
      </table>
    <br/>
    <span style="float:left"><a href="show.jsp?start=<%=start-end%>" class="btn btn-primary <% if(start==0) out.println("disabled");%>">Previous</a></span>
    <center>
    <%
     int pages = total/end + (total%end==0?0:1);
       for(int i=0; i<pages; i++)
       {%>
       <span style="text-decoration: none; align-content: center;  <% if(Math.floor(start/end) == i) out.println("background-color: orange");%>" class="btn btn-dark"><a href="show.jsp?start=<%=end*i%>">Page <%=i+1%> </a></span> 
       <%}
        %>
     <span style="float:right"><a href="show.jsp?start=<%=start+end%>" class="btn btn-primary <% if(start+end >=total)out.println(" disabled");%> ">NEXT</a></span>
  
    </center> 
    <br/><br/>
    <a href='add.jsp' class="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>Add More Record</a>
    </body>
</html>
