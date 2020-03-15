<%-- 
    Document   : signout
    Created on : 07-Mar-2020, 12:01:07
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
session.removeAttribute("reporter");
response.sendRedirect("../login.jsp");
%>