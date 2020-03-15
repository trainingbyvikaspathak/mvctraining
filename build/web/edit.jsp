<%-- 
    Document   : show
    Created on : 26-Jan-2020, 11:29:15
    Author     : Dell
--%>
<%@page  contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, com.daos.PersonDao, com.beans.Person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
            <script type="text/javascript">

                function readURL(input) {
                    //       alert('hello');
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }
            </script>
        </head>
        <body>
            <jsp:useBean class="com.beans.Person" id="person1" scope="session"></jsp:useBean>
                      
              <div class="container">       
          <div class="row">
                  
                  <div class="col col-md-5" style="right:0px; position: fixed ; height: 100%"> <center>
              <%if (request.getParameter("submit") != null) {
                  String op= request.getParameter("op");
                        if(op!=null && op.equals("cancel"))
                        {
                            session.removeAttribute("person1");
                            response.sendRedirect("show.jsp");
                            return;
                        }
                      %> 
                      <jsp:setProperty name="person1" property="*"></jsp:setProperty>
                        <%
                            String hobbies[] = request.getParameterValues("hobbies");
                            String hbs = "";
                            for (String s : hobbies) {
                                hbs += s + ",";
                            }
                            person1.setHobbies(hbs);
                        %>
                        
                        <form action="PersonController?op=update" method="post" enctype="multipart/form-data" class="form"> 
                            <img src="${person1.image}" class="img" width="300" height="300" id="preview" border="2"/> <br/>
                            <input type="file" name="photo"   onchange="readURL(this);"/><br/><br>
                            <input type="submit" value="Update" class="btn btn-primary form-control"/>
                        </form>

                        <%
                            }
                        %>
                        </center> </div>
     
                    <div class="col col-md-6">
                    <%
                        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
                        PersonDao pdo = new PersonDao();
                       if ((person1 == null || person1.getId()!=id)) 
                            person1 = pdo.getById(id);
                       session.setAttribute("person1", person1); 
                    %>

                    <center>
                        <h1>Edit the Details </h1>
                        <form method='post'> 
                            <table height="300">
                                 <tr>
                                     <td>User Id is </td>
                                     <td> <input type="text" value="${person1.id}" readonly="readonly" name="id" class="disabled bg-light"/></td>
                                </tr>
                                <tr>
                                     <td>Enter Name </td>
                                    <td><input type="text"  name="name" required="required" value="${person1.name}"></td>
                                </tr>
                                <tr>
                                    <td>Enter Father Name </td>
                                    <td><input type="text" name="fname" required="required" value="${person1.fname}"></td>
                                </tr>
                                <tr>
                                    <td>Enter Age</td>
                                    <td><input type="number" name="age"  value="${person1.age}"></td>
                                </tr>

                                <tr>
                                    <td>Your userid</td>
                                    <td><input type="text" name="userid"  value="${person1.userid}" readonly="readonly"></td>
                                </tr>
                                <tr>
                                    <td>Select Gender </td>
                                    <td>
                                        <input type="radio" name="gender" value="Male"${person1.gender.equalsIgnoreCase("Male")?" checked": ""}/>Male
                                        <br/>
                                        <input type="radio" name="gender" value="Female" ${person1.gender.equalsIgnoreCase("Female")?" checked": ""}/> Female
                                    </td>
                                </tr>
                                <tr>
                                    <td>Select Your Hobbies : </td>
                                    <td>
                                        <input type="checkbox" name="hobbies" value="Dancing" ${person1.hobbies.contains("Dancing")?" checked": ""}>Dancing
                                        <input type="checkbox" name="hobbies" value="Singing" ${person1.hobbies.contains("Singing")?" checked": ""}>Singing <br/>
                                        <input type="checkbox" name="hobbies" value="Cooking"  ${person1.hobbies.contains("Cooking")?" checked": ""}>Cooking
                                        <input type="checkbox" name="hobbies" value="Drawing"  ${person1.hobbies.contains("Drawing")?" checked": ""}/>Drawing <br/>

                                    </td>


                               
                                <tr><th colspan="2"> <input type="submit" value="Save and Next" class="btn btn-primary form-control" name="submit"/> </th></tr>
                                <tr><th colspan="2"> <input type="submit" value="Cancel Update and GoBack" class="btn btn-success form-control" name="submit" formaction="edit.jsp?op=cancel" /> </th></tr>
                            </table>
                        </form>

                      

                    </center>

                </div>
          </div>
                       
            </div>
        </div>

    </body>
</html>