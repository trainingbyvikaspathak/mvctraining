 
package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.beans.Reporter;
import com.daos.ReporterDao;
import com.utility.FileUploader;

public class ReporterController extends HttpServlet {

    
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out= response.getWriter();
        response.setContentType("text/html");
        String op =request.getParameter("op");
        
        if (op!=null && op.equalsIgnoreCase("add")){
            HttpSession session = request.getSession();
            Reporter reporter = (Reporter)session.getAttribute("reporter");
            ReporterDao rd = new ReporterDao();
            
            String ImagePath = "";
            ImagePath  = FileUploader.getUploadedPath(getServletContext(), "media/reporter", request);
            reporter.setImage(ImagePath);
            
            if(rd.add(reporter)){
                session.removeAttribute("reporter");
                out.println("Reproter Added Successfully !");
            }
        }
    }

     
}
