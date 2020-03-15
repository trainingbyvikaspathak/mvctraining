<%
    session.removeAttribute("admin");
    response.sendRedirect("../login.jsp");
    %>