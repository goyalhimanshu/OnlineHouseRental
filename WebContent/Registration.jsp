<!DOCTYPE html>
<html lang="en">
<head>
  <title>House Rent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   <script src="js/gen_validatorv4.js" type="text/javascript"></script>
   
   <script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var uname=document.getElementById("username").value;
var urls="checkunameemail.jsp?ver="+uname; 
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        //document.getElementById("err").style.color="red";
        document.getElementById("err").innerHTML=xmlhttp.responseText;
 
    }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
   
   
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
<br>
<br>
<div id="container">    
<form role="form" id="myform" action="RegistrationDone1.jsp" method="post">
<table width="577" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td>
		  <fieldset><legend>Registration</legend><table width="553" border="0" align="center" cellpadding="0" cellspacing="1">
		  <div class="form-group">
			  <td> <label for="name">Name:</label></td>
			  <td> <input type="text" class="form-control" id="name" name="name" placeholder="Name"></td>
			  </div>
			</tr>
			<div class="form-group">
			  <td> <label for="email">Email:</label></td>
			  <td> <input type="email" class="form-control" id="email" name="email" placeholder="Email"></td>
			  </div>
			</tr>
			<div class="form-group">
			  <td> <label for="dob">Date Of Birth:</label></td>
			  <td> <input type="date" class="form-control" id="dob"  name="dob"></div></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="occupation">Occupation:</label></td>
			  <td width="366"><input type="text" class="form-control" name="occupation" id="occupation" placeholder="Occupation"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="occupation">Sex:</label></td>
			  <td width="366"><div class="radio"><label><input type="radio" name="sex" value="f">Female</label>&nbsp;&nbsp;<label><input type="radio" name="sex" value="m">Male</label></div></td>
			  </div>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="uname">Username:</label></td>
			  <td width="366"><input type="text" class="form-control" id="username" onkeyup="loadXMLDoc()" name="username" placeholder="Username"></td><td width="200"><span id="err"> </span></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="address">Address:</label></td>
			  <td> <textarea class="form-control" rows="5" id="address" name="address" placeholder="Address"></textarea></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="mobile">Contact No:</label></td>
			  <td> <input type="tel" class="form-control" id="contact" name="contact" placeholder="Mobile"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="captcha">Are you Human?</label></td>
			  </div>
			 </tr>
			 <tr>
			<div class="form-group">
			  <td> <img src="captcha.jsp"/></td>
			  <td> <input type="text" class="form-control" id="cname" name="cname" placeholder="Type text from image"></td>
			  </div>
			</tr>
			 
		    <tr>
			  <td colspan="2"><center><button type="submit" class="btn btn-default btn-lg">Register</button></center></td>
		    </tr>
		  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form>


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
<p>&nbsp;</p>
<p>&nbsp;</p> 
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
<div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      
    <!--   <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a>
     -->
    </div>
    
    
  </div>
</html>