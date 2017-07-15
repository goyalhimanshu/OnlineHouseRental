<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="p1.DBInfo"%>

<%-- <jsp:useBean id="obj" class="p1.DeleteAdvertiserBean">
<jsp:setProperty property="*" name="obj"/>
</jsp:useBean> --%>


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
	String username=request.getParameter("username");
	//int i=obj.deleteAdvertiser(username);
 %>
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
<center>




<%
	
	Connection con=DBInfo.getConnection();
	String query01="select postid from house where username=?";
	PreparedStatement ps01=con.prepareStatement(query01);
	ps01.setString(1, username);
	ResultSet rs0=ps01.executeQuery();
	while(rs0.next())
	{
		
		String query02="delete from houseimage where postid=?";
		PreparedStatement ps02=con.prepareStatement(query02);
		ps02.setString(1, rs0.getString("postid"));
		ps02.executeUpdate();
	}
	
	
	String query1="delete from house where username=?";
	PreparedStatement ps1=con.prepareStatement(query1);
	ps1.setString(1, username);
	ps1.executeUpdate();
	
	
	String query21="select email from login where username=?";
	PreparedStatement ps21=con.prepareStatement(query21);
	ps21.setString(1, username);
	ResultSet rs2=ps21.executeQuery();
	while(rs2.next())
	{
		
		String query22="delete from registration where email=?";
		PreparedStatement ps22=con.prepareStatement(query22);
		ps22.setString(1, rs2.getString("email"));
		ps22.executeUpdate();
	}
	
	

	String query3="delete from login where username=?";
	PreparedStatement ps3=con.prepareStatement(query3);
	ps3.setString(1, username);
	ps3.executeUpdate();



 %>
<h2 class="text-success"><span class="glyphicon glyphicon-ok"></span>Advertiser is deleted.</h2>
<br><a href="Admin.jsp" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>Home</a>
				
<center>
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

