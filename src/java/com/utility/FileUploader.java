 
package com.utility;
 
import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploader {
 public static String getUploadedPath(ServletContext context,String parentDirectory,HttpServletRequest request){
     String imagePath="";
     
                   try{
                       System.out.println("Multipart data found.......");
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    items = upload.parseRequest(request);
                       System.out.println("Going to upload file .....");
                    Iterator itr = items.iterator();
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (!item.isFormField()) {
                            String photo = item.getName();
                            imagePath = parentDirectory +"/" + photo;
                            File savedFile = new File(context.getRealPath("/") + imagePath);
                            item.write(savedFile);

                        }

                    }
                   }catch(Exception e){
                       System.out.println("File Upload Error  :"+ e.getMessage());
                   }
     
     return imagePath;
 }   
}
