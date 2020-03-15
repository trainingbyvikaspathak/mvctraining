package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.daos.NewsDao;
import com.beans.NewsCategory;
import java.util.ArrayList;
import com.daos.NewsCategoryDao;
import java.sql.*;
import com.beans.Subscriber;

public final class sidebar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"col-lg-3\">\n");
      out.write("\n");
      out.write("        <h1 class=\"my-4\">top news</h1>\n");
      out.write("        <div class=\"list-group\">\n");
      out.write("            <a href=\"home.jsp\" class=\"list-group-item ");
if(request.getParameter("cat_id")==null) out.println(" active ");
      out.write("\"> All News </a>   <br/>\n");
      out.write("                   \n");
      out.write("            ");
 
                NewsCategoryDao ncd  =new NewsCategoryDao();
                NewsDao nd = new NewsDao();
                ArrayList<NewsCategory> catlist  = ncd.getAllNewsCategory(); 
    for (NewsCategory cat : catlist) {
      out.write("\n");
      out.write("    <a href=\"home.jsp?cat_id=");
      out.print(cat.getId());
      out.write("\" class=\"list-group-item ");
if(String.valueOf(cat.getId()).equals(String.valueOf(request.getParameter("cat_id")))) out.println(" active ");
      out.write("\"> ");
      out.print(cat.getName());
      out.write("  <span class=\"badge badge-dark\">");
      out.print(nd.getApprovedCountByCategory(cat.getId()));
      out.write("</span> </a>   <br/>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                            \n");
      out.write("                \n");
      out.write("                           \n");
      out.write("    <button type=\"button\" class=\"btn btn-dark\" data-toggle=\"modal\" data-target=\"#myModal\">\n");
      out.write("    Subscribe Us\n");
      out.write("    </button>\n");
      out.write("   \n");
      out.write("           \n");
      out.write("        </div>\n");
      out.write("  \n");
      out.write("     <!-- The Modal -->\n");
      out.write("  <div class=\"modal\" id=\"myModal\">\n");
      out.write("    <div class=\"modal-dialog\">\n");
      out.write("      <div class=\"modal-content\">\n");
      out.write("      \n");
      out.write("        <!-- Modal Header -->\n");
      out.write("        <div class=\"modal-header\">\n");
      out.write("          <h4 class=\"modal-title\">Fill the Basic Details</h4>\n");
      out.write("          <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <!-- Modal body -->\n");
      out.write("        <div class=\"modal-body\">\n");
      out.write("           <form method=\"post\" class=\"form bg-light\">\n");
      out.write("                        <input type=\"text\" placeholder=\"Enter Name\" name=\"name\" class=\"form-control\"> <br/><br/>\n");
      out.write("                        <input type=\"email\" name=\"email\" placeholder=\"Enter your email\" class=\"form-control\"/> <br/><br/>\n");
      out.write("                        <input type=\"submit\" value=\"Subscribe\" class=\"btn btn-dark form-control\" name=\"submit\"/>\n");
      out.write("         </form>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <!-- Modal footer -->\n");
      out.write("        <div class=\"modal-footer\">\n");
      out.write("          <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("      </div>           \n");
      out.write("    </div>        \n");
      out.write("\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("                \n");
if(request.getParameter("submit")!=null){
      out.write('\n');
      com.beans.Subscriber subscriber = null;
      synchronized (_jspx_page_context) {
        subscriber = (com.beans.Subscriber) _jspx_page_context.getAttribute("subscriber", PageContext.PAGE_SCOPE);
        if (subscriber == null){
          subscriber = new com.beans.Subscriber();
          _jspx_page_context.setAttribute("subscriber", subscriber, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("subscriber"), request);
      out.write('\n');
      out.write('\n');

Connection con = null;
PreparedStatement smt=null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    con =DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","");
    String sql = "Insert into subscribers (name,email) values(?,?)";
    smt = con.prepareStatement(sql);
    smt.setString(1, subscriber.getName());
    smt.setString(2, subscriber.getEmail());
    int n =smt.executeUpdate();
    con.close();
    smt.close();
    if(n>0)
        out.println("<script>alert('Thanks for subscription !');</script>");
}catch(Exception e){
    if(e.getMessage().contains("Duplicate"))
        out.println("<script>alert('You Have Already Subscribed this Channel !!!');</script>");
    System.out.println("Error : "+ e.getMessage()); 
}
}

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
