package p1;
import javax.servlet.http.*;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;


public class SendPassEmail extends HttpServlet
{
	public static String from="example@email.com";// provide the sender's email address here
	public static String password="password";// provide the sender's password here
	

	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		PrintWriter out=res.getWriter();
		HttpSession passsession=req.getSession();
		String pass=passsession.getAttribute("temppass").toString();
		HttpSession unamesession=req.getSession();
		String uname=unamesession.getAttribute("uname").toString();
		HttpSession emailsession=req.getSession();
		String to=emailsession.getAttribute("email").toString();
		
		
		
		 
	 		
	 		
	 		String msg="Dear User, \n\t Your account on House Rent has been created successfully. We are sending a temporary password, please login to your account\n" 
+"using this, and change it immediately.  \n Username="+uname+" \n Password="+
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
			unamesession=null;
			passsession=null;
			emailsession=null;
			i = 1;
			res.sendRedirect("../RegistrationDone.jsp");
        
			
			
        }
		  catch (MessagingException mex) 
		  {
	         mex.printStackTrace();
			// return i;
	      }
		   //return i;
   }
   
   
  

}