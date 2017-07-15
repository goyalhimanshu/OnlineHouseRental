<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contact Owner Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   <script src="js/gen_validatorv4.js" type="text/javascript"></script>
   
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
      <a class="navbar-brand" href="../Home.jsp">House Rent</a>
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
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">How It Works</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-earphone"></span>Contact Us</a></li>
        <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav><br><br><br>
<%
String postid=request.getParameter("postid");

 %>


<p>&nbsp;</p>

<div id="container">    
<form role="form" name="myform" id="myform" action="../servlet/SendContactEmail" method="post">
<table width="577" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td>
		  <fieldset><legend>Contact Owner/Agent</legend><table width="553" border="0" align="center" cellpadding="0" cellspacing="1">
		  <center> <h4>For PostID:<%=postid %></h4></center>
		  <div class="form-group">
			              <label for="email"><span class="glyphicon glyphicon-user"></span> Email</label>
			              <input type="email" class="form-control" id="email" name="email" placeholder="Email" required="required">
			            </div>
			            <div class="form-group">
			              <label for="name"><span class="glyphicon glyphicon-eye-open"></span> Name</label>
			              <input type="text" class="form-control" id="name" name="name" placeholder="Name" required="required">
			            </div>
			            <div class="form-group">
			              <label for="mobile"><span class="glyphicon glyphicon-mobile"></span> Mobile</label>
			              <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile No." required="required">
			            </div>
			            <div class="form-group">
			              <label for="msg"><span class="glyphicon glyphicon-list-alt"></span> Message</label>
			              <textarea name="msg" class="form-control" id="msg" placeholder="Message..." required="required"></textarea>
			            </div>
			            <input type="hidden" name="postid" value="<%= postid%>">
			              <button type="submit" class="btn btn-success btn-block" ><span class="glyphicon glyphicon-envelope"></span> Send Message</button>
			 	  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form>


<script  type="text/javascript">
 var frmvalidator = new Validator("myform");
 
 frmvalidator.addValidation("name","req","Please enter your name");
 frmvalidator.addValidation("email","req","Please enter your email");
 frmvalidator.addValidation("contact","req","Please enter your Contact No");
 
 
 frmvalidator.addValidation("email","email");
 
 frmvalidator.addValidation("contact","maxlen=50");
 frmvalidator.addValidation("contact","numeric");
 

 </script>



</div><br><br>
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
