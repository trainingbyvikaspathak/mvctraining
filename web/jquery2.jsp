<%-- 
    Document   : jquery2
    Created on : 28-Feb-2020, 11:03:33
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
        <input type="button" value="click here " id ="c1"/><br/>
        <pre>
            Enter first no:     <input type="text" id="t1"/>
            Enter second no :   <input type="text" id="t2"/>
                    <input type="button" value="Find Sum" id="b1"/>
                    <span id="result"></span>
        </pre>
        
        <script>
            $("#b1").click(function(){
               // $("#t1").val(200);
                a = Number($("#t1").val()) + Number($("#t2").val());
                $("#result").html("<b> SUM = " + a +"</b>");
            });
            
            $("input").focus(function(){
                $("#result").html("");
            });
            
            $("#c1").click(function(){
                $(this).val("You have clicke me !");
            });
            </script>
    </body>
</html>
