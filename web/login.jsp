<%-- 
    Document   : login
    Created on : 27-Jan-2020, 16:07:14
    Author     : Dell
--%>

<%@page import="com.beans.Admin"%>
<%@page import="com.daos.AdminDao"%>
<%@page import="com.beans.Reporter"%>
<%@page import="com.daos.ReporterDao"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>contact Information</title>
  <link rel="icon" href="assets/images/favicon.ico" type="x/image"/>
  <!-- Bootstrap core CSS -->
  <jsp:include page="base.jsp"></jsp:include>

  <!-- Custom styles for this template -->
  <link href="assets/css/shop-homepage.css" rel="stylesheet">
  <style>
      body{
    background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
}
.contact-form{
    background: #fff;
    margin-top: 10%;
    margin-bottom: 5%;
    width: 70%;
}
.contact-form .form-control{
    border-radius:1rem;
}
.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    transform: rotate(0deg);
}
.contact-form form{
    padding: 14%;
}
.contact-form form .row{
    margin-bottom: -7%;
}
.contact-form h3{
    margin-bottom: 8%;
    margin-top: -10%;
    text-align: center;
    color: #0062cc;
}
.contact-form .btnContact {
    width: 50%;
    border: none;
    border-radius: 1rem;
    padding: 1.5%;
    background: #dc3545;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
}
.btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
}
  </style>
</head>

<body>
<%
          //Reading cookie 
           Cookie cookies[] = request.getCookies();
           String userid="",password="";
           
           for(Cookie c : cookies){
               if(c.getName().equals("userid"))
               {
                   userid=c.getValue();
               }
               if (c.getName().equals("password"))
               {
                   password = c.getValue();
               }
           }
       %>    
    
<jsp:include page="nav.jsp"></jsp:include>
  
  <!-- Page Content -->
  <div class="container">

    <div class="row">

   <%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>
      <!-- /.col-lg-3 -->

      <div class="col-lg-12">
       <div class="row">
       
        
<div class="container contact-form">
            <div class="contact-image">
                <img src="assets/images/loginLogo.png" alt="rocket_contact"/>
            </div>
     <p>
      <span style="color:red; font-family: corble; font-size: 16px">
        <%=request.getParameter("msg")!=null?request.getParameter("msg"):""%>
        </span>
    </p> 
      <form class="form-signin"  method="post">
   <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
   <input type="text" id="inputEmail" class="form-control" placeholder="userid" value="<%=userid%>"  autocomplete="off" required autofocus name="userid">
   <br/> 
   <input type="password" id="inputPassword" class="form-control" placeholder="Password"  value="<%=password%>" name="password" required>
  <br/><br/>
  <div style="border-style: solid; border-radius: 10px; border-width:1px;"> 
      <h6>Select Role </h6> 
      <input type="radio" name="role" id="role1" value="admin"/>  <label for="role1"><b>Admin </b></label>
      <input type="radio" name="role" id="role2" value="reporter"/> <label for="role2"><b>Reporter</b></label> 
  </div>
  <br/><br/>
  
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" name="remember" value="remember"> Remember me
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign in</button>
 </form>

</div>   
           
       </div>
     
      </div>
   
  </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
      <jsp:include page="footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="assets/jquery/jquery.min.js"></script>
  <script src="assets/js/bootstrap.bundle.min.js"></script>

  
  <%if(request.getParameter("submit")!=null){
           userid= request.getParameter("userid");
           password = request.getParameter("password");
           String role = request.getParameter("role");
           
        if(role==null){
            response.sendRedirect("login.jsp?msg=Please Select Any One Role");
            //return;
        }
        else if(role.equals("admin")){
               AdminDao ad = new AdminDao();
               Admin admin = ad.getByLoginDetail(userid, password);
               System.out.println("Result : "+ admin);
               if(admin==null)
                   response.sendRedirect("login.jsp?msg=Invalid Userid or password");
               else {
                   session.setAttribute("admin", admin);
                   response.sendRedirect("admin/dashboard.jsp");
               }
           }
    else if (role.equals("reporter")){
           ReporterDao rd = new ReporterDao();
           int id = rd.isValid(userid, password);
           if(id!=-1)
           {
               Reporter reporter = rd.getById(id);
               session.setAttribute("reporter", reporter);
               response.sendRedirect("reporter/dashboard.jsp");
           }
           else 
               response.sendRedirect("login.jsp?msg=Invalid Userid/Password Or not yet Approved"); 
           }
           
           }
      %>
  
  
</body>

</html>


