<%-- 
    Document   : addPic
    Created on : 26-Feb-2020, 23:35:53
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Person" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Profile Pic</title>
        <jsp:include page="base.jsp"></jsp:include>
            <script type="text/javascript">

                function readURL(input) {
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
            <div class="container">
                <div class="row">
                    <div class="col col-md-6">
                        <center>
                        <% if (request.getParameter("submit") != null) {%>

                        <jsp:useBean class="com.beans.Person" id="person" scope="session"></jsp:useBean>
                        <jsp:setProperty name="person" property="*"></jsp:setProperty>


                        <% String hobbies[] = request.getParameterValues("hobbies");
                            String hbs = "";
                            for (String s : hobbies) {
                                hbs += s + ",";
                            }
                            person.setHobbies(hbs); %>

                        <form action="PersonController?op=add" method="post" enctype="multipart/form-data" class="form">
                            <h4>Upload Profile Image </h4>
                            <img src="assets/images/nopic.jpg" style="width:300px;height: 300px" class="img img-thumbnail" id="preview"/> <br/>
                            <input type="file" name="photo" class="form-control bg-dark" onchange="readURL(this);"/><br/>
                            <input type="submit" value="Register Me" class="btn btn-primary form-control"/>
                        </form>
                            <br/>
                            <a href="add.jsp" class="btn btn-success"> << Check Previous Data</a>
                        <%} else {
                                out.println("<b> Please Complete  Registration Page-1</b> <br/>"
                                        + "<a href='add.jsp'> Go To Register Page</a>");
                            }%>

                    </center>
                </div>
            </div>
        </div>


    </body>
</html>
