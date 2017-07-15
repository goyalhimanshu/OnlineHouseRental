package p1;
import javax.servlet.http.*;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;


public class SendReplyEmail extends HttpServlet
{
	public static String from="example@email.com";// provide the sender's email address here
	public static String password="password";// provide the sender's password here
	

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		PrintWriter out=res.getWriter();
	
		String to=req.getParameter("email");
		System.out.println("email:->"+to);
		String msg=req.getParameter("msg");
		
			
	 		
	 		//String msg=req.getParameter("msg");
	 		String subject="Reply To Feedback";
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
			res.sendRedirect("../admin/ReplySent.jsp");
        }
		  catch (MessagingException mex) 
		  {
	         mex.printStackTrace();
			// return i;
	      }
		   //return i;
   }
   
   
  

}