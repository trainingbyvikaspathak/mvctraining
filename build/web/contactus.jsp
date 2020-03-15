<%-- 
    Document   : home
    Created on : 17 Feb, 2020, 4:28:12 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.beans.Query"%>

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
    transform: rotate(29deg);
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
                <img src="assets/images/rocket.png" alt="rocket_contact"/>
            </div>
            <form method="post">
                <h3>Drop Us a Message</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" placeholder="Your Name *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="Your Email *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="contact" class="form-control" placeholder="Your Phone Number *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btnContact" value="Send Message" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="message" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
                        </div>
                    </div>
                </div>
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

  
  <%
      if(request.getParameter("submit")!=null){%>
      <jsp:useBean id="query" class="com.beans.Query"></jsp:useBean>
      <jsp:setProperty name="query" property="*"></jsp:setProperty>
          
     <%
         Connection con =null;
         PreparedStatement smt =null;
         try {
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","");
             String sql = "insert into query(name,email,contact,message) values(?,?,?,?)";
             smt = con.prepareStatement(sql);
             smt.setString(1, query.getName());
             smt.setString(2, query.getEmail());
             smt.setString(3, query.getContact());
             smt.setString(4, query.getMessage());
             int n = smt.executeUpdate();
             con.close();
             smt.close();
             if (n>0)
                 out.println("<script> alert('We will soon contact you ...');</script>");
         }catch (Exception e){
             System.out.println("Error :"+ e.getMessage());
         }
}%>
  
  
</body>

</html>
