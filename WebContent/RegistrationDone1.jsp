

<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<jsp:useBean id="obj" class="p1.RegistrationBean">
	<jsp:setProperty property="*" name="obj"/>
</jsp:useBean>
<jsp:useBean id="passmail" class="p1.SendPassEmail"/>



 


<%@page import="p1.DBInfo"%>
<%@page import="java.util.UUID"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
  <title>Registration Done</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="js/gen_validatorv4.js" type="text/javascript"></script>  
   <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>
  
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">House Rent</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	<li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
        <li><a href="Registration.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li><li><a href="#">How It Works</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-earphone"></span>Contact Us</a></li>
      </ul>
    </div>
  </div>
</nav>

<p>&nbsp;</p>


<%

String cname=request.getParameter("cname");

session.setAttribute("cname", cname);
String captchacode=(String)session.getAttribute("captchacode");	

if(cname.equals(captchacode))
{

		String to[]=request.getParameterValues("to");
		
		
			
		String pass = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
		System.out.println("pass = " + pass);
		
		session.setAttribute("temppass", pass);
		session.setAttribute("uname", obj.getUsername());
		session.setAttribute("email", obj.getEmail());
		
			int flag=1;
				Connection con=DBInfo.getConnection();
				String select="select * from login where email=? or username=?";
				try
				{
					PreparedStatement ps1=con.prepareStatement(select);
					ps1.setString(1, obj.getEmail());
					ps1.setString(2, obj.getUsername());
					ResultSet rs=ps1.executeQuery();
					while(rs.next())
					{
						flag=0;
						break;
					}
				} 
				catch (Exception e1)
				{
					e1.printStackTrace();
				}
				%>
				<div id="container">    
				<%
				if(flag==1)
				{
						
					   int i=obj.registration(pass);
					 	response.sendRedirect("servlet/SendPassEmail");
					%>
					 <center><h3><p class="text-success">Registration Successfully Done.</p><br>
					 <button type="button" class="btn btn-success btn-lg" id="login" >Login</button></h3>
					 </center>			 
					 
					 <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header" style="padding:35px 50px;">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
					        </div>
					        <div class="modal-body" style="padding:40px 50px;">
					          <form role="form" id="form" action="AfterLogin.jsp" method="post">
					            <div class="form-group">
					              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
					              <input type="text" class="form-control" id="username" name="username" placeholder="Username">
					            </div>
					            <div class="form-group">
					              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
					              <input type="text" class="form-control" id="password" name="password" placeholder="Password">
					            </div>
					            <div class="checkbox">
					              <label><input type="checkbox" value="" checked>Remember me</label>
					            </div>
					              <button type="submit" class="btn btn-success btn-block" onclick='document.forms["form"].submit();'><span class="glyphicon glyphicon-off"></span> Login</button>
					          </form>
					        </div>
					        <div class="modal-footer">
					          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
					          <p>Not a member? <a href="#">Sign Up</a></p>
					          <p>Forgot <a href="#">Password?</a></p>
					        </div>
					      </div>
					      </div>
					  </div> 
					</div>
					<script>
					$(document).ready(function(){
					    $("#login").click(function(){
					        $("#myModal").modal();
					    });
					});
					</script>
				<%	   
		    	}
		    	
		    	else
		    	{%>
		    		<center>
		    		<h3><p class="text-warning">Registration Failed. Username/Email already exist.</p></h3><br>
		    		<a href="Registration.jsp" class="btn btn-warning btn-lg">Try Again</a>
		    		OR
		    		<a href="Login.jsp" class="btn btn-info btn-lg">Login</a>
		    		</center>
		    	<%
		    	}
 }
		    
		    else
		    {		    
			%>
				<center>
		    		<h3><p class="text-warning">Registration Failed. Captcha not matched. Try again</p></h3><br>
		    		<a href="Registration.jsp" class="btn btn-warning btn-lg">Try Again</a>
		    		OR
		    		<a href="Login.jsp" class="btn btn-info btn-lg">Login</a>
		    		</center>
			<%
			}
			
			 %>


</div>

<div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">� 2015 - HouseRent
          
      </p>
      
      <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a>
    </div>
    
    
  </div>

</body>
</html>

