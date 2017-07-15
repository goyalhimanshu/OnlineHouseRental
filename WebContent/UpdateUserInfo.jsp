
<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="p1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<html lang="en">
<head>
  <title>House Rent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   <script src="js/gen_validatorv4.js" type="text/javascript"></script>
   
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
<p>&nbsp;</p>
<% 
	String name="",email="",dob="",address="",contact="",occupation="",sex="",password="";
	String username=(String)session.getAttribute("username");
	Connection con=DBInfo.getConnection();
	String query="select * from registration where email=(select email from login where username=?)";
	String passquery="select password from login where username=?";
	PreparedStatement ps=con.prepareStatement(query);
	PreparedStatement ps1=con.prepareStatement(passquery);
	ps.setString(1,username);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		 name=rs.getString("name");
		 email=rs.getString("email");
		 dob=rs.getString("dob");
		 address=rs.getString("address");
		 contact=rs.getString("contact");
		 occupation=rs.getString("occupation");
	}
	ps1.setString(1, username);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		password=rs1.getString("password");	
	}
	ps.close();
	ps1.close();
%>


<div id="container">    
<form role="form" id="myform" action="UserInfoUpdated.jsp" method="post">
<table width="577" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td>
		  <fieldset><legend>Update Information</legend><table width="553" border="0" align="center" cellpadding="0" cellspacing="1">
		  <div class="form-group">
			  <td> <label for="name">Name:</label></td>
			  <td> <input type="text" class="form-control" id="name" name="name" required="required" placeholder="Name" value="<%=name%>"></td>
			  </div>
			</tr>
			<div class="form-group">
			  <td> <label for="email">Email:</label></td>
			  <td> <input type="text" class="form-control" id="email" required="required" name="email" placeholder="Email" value="<%=email %>" readonly></td>
			  </div>
			</tr>
			<div class="form-group">
			  <td> <label for="dob">Date Of Birth:</label></td>
			  <td> <input type="date" class="form-control" id="dob"  required="required" name="dob" value="<%=dob%>"></div></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="occupation">Occupation:</label></td>
			  <td width="366"><input type="text" class="form-control" name="occupation" required="required" id="occupation" placeholder="Occupation" value="<%=occupation%>"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="uname">Username:</label></td>
			  <td width="366"><input type="text" class="form-control" id="username" required="required" name="username" placeholder="Username" value="<%= username %>" readonly></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="pwd">Password:</label></td>
			  <td> <input type="password" class="form-control" required="required" id="password" name="password" placeholder="Password(min 8 characters)" value="<%=password %>"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="address">Address:</label></td>
			  <td> <textarea class="form-control" rows="5" id="address" required="required" name="address" placeholder="Address"><%=address%></textarea></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="mobile">Contact No:</label></td>
			  <td> <input type="tel" class="form-control" id="contact" name="contact" required="required" placeholder="Mobile" value="<%=contact %>"></td>
			  </div>
			</tr>
			
		    <tr>
		    <div class="form-group">
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </div>
			</tr>
			
		    <tr>
			  <td colspan="2"><center><button type="submit" class="btn btn-default btn-lg">Update</button></center></td>
		    </tr>
		  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form><br><br><br>


<script  type="text/javascript">
 var frmvalidator = new Validator("myform");
 frmvalidator.addValidation("username","req","Please enter your username");
 frmvalidator.addValidation("password","req","Please enter your password");
 
 frmvalidator.addValidation("name","req","Please enter your name");
 frmvalidator.addValidation("email","req","Please enter your email");
 frmvalidator.addValidation("address","req","Please enter your address");
 frmvalidator.addValidation("dob","req","Please enter your Date of Birth");
 frmvalidator.addValidation("contact","req","Please enter your Contact No");
 frmvalidator.addValidation("occupation","req","Please enter your Occupation");
 frmvalidator.addValidation("sex","req","Please enter your sex");
 
 
 
 frmvalidator.addValidation("password","minlen=8","Password should be minimum of 8 characters");
 
 frmvalidator.addValidation("email","email");
 
 frmvalidator.addValidation("contact","maxlen=50");
 frmvalidator.addValidation("contact","numeric");
 

 </script>



</div>
<div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      
    <!--   <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a>
 -->    </div>
    
    
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