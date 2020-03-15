<%-- 
    Document   : home
    Created on : 17 Feb, 2020, 4:28:12 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login page</title>
  <link rel="icon" href="assets/images/favicon.ico" type="x/image"/>
  <!-- Bootstrap core CSS -->
  <jsp:include page="base.jsp"></jsp:include>

  <!-- Custom styles for this template -->
  <link href="assets/css/shop-homepage.css" rel="stylesheet">

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
           <div class="col" style="text-align: justify">
               <br/><br/>
               
               <jsp:include page="login.jsp"></jsp:include>
           </div> 
          </div>
       

      </div>
      

    </div> <jsp:include page="footer.jsp"></jsp:include>
 
           
    <!-- /.row -->
   </div>
  <!-- /.container -->

  <!-- Footer -->
    

  <!-- Bootstrap core JavaScript -->
  <script src="assets/jquery/jquery.min.js"></script>
  <script src="assets/js/bootstrap.bundle.min.js"></script>

</body>

</html>
