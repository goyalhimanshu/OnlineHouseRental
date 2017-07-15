<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>


<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <title>My JSP 'FeedBackForm.jsp' starting page</title>
    
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
</nav><br><br><br>
  
  
  
  <center><h1>Share Your feedback- Help us to serve you better</h1><br><br>
  <div id="container">    
<form role="feedbacksent" id="feedbacksent" action="FeedbackSent.jsp" method="post">
<table width="577" border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td>
		  <fieldset><legend>Feedback</legend><table width="553" border="0" align="center" cellpadding="1" cellspacing="1">
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="uname">Username:</label></td>
			  <td width="366"><input type="text" class="form-control"  id="username" name="username" placeholder="Enter Username" value="<%= session.getAttribute("username").toString() %>" readonly="readonly"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="uname">Email:</label></td>
			  <td width="366"><input type="email" class="form-control"  id="email" name="email" placeholder="Enter Email" required="required"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="feedback">Feedback:</label></td>
			  <td width="366">
			    <textarea class="form-control" placeholder="Share with us any information that might help us to respond to you request" name="feedback" id="feedback" cols="60" rows="6" required="required"></textarea>
		      </td>
		      </tr>
			</div>
			<tr>
			<div class="form-group">
				<td width="184"><button type="submit" class="btn btn-default btn-lg" id="searchhouse" >Submit</button></td>
			</tr>
</table>
</fieldset>
</td>
</tr>
</table>
</form>
<script  type="text/javascript">
 var frmvalidator = new Validator("myform");
 frmvalidator.addValidation("Email","maxlen=100");
 frmvalidator.addValidation("Email","req");
 frmvalidator.addValidation("Email","email");
 frmvalidator.addValidation("Feedback","req");
  </script>

</div>
</center>
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
<%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("Login.jsp");
 }
 %>

