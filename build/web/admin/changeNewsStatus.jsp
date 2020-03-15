<%-- 
    Document   : dashboard
    Created on : 07-Mar-2020, 14:53:37
    Author     : Dell
--%>

<%@page import="com.beans.News"%>
<%@page import="com.daos.NewsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title> Update Status</title>

        <jsp:include page="base.jsp"></jsp:include>
        </head>

        <body id="page-top">
        <%
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("../login.jsp");
                return;
            }
        %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="sidebar.jsp"></jsp:include>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                    <jsp:include page="topbar.jsp"></jsp:include>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="row">
                                <%
                                    int newsid = request.getParameter("newsid") != null ? Integer.parseInt(request.getParameter("newsid")) : 0;
                                    NewsDao nd = new NewsDao();
                                    News news = nd.getById(newsid);
                                    
    if(request.getParameter("submit")!=null){
         String status = request.getParameter("status");
         String status_text  = request.getParameter("status_text");
         if(nd.updateNewsStatus(news, status, status_text)) 
             response.sendRedirect("shownews.jsp");
         else 
             out.println("<script>alert('Status cannot be Updated');</script>");
    }
    
   
                                %>
                                <div class="card col col-md-10" style=" text-align: justify;text-justify: inter-word;">
                                    <div class="card-body">
                                        <h4 class="card-title"><%=news.getTitle() %></h4>
                                        <img class="card-img-bottom" src="../<%=news.getImage()%>" alt="Card image" style="height: 200px; width:200px;float:left;border-radius: 10%;border-style: solid">
                                         <p class="card-text"><%=news.getDescription()%></p>
                                    </div>
                                    <br/><br/>
                                    <a href="dashboard.jsp" class="btn btn-primary">Back without Changing Status</a>
                                    <form method="post" action="changeNewsStatus.jsp?newsid=<%=news.getId()%>">
                                    <h4>Change Status </h4>
                                    <p><input type="radio" name="status" value="Pending" <%if(news.getStatus().equals("Pending"))out.println(" checked"); %>/>Pending </p>  
                                    <p><input type="radio" name="status" value="Approved" <%if(news.getStatus().equals("Approved"))out.println(" checked"); %>/>Approved </p>
                                    <p><input type="radio" name="status" value="Rejected" <%if(news.getStatus().equals("Rejected"))out.println(" checked"); %>/>Rejected </p>
                                     
                                    <p>Reason to Change Status :</p>
                                    <p><input type="text" name="status_text" class="form-control" value="<%=news.getStatus_text()%>" /> </p>
                                    <p><input type="submit" name="submit" value="Save and Return" class="btn btn-primary form-control"/></p>
                                    </form>
                                </div>


                            </div>

 
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <jsp:include page="footer.jsp"></jsp:include>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap core JavaScript-->

    </body>

</html>
