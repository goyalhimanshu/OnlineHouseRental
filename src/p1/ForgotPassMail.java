package p1;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;


public class ForgotPassMail extends HttpServlet
{
	public static String from="example@email.com";// provide the sender's email address here
	public static String password="password";// provide the sender's password here
	

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{
		int j=0;
		PrintWriter out=res.getWriter();
		String pass = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
		System.out.println("pass = " + pass);
		String to=req.getParameter("email");	
		
		Connection con=DBInfo.getConnection();
		String update="update login set password=? where email=?";
		try 
		{
			PreparedStatement ps=con.prepareStatement(update);
			ps.setString(1, pass);
			ps.setString(2, to);
			j=ps.executeUpdate();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		if(j==0)
		{
			
			/*RequestDispatcher rd = req.getRequestDispatcher*/res.sendRedirect("../WrongPassword.jsp");
			/*rd.include(req, res);
			out.println("<center><h2><font color='red' >Email not registered. Try Again.</font></h2></center>");*/
		}
		 
		else
		{
			
	 		
	 		String msg="Dear User, \n\t We are sending a temporary password, please login to your account\n"+"using this, and change it immediately.  \n  Password="+
	 pass+"\nThanks. \n This is an automatic generated email. please donot reply to this. as all mail will directly transferred to trash.";
	 		
	 		//String msg=req.getParameter("msg");
	 		String subject="Account Registration";
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
			res.sendRedirect("../PasswordSent.jsp");
        
			
			
        }
		  catch (MessagingException mex) 
		  {
	         mex.printStackTrace();
			// return i;
	      }
		   //return i;
   }
		
	}
   
   
  

}