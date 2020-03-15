<%-- 
    Document   : jsonEx1
    Created on : 29-Feb-2020, 15:00:55
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
        <script>
            obj = {"rollno":101,"name":"amit","age":20};
            //reading object using key -
            document.write('the rollno of ' + obj['name'] + ' is '+obj.rollno);
            
            obj2 = JSON.stringify(obj);
            document.write(obj2.substr(0,10));
            
            
            //reading using loop:
            // from object array :-
            students = [ 
                {"rollno":101,"name":"amit","age":20}, 
                {"rollno":102,"name":"kumar","age":21}
            ];
            for (x=0; x<students.length;x++)
                document.write("<br/>" + x);  //by default the index will be fetched in x
            
              for (x=0; x<students.length;x++)
                document.write("<br/>" + students[x].name);  //by default the index will be fetched in x
            
            //we can also use dot notation with java script object -
             for(x in students)
                document.write("<br/>" + students[x].name);  //by default the index will be fetched in x
            
            //we can also use array inside object (as the value of key)
            s = {'rollno' :101, 'name':'ram','marks':[55,45,56,67,66]};
            document.write("<br/>" + s.rollno +","+ s.name + s.marks[0]);
            
            //reading using for loop
            for (i=0; i<students.length; i++)
                document.write("<br/>"+ students[i].rollno + " : " + students[i].name +" : "+ students[i].age +"<hr/>");
            
           for (x in s.marks)
               document.write("<br/>" + s.marks[x])
           
           //JSON -
           json1 = '{"rollno":"101","name":"sumit","age":"20"}';
           json2 = JSON.stringify(obj);
           json3 = JSON.stringify(students);
           document.write(json1+"<br/>"+ json2 +"<br/>" + json3);
           
          // document.write(json1.rollno);  ----> undefined
          
          obj2 = JSON.parse(json1);
          document.write(obj2); //we cannot print object directly
          document.write(obj2.name,obj2.age,obj2.rollno);
          
           //nested javascript obeject -
           students = {
               '1' : {'name':'ram','age':20},
               '2' : {'name':'mohan','age':21},
               '3' : {'name':'amit','age':23}
           };
           document.write("<br/>" + students[1].name +" : "+ students[1]['age']);
           
          //loop
          for (key in students){
              document.write("<br/>" + students[key].name +" - " + students[key].age);
          }
          
        </script>
    </body>
</html>
