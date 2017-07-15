package p1;
import javax.servlet.http.*;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;


public class SendReportEmail extends HttpServlet
{
	public static String from="example@email.com";// provide the sender's email address here
	public static String password="password";// provide the sender's password here
	

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		PrintWriter out=res.getWriter();
		
		
		
		Connection con=DBInfo.getConnection();
		String to="";
		String postid=req.getParameter("postid");
		System.out.println("postid:->"+postid);
		String email=req.getParameter("email");
		System.out.println("email:->"+email);
		
		String reason=req.getParameter("reason");
		String query="select email from login where username=(select username from house where postid=?)";
		try
		{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, postid);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				to=rs.getString("email");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	 		
		
		
		String report="insert into report values(?,?,?)";
		try {
			PreparedStatement ps1=con.prepareStatement(report);
			ps1.setString(1,postid);
			ps1.setString(2,email);
			ps1.setString(3,reason);
			ps1.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	 		
	 		String msg="Dear Customer,\n Greetings from DhundeAshiyaan.com\nYour post "+postid+" has been reported to us due to following reason as given from one of our user:\n\n\t\""+
	 		reason+"\"\n\n\t Please act to this and contact Administrator immediately, otherwise your post will be deleted from website.\n\nThanks,\nHouseRent Team ";
	 		
	 		
	 		//String msg=req.getParameter("msg");
	 		String subject="Alert!! Post Reported!!!";
			System.out.println("to:->"+to);
			int i = 0;
			
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true"); 
			properties.put("mail.smtp.host", "smtp.gmail.com");
	     
	     
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.auth", "true");
	  
	  
	  
			Session session = Session.getInstance(properties, new javax.mail.Authenticator()
			{
			protected PasswordAuthentication getPasswordAuthentication()
			{
			return new PasswordAuthentication(from, password);
			} 
			}
			);
      
			
	  
	  try
	  {
         final MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         InternetAddress addressTo = new InternetAddress(to);
            /*for (int j = 0; j < to.length; j++)
            {
                addressTo[j] = new InternetAddress(to[j]);
            }*/
         
            message.setRecipient(Message.RecipientType.BCC, addressTo); 
			message.setSubject(subject);  //set subject
        
		
			message.setText(msg);  //set message
		
        
			new Thread(new Runnable()
			{
			public void run() 
			{
				try
				{
					Transport.send(message);
				}
				catch (Exception e){e.printStackTrace();}
			}
			}).start();
		
		
			session = null;
			
			i = 1;
			res.sendRedirect("../tenant/ReportSubmit.jsp");
        
			
			
        }
		  catch (MessagingException mex) 
		  {
	         mex.printStackTrace();
			// return i;
	      }
		   //return i;
   }
   
   
  

}