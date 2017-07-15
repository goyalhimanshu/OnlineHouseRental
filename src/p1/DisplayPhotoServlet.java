package p1;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DisplayPhotoServlet extends HttpServlet {

    @Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	int row=Integer.parseInt(request.getParameter("row"));
            Connection con = DBInfo.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from houseimage where postid = ?");
            String postid = request.getParameter("postid");
            ps.setString(1,postid );
            ResultSet rs = ps.executeQuery();
            while(rs.absolute(row))
            {
            Blob b = rs.getBlob("image");
            response.setContentType("image/jpeg");
            response.setContentLength((int) b.length());
            InputStream is = b.getBinaryStream();
            OutputStream os = response.getOutputStream();
            byte buf[] = new byte[(int) b.length()];
            is.read(buf);
            os.write(buf);
            os.close();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

}