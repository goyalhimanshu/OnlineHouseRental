<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>


<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Contact Us</title>
      <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style>
table, th, td {
    border:0;
    padding: 40px;
}
table {
    border-spacing: 120px;
}
</style>
  </head>
  
  <body>
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!-- <a class="navbar-brand" href="Home.jsp"><i class="fa fa-home"></i>  <span class="light">House</span> Rent</a> -->
      <a class="navbar-brand" href="Home.jsp"><img alt="HouseRent" src="images/logo.png" width="140" height="35"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="Home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
      	<li><a href="tenant/SearchHouse.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>
      	<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Settings <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="UpdateUserInfo.jsp">Update Your Info</a></li>
            <li><a href="PostTable.jsp">Update Ad Info</a></li>
          </ul>
        </li>
        <li><a href="ContactUs.jsp"><span class="glyphicon glyphicon-envelope"></span>Contact Us</a></li>
        <li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
	&nbsp;&nbsp;&nbsp;
	<table align="center">
		<tr>
			<td><h1 align="left">Contact Us: </h1>
			  
		      <p>&nbsp;</p>
		    <table width="300" border="0" align="center">
              <tr>
                <td><h3><span class="glyphicon glyphicon-envelope"></span>Phone/Email</h3>
                  <div align="left">
                    <p><br>
                    Call us at : 9982185779,7791020444<br>
                    Email: <a href=mailto:dishashiva94@gmail.com>dishashiva94@gmail.com</a> </p>
                  </div></td>
              </tr>
              <tr>
                <td><h3><span class="glyphicon glyphicon-comment"></span>Feedback</h3>
                  <p><br>
                      <a href="FeedBackForm.jsp">Share your feedback</a>-Help us to serve you better</p></td>
              </tr>
            </table>		    <p>&nbsp;</p></td>
			<td><h3><span class="glyphicon glyphicon-map-marker"></span>On Map</h3><br><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3561.1840081995083!2d75.80884919999997!3d26.802269000000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x396dc98af6c5a9e3%3A0xce019da72077cc48!2sPratap+Plaza!5e0!3m2!1sen!2sin!4v1437979931413" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></td>	
		</tr>
		</table>
		<br><br>
		<div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">&COPY;2015 - HouseRent</p>
    </div>
  </div>
		
  </body>
</html>
<%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("Login.jsp");
 }
 %>

