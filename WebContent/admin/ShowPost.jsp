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
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
		
<div class="container">
<div align="center">
<table width="577" border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
  <td>
	<table class="table table-hover">
   
	
  	<thead>
    <tr>
      <th width="146"><div align="center">Post ID </div></th>
      <th width="144"><div align="center">Username</div></th>
      <th width="144"><div align="center">Email</div></th>
      <th width="144"><div align="center">Title</div></th>
      <th width="144"><div align="center">PostDate</div></th>
    </tr>
    </thead>
    <tbody>
	<%
		String postid="",title="",username="",email="",postdate="";
		Connection con=DBInfo.getConnection();
		String query="select username,postid,title,postdate from house;";
		PreparedStatement ps=con.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			 postid=rs.getString("postid");
			 title=rs.getString("title");
			 postdate=rs.getString("postdate");
			 username=rs.getString("username");
			 String emailquery="select email from login where username=?";
			 PreparedStatement ps1=con.prepareStatement(emailquery);
			 ps1.setString(1, username);
			 ResultSet rs1=ps1.executeQuery();
			 while(rs1.next())
			 {
			 	email=rs1.getString("email");
		 	 }
	%>
	<tr>
		<td align="center"><%=postid%></td>
		<td align="center"><%=username %></td>
		<td align="center"><%=email %></td>
		<td align="center"><%=title %></td>
		<td align="center"><%=postdate %></td>
		<td align="center"><a href="../DeletePost.jsp?id=<%= postid%>" class="btn btn-danger btn-md" data-toggle="tooltip" title="Delete your post"><span class="glyphicon glyphicon-remove">&nbsp;Delete</a></td>
	</tr>
	<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>
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