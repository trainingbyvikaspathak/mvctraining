/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Dell
 */

class Student{
    private int rollno;
    private String name;
    private int age;

    public Student() {
    }

    public int getRollno() {
        return rollno;
    }

    public void setRollno(int rollno) {
        this.rollno = rollno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

  
}


public class JsonController extends HttpServlet {

     
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       response.setContentType("text/html");
       
       String op=request.getParameter("op");
        System.out.println(op);
       if(op!=null && op.equalsIgnoreCase("getjson"))
       {
       String jsonString = "{\"name\":\"ram\",\"age\":\"20\"}";
       out.println(""+jsonString);
    }
       
       
        if(op!=null && op.equalsIgnoreCase("getjson2"))
       {
           //converting java object into json -
           try{
         Student s = new Student();
         s.setRollno(101);
         s.setName("amit");
         s.setAge(20);
         ObjectMapper mapper = new ObjectMapper();
         String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(s);
         out.println(jsonString);
           }catch(Exception e){
               System.out.println("Error : + " + e.getMessage());
           }
    }
         if(op!=null && op.equalsIgnoreCase("getjson3"))
       {
           //converting java object into json -
           try{
         Student s1 = new Student();
         s1.setRollno(101);
         s1.setName("amit");
         s1.setAge(20);
         Student s2 = new Student();
         s2.setRollno(101);
         s2.setName("amit");
         s2.setAge(20);
         
               ArrayList<Student> students = new ArrayList();
               students.add(s1);
               students.add(s2);
               
         ObjectMapper mapper = new ObjectMapper();
         String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(students);
         out.println(jsonString);
           }catch(Exception e){
               System.out.println("Error : + " + e.getMessage());
           }
    }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }

    
}
