<%-- 
    Document   : jquery3
    Created on : 28-Feb-2020, 11:27:16
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
    </head>
    <body>
        <table class="table" border="2" id="t1">
            <tr>
                <td>Row-1</td>
            </tr>
        </table>
        
        <input type="button" value="add more row" id="b1"/>
        
        <script>
            var rowno=2;
            $("#b1").click(function(){
                row = "<tr><td> Row - " + rowno++ + "</td></tr>";
               $("#t1").append(row);
            });
            </script>
    </body>
</html>
