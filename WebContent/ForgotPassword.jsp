<!DOCTYPE html>
<html lang="en">
<head>
  <title>Forgot Password</title>
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
      
      <a class="navbar-brand" href="index.jsp"><img alt="HouseRent" src="images/logo.png" width="140" height="35"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
      	<li><a href="Registration.jsp"><span class="glyphicon glyphicon-user"></span> SignUp</a></li>
      	<li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li><a href="ContactUs.jsp"><span class="glyphicon glyphicon-envelope"></span>Contact Us</a></li>
      </ul>
    </div>
  </div>
</nav>
<p>&nbsp;</p>



	
  
  <body>
    
    <div id="container">   
    <br><br> 
	<form role="form" id="myform" action="servlet/ForgotPassMail" method="post">
	<table width="577" border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td>
		  <fieldset><legend>Forgot Password?</legend><table width="553" border="0" align="center" cellpadding="1" cellspacing="1">
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="uname">Enter your registered email:</label></td>
			  <td width="366"><input type="email" class="form-control"  id="email" name="email" placeholder="Enter Email" required></td>
			  </div>
			</tr>
			<tr>
			  <td colspan="2"><center><button type="submit" class="btn btn-default">Send Password</button></center></td>
		    </tr>
		  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form>


<script  type="text/javascript">
 var frmvalidator = new Validator("myform");
 
 
 frmvalidator.addValidation("emaill","maxlen=50");
 frmvalidator.addValidation("email","req");
 frmvalidator.addValidation("email","email");
 
 </script>

</div>
    
    <div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      <!-- 
      <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a>
  -->   </div>
    
    
  </div>
  </body>
</html>
