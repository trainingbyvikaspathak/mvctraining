<%-- 
    Document   : nav
    Created on : 17 Feb, 2020, 4:32:29 PM
    Author     : Lenovo
--%>


  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Search Live News </a>
        <ul class="navbar-nav ml-auto">
            <input type="text" id="keyword" class="form-control" placeholder="Enter Keyword "/>
             <i class="fa fa-search btn btn-success"id="search"></i> 
          </li>
               </ul>
          
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item <% if(request.getRequestURI().contains("home.jsp"))out.println(" active "); %>">
              <a class="nav-link" href="home.jsp"> <i class="fa fa-home"></i> Home</a>
          </li>
          <li class="nav-item  <% if(request.getRequestURI().contains("aboutus.jsp"))out.println(" active "); %>">
              <a class="nav-link" href="aboutus.jsp"><i class="fa fa-vcard"></i> About Us</a>
          </li>
          <li class="nav-item <% if(request.getRequestURI().contains("services.jsp"))out.println(" active "); %>">
              <a class="nav-link" href="services.jsp"> <i class="fa fa-server"></i> Services</a>
          </li>
          <li class="nav-item <% if(request.getRequestURI().contains("contactus.jsp"))out.println(" active "); %>">
              <a class="nav-link" href="contactus.jsp"><i class="fa fa-map-marker"></i> Contact</a>
          </li>
          <li class="nav-item <% if(request.getRequestURI().contains("login2.jsp"))out.println(" active "); %>">
              <a class="nav-link" href="login.jsp"><i class="fa fa-user"></i> login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

