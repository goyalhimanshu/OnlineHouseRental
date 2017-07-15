<!DOCTYPE html>
<%@page import="p1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="js/gen_validatorv4.js" type="text/javascript"></script>  
</head>
<body>

< <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!-- <a class="navbar-brand" href="index.jsp"><i class="fa fa-home"></i>  <span class="light">House</span> Rent</a> -->
      <a class="navbar-brand" href="index.jsp"><img alt="HouseRent" src="images/logo.png" width="140" height="35"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
      	<li><a href="Registration.jsp"><span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span></sup> SignUp</a></li>
      	<li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li><a href="ContactUs.jsp"><span class="glyphicon glyphicon-envelope"></span>Contact Us</a></li>
      </ul>
    </div>
  </div>
</nav>
<br><br>


<p>&nbsp;</p>



<%
int flag=1;
String usertype="";
String username=request.getParameter("username");
String password=request.getParameter("password");
Connection con=DBInfo.getConnection();
String select="select * from login where username=? and password=?";

try
{
System.out.println("before while username="+username);
	
	PreparedStatement ps=con.prepareStatement(select);
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next())
	{
		System.out.println("inside while username="+username);
		flag=0;
		usertype=rs.getString("usertype");
		session.setAttribute("username", username);
		break;
	}
}catch(Exception e){e.printStackTrace();}	
	
	if(flag==0 && usertype.equalsIgnoreCase("viewer"))
	{
		System.out.println("after while username="+username);
		response.sendRedirect("Home.jsp");
	}
	else if(flag==0 && usertype.equalsIgnoreCase("admin"))
	{
		System.out.println("after while username="+username);
		response.sendRedirect("admin/Admin.jsp");
	}
	else	
	{
	%>
		<center><h3><p class="text-danger">Login Failed.</p></h3></center>
		<%@ include file="Login.html" %>
		
	<%
	}
	 %>
	 <div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      
      <!-- <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a> -->
    </div>
    
    
  </div>
</body>
</html>