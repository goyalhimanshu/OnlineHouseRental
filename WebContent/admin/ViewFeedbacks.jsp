<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	    <title>House Rent</title>
		  <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  </head>
<body>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Admin.jsp">House Rent</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="Admin.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
      	
      	<!-- <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Settings <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../UpdateAdminInfo.jsp">Update Your Info</a></li>
            <li><a href="../PostTable.jsp">Update Ad Info</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">How It Works</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-earphone"></span>Contact Us</a></li> -->
       
        <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<p>&nbsp;</p>
<div class="container">
<div align="center">
<table width="577" border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
  <td>
	<table class="table table-hover">
   
	
  	<thead>
    <tr>
      
      <th width="144"><div align="center">Username</div></th>
      <th width="144"><div align="center">Email</div></th>
      <th width="144"><div align="center">Feedback</div></th>
    </tr>
    </thead>
    <tbody>
	<%
		String postid="",username="",email="",feedback="";
		Connection con=DBInfo.getConnection();
		String query="select * from feedbackform;";
		PreparedStatement ps=con.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			 username=rs.getString("username");
			 email=rs.getString("email");
			 feedback=rs.getString("feedback");
			 
	%>
	<tr>
		
		<td align="center"><%=username %></td>
		<td align="center"><%=email %></td>
		<td align="center"><%=feedback %></td>
		<td align="center"><a href="ReplyCustomer.jsp?email=<%=email%>"class="btn btn-primary btn-md" data-toggle="tooltip" title="Reply To Customer"><span class="glyphicon glyphicon-envelope">&nbsp;Reply</a></td>
	</tr>
		<%
			}
		 %>
	 </tbody>
  </table>
  
  </td>
  </tr>
  </table>
</div>
</div>
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


