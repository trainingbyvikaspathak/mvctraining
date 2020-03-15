<%-- 
    Document   : home
    Created on : 17 Feb, 2020, 4:28:12 PM
    Author     : Lenovo
--%>

<%@page import="com.beans.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.NewsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Gist News Home</title>

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

                <jsp:include page="sidebar.jsp"></jsp:include>
                    <!-- /.col-lg-3 -->

                    <div class="col-lg-9">
                    <jsp:include page="crousel.jsp"></jsp:include>
                        <div class="row" id="news_body">
                            <div class="col col-md-12" style="text-align: center;z-index:10;position:fixed" id="loading" >
                                <img src="assets/images/loading.gif"/>
                            </div>

                        <%
                            int catid = request.getParameter("cat_id")!=null? Integer.parseInt(request.getParameter("cat_id")):-1;
                            NewsDao nd = new NewsDao();
                            ArrayList<News> newsList=null;
                            if(catid!=-1)
                                newsList = nd.getNewsByCatId(catid);
                            else
                                newsList= nd.getAllNewsByStatus("approved");
                                
                         for(News news : newsList){%>


                        <div class="card col col-md-4" style="width:400px">
                            <%-- <h2><%=i++%></h2>--%>
                            <img class="card-img-top img-thumbnail" src="<%=news.getImage() %>" alt="Card image" style="width:100%;height: 200px">
                            <div class="card-body">
                                <h4 class="card-title"> <%=news.getTitle() %> </h4>
                                <% String desc = news.getDescription().trim();%>
                                <p class="card-text"> <%= desc.length() > 100 ? desc.substring(0, 99) : desc%> ... </p>
                                <%--<button onclick="loadNews('<%=rs.getString("id")%>', newspara);" class="btn btn-primary" data-toggle="modal" data-target="#myModal" > view Detailed news</button>--%>
                                <a href="detailnews.jsp?id=<%=news.getId()%>" class="btn btn-primary" >view Detailed news</a>
                                <br/>
                            </div>
                        </div>

                       <% } %>




                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript -->
        <script src="assets/jquery/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>


        <!-- Consuming Rest api -->

        <script>


            $("#loading").fadeOut(500);


            $(document).ajaxStart(function () {
                $("#loading").fadeIn(500);
            });

            $(document).ajaxComplete(function () {
              $("#loading").fadeOut(500); 
            });

            $('#search').click(function () {
                 $.get("https://newsapi.org/v2/everything?q=" + $("#keyword").val() + "&from=2020-03-3&sortBy=popularity&apiKey=951eb8ae5c074f42a7b053d6067525ef", function (data) {
                    news = data;
                    articles = news["articles"]

                    $('#news_body').html('');

                    for (i = 0; i < articles.length; i++)
                    {
                        article = articles[i];
                        result = '<div class="card" class="col col-md-3" style="width:300px;margin:20px;">\
<h3>News-' + (i + 1) + ' </h3>\
<img class="card-img-top" src="' + article.urlToImage + '" alt="Card image" style="width:300px;height:300px;"> \
<div class="card-body">  \
<h4 class="card-title">' + article.title + '</h4> \
<p class="card-text"> ' + article.description + '</p>  \
<a href="' + article.url + '" class="btn btn-primary">View More ...</a>\
</div>\
</div>\
<br/>';
                        $('#news_body').append(result);
                    }
                });
            });

        </script>

    </body>

</html>
