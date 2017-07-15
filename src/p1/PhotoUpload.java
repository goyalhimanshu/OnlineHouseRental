package p1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
public class PhotoUpload extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            Part p =  request.getPart("postid");
            Scanner scanner  = new Scanner( p.getInputStream());
            String postid = scanner.nextLine(); 
            
            
            
            Part photo =  request.getPart("photo");
                        
           
            // Connect to Oracle
            Connection con = DBInfo.getConnection();
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement("insert into houseimage values(?,?)");
            ps.setString(1, postid);
            
            // size must be converted to int otherwise it results in error
            ps.setBinaryStream(2, photo.getInputStream(), (int)  photo.getSize());
           
            ps.executeUpdate();
            con.commit();
            con.close();
            response.sendRedirect("../owner/PhotoUploaded.jsp?id="+postid);
        } 
        catch(Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally {            
            out.close();
        }
    }
}