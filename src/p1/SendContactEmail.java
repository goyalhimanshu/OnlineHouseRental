package p1;
import javax.servlet.http.*;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;


public class SendContactEmail extends HttpServlet
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
		String mobile=req.getParameter("mobile");
		System.out.println("tmobile:->"+mobile);
		String name=req.getParameter("name");
		String msg1=req.getParameter("msg");
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
	 		
	 		
	 		String msg="Dear Customer,\n Greetings from DhundeAshiyaan.com\nWe are delighted to let you know that you have got a tenant request.\n\n"+
	 		"Tenant Info:\n\tName:"+name+"\n\t Email:"+email+"\n\t Mobile:"+mobile+"\n\n\tMessage from Tenant:\n\t\""+msg1+"\"\n\n Please Contact the tenant using above.\n Thanks";
	 		
	 		
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
			res.sendRedirect("../tenant/ContactMailSend.jsp");
        
			
			
        }
		  catch (MessagingException mex) 
		  {
	         mex.printStackTrace();
			// return i;
	      }
		   //return i;
   }
   
   
  

}