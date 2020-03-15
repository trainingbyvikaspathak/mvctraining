
package com.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*;
import java.sql.*;

public class MyListener extends HttpServlet implements ServletContextListener  {

    public void contextInitialized(ServletContextEvent event) {
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            ServletContext ctx = event.getServletContext();
            ctx.setAttribute("connectionpool", cp);
            System.out.println("Connection Pool Initialized ...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent arg0) {
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
