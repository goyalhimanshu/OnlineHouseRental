<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<!DOCTYPE html>
<%@ page language="java" %>
<html lang="en">
<head>
  <title>Login</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
      <a class="navbar-brand" href="../Home.jsp"><img alt="HouseRent" src="../images/logo.png" width="140" height="35"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="../Home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
      	<li><a href="../tenant/SearchHouse.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>
      	<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Settings <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../UpdateUserInfo.jsp">Update Your Info</a></li>
            <li><a href="../PostTable.jsp">Update Ad Info</a></li>
          </ul>
        </li>
        <li><a href="../ContactUs.jsp"><span class="glyphicon glyphicon-envelope"></span>Contact Us</a></li>
        <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<br><br><br>

<%
	String id=request.getParameter("id");
 %>
<p>&nbsp;</p>

<div id="container">    
<form role="form" id="myform" enctype="multipart/form-data" action="../servlet/PhotoUpload" method="post">
<table width="577" border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td>
		  <fieldset><legend>Add Photo</legend><table width="553" border="0" align="center" cellpadding="1" cellspacing="1" readonly>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="postid">Post ID:</label></td>
			  <td width="366"><input type="text" class="form-control"  id="postid" name="postid" value="<%= id%>" readonly="readonly"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="image">Select Image:</label></td>
			  <td> <input type="file" class="form-control" id="photo" placeholder="Select Image" name="photo" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			  <td colspan="2"><button type="submit" class="btn btn-default">Submit</button></td>
		    </tr>
		  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form>



</div>
<div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      
     <!--  <a href="#" class="navbar-btn btn-danger btn pull-right">
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
	response.sendRedirect("../Login.jsp");
 }
 



 %>
 
