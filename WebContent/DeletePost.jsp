<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="p1.DBInfo"%>

<jsp:useBean id="obj" class="p1.DeletePostInfoBean">
<jsp:setProperty property="*" name="obj"/>
</jsp:useBean>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>House Rent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   <script src="js/gen_validatorv4.js" type="text/javascript"></script>

</head>

<%
	String postid=request.getParameter("postid");
	int i=obj.deletePost(postid);
 %>y
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
</nav><br/><br/><br/>
<p>&nbsp;</p>


<body>

<div class="container">
<center>
<h2 class="text-success"><span class="glyphicon glyphicon-ok"></span>Post is deleted.</h2>
				<%
					String usertype="";
					String username=session.getAttribute("username").toString();
					Connection con=DBInfo.getConnection();
					String query="select usertype from login where username=?";
					PreparedStatement ps=con.prepareStatement(query);
					ps.setString(1, username);
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
						usertype=rs.getString("usertype");
						break;
					}
					if(usertype.equalsIgnoreCase("admin"))
					{
				 %>
						<br><a href="Admin.jsp" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>Home</a>
				<%
				}
				
					if(usertype.equalsIgnoreCase("viewer"))
					{
				 %>
				 		<br><a href="Home.jsp" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>Home</a>
				 <%
				 } %>
</center>
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
