<%@ page import="java.io.*" %> 
<%@ page import="java.awt.*"%> 
<%@ page import="java.awt.image.*"%> 
<%@ page import="javax.imageio.ImageIO"%> 
<%@ page import="java.util.*"%> 
<html>
 <body bgcolor=cyan>
	<form method=next1.jsp method="post">
	   <input type="submit">
    </form>
</body>
</html>
<% 
	int width=75; 
	int height=35; 
	Random rdm=new Random(); 
	int rl=rdm.nextInt(); 
   
	
	String hash1 = Integer.toHexString(rl); 
  
	String capstr=hash1.substring(0,5); 

	
	
	session.setAttribute("captchacode",capstr); 

	Color background = new Color(204,204,204); 

	Color fbl = new Color(0,100,0); 

	Font fnt=new Font("SansSerif",1,17); 

	BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR); 

	Graphics g = cpimg.createGraphics(); 

	g.setColor(background); 

	g.fillRect(0,0,width,height); 

	g.setColor(fbl); 

	g.setFont(fnt); 

	g.drawString(capstr,10,25); 

	g.setColor(background); 

	g.drawLine(10,17,80,17); 

	//g.drawLine(10,22,80,22); 

		try 
		{ 
		response.setContentType("image/jpeg"); 
		OutputStream strm = response.getOutputStream(); 
		if(response !=null && strm !=null) 
		{ 
		ImageIO.write(cpimg,"jpeg",strm); 
		cpimg.flush(); 
		strm.close(); 
		} 
		} 
		catch(Exception e) 
		{ 
		e.printStackTrace(); 
		System.out.println(e.getMessage()); 
		} 
%>
