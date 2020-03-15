<%-- 
    Document   : jsonex2
    Created on : 04-Mar-2020, 10:41:23
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        <script>
             function getJson1(){
               ajax = new XMLHttpRequest();
                ajax.open("GET","JsonController?op=getjson",true);
                ajax.send();
                
               
                ajax.onreadystatechange= function(){ 
                     if (this.status==200 && this.readyState==4){
                        output = this.responseText; 
                        //p1.innerHTML = output;
                        //alert(output);
                        
                        obj = JSON.parse(output);
                        p1.innerHTML = "Name " + obj.name +"<br/>" + "Age : " + obj.age;
                        
                    }
                }
            }
                
       
           
            </script>
        
        <script>
            $(document).ready(function(){
            
    $("#b2").click(function(){
        $.get("JsonController?op=getjson2",function(responseText){
          // $("#p1").html(responseText);
          object = JSON.parse(responseText);
          $("#p1").append("Name :" + object.name);
          $("#p1").append("Rollno :"+ object.rollno);
          });
    });
      
       $("#b3").click(function(){
        $.get("JsonController?op=getjson3",function(responseText){
          students = JSON.parse(responseText);
          for (i=0;i<students.length;i++)
          {
              record = "rollno :"+ students[i].rollno +", Name : " + students[i].name +", Age : " + students[i].age +"<hr/>";
              $("#p1").append(record);
           
          }
       });
    });
      
});

            </script>
    </head>
    <body>
        
        <input type="button" value="load json1" onclick="getJson1();"/>
        <br/>
        <input type="button" id="b2" value="Load Jason from java class" />
        
        <input type="button" id="b3" value="Load json Array"/>
        <p id="p1">
            
        </p>
    </body>
</html>
