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
public class AddPhoto extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            Part p =  request.getPart("id");
            Scanner scanner  = new Scanner( p.getInputStream());
            String id = scanner.nextLine(); 
            
            
            Part photo =  request.getPart("image");
                        
           
            // Connect to Oracle
           Connection con=DBInfo.getConnection();
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement("insert into houseimage values(?,?)");
            ps.setString(1, id);
            // size must be converted to int otherwise it results in error
            ps.setBinaryStream(2, photo.getInputStream(), (int)  photo.getSize());
            int i=ps.executeUpdate();
            con.commit();
            con.close();
			if(i==1)
			{
				out.println("Exam Successfully Added. <p> <a href='AddQuestion?exam="+id+"'>List Players </a>");
			}
			else
			{
				System.out.println("exam="+id+" not added");
				out.println("<h2>Exam Already Exist. You can add questions to this exam or you can create new exam</h2>");
				out.println("<a href=\"AddQuestion?exam="+id+"\" ><input type=submit value=\"Add Question\"></a>");
				out.println("<a href=\"AddExam\"> <input type=submit value=\"Add New Exam\"</a>");
			}
        } 
        catch(Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally {            
            out.close();
        }
    }
}