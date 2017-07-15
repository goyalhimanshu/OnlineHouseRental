<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
  <title>House Rent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
<br><br><br>


<body>
<div class="container">
<div align="center">
<table><tr>
<td>
<fieldset><legend>Posts</legend>
  <table class="table table-hover">
  <thead>
    <tr>
      <th width="146"><div align="center">Post ID </div></th>
      <th width="144"><div align="center">Title</div></th>
    </tr>
    </thead>
	<%
		String postid="",title="";
		String username=(String)session.getAttribute("username"); 
		Connection con=DBInfo.getConnection();
		String query="select postid,title from house where username=?";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,username);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			 postid=rs.getString("postid");
			 title=rs.getString("title");
	%>
	<tr>
		<td align="center"><%=postid%></td>
		<td align="center"><%=title %></td>
		<td align="center"><a href="UpdatePostInfo.jsp?postid=<%= postid %>" class="btn btn-info" role="button" data-toggle="tooltip" title="Update"><span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;Update</a></td>
		<td align="center"><a href="DeletePost.jsp?postid=<%= postid %>" class="btn btn-danger" role="button" data-toggle="tooltip" title="Delete"><span class="glyphicon glyphicon-remove"></span>&nbsp;Delete</a></td>
	</tr>
	<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>
	<%
		}
	 %>
  </table>
  </fieldset>
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
