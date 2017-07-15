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
<%@page import="java.util.Date"%>
<html lang="en">
<head>
  <title>House Rent</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="../js/gen_validatorv4.js" type="text/javascript"></script>
  <link href="../css/select2.min.css" rel="stylesheet" />
<script src="../js/select2.min.js"></script>

  
</head>
<% 
	String id="";
	for(int i=0;i<6;i++)
	{
		id+=(int)(Math.random()*9)+1;
	}
%>
<body>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!-- <a class="navbar-brand" href="../Home.jsp"><i class="fa fa-home"></i>  <span class="light">House</span> Rent</a> -->
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

<p>&nbsp;</p>
<%

	String username=""+session.getAttribute("username");
	String name="";
	Connection con=DBInfo.getConnection();
	String selectname="select name from registration where email=(select email from login where username=?)";
	PreparedStatement ps=con.prepareStatement(selectname);
	ps.setString(1, username);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
	name=rs.getString("name");
	}
	rs.close();
	ps.close();
	con.close();
	
 %>
<div id="container">    
<form id="myform" name="myform" role="form"  action="OwnerFormSubmit.jsp" method="post">
<table width="577" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td>
		  <fieldset>
		  <legend>Rent Out Your Room/House </legend>
		   <table width="553" border="0" align="center" cellpadding="0" cellspacing="1">
		  <tr>
			<div class="form-group">
			  <td> <label for="acc">Post ID:</label></td>
			  <td colspan="3"><input type="text" readonly  class="form-control" id="postid" name="postid" value="<%=id%>"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="house">House/Room Type: </label></td>
			  <td colspan="3"><select class="form-control select-housetype" id="htype" name="htype" autofocus="autofocus" >
			    <option value="Apartment">Apartment</option>
			    <option value="House">House</option>
			    <option value="House With Services">House With Services</option>
			    <option value="Separate Room">Separate Room</option>
			    </select></td>
			    <script>$(".select-housetype").select2({
					  placeholder: "Select Type",
					  allowClear: true
					});
					</script>
			</div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="name">Name:</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="name" name="name" value="<%= name %>" readonly></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="postedby">Posted By: </label></td>
			  <td colspan="3"><select class="form-control select-postedby" id="postedby" name="postedby" >
			    <option value="Owner">Owner</option>
			    <option value="Agent">Agent</option>
			    </select></td>
			    <script>$(".select-postedby").select2({
					  placeholder: "Agent/Owner",
					  allowClear: true
					});
					</script>
			</div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="acc">Accomodates:</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="accomodate" name="accomodate" placeholder="No. Of Persons" min="1" required="required"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="price">Price(Rs.):</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="price" name="price"  value="â¹" placeholder="Enter Price(Rs.)" min="0" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="houseno">House No.</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="address" name="houseno" placeholder="Enter House No." required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="street">Street</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="street" name="street" placeholder="Enter Street" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="city">City</label></td>
			  <td colspan="3"><input name="city" class="form-control" id="city" placeholder="Enter City" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="state">State</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="state" name="state" placeholder="Enter State" required="required"></td>
			  </div>
			</tr>
									
			<tr>
			<div class="form-group">
			  <td> <label for="from">Available From:</label></td>
			  <td colspan="3"><input type="date" name="fromdate" class="form-control" min="<%= new Date()%>" id="fromdate" required="required"></td>
			  </div>
			  </tr>
			   <tr>
			   <div class="form-group" >
			  <td width="184"> <label for="house">Amenities: </label></td>
			  <td colspan="3"><select class="form-control select-amenities" multiple="multiple" id="amenities" name="amenities" >
			    <option value="Furnished">Furnished</option>
			    <option value="Terrace/Balcony">Terrace/Balcony</option>
			    <option value="TV">TV</option>
			    <option value="WiFi">WiFi</option>
			    <option value="Garden">Garden</option>
			    <option value="Parking">Parking</option>
			    </select></td>
			  <script>$(".select-amenities").select2({
					  placeholder: "Select Amenities",
					  allowClear: true
					});
					</script>
			</div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="bed">No. Of Beds:</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="bed" name="bed" min="0" placeholder="Enter the number of beds(single) " required="required"></td>
			  </div>
			</tr>

			<tr>
			<div class="form-group">
			  <td> <label for="acc">No. Of Bathrooms:</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="bathrrom" name="bathroom" min="0" placeholder="Enter the number of bathrooms" required="required"></td>
			  </div>
			</tr>

			<tr>
			<div class="form-group">
			  <td> <label for="acc">Minimum Stay(months):</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="minstay" name="minstay" min="1" placeholder="Enter the minimum stay" required="required"></td>
			  </div>
			</tr>

			
			<tr>
			<div class="form-group">
			  <td colspan="2" align="center"> <label for="title"><h3>Description Of Add:</h3></label></td>
			  
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="price">Title:</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="title" name="title" placeholder="Enter Title" required="required"></td>
			  </div>
			</tr>
  
			   <tr>
			<div class="form-group">
			  <td> <label for="title">Description:</label></td>
			  <td colspan="3"><textarea name="description" class="form-control" id="description" placeholder="Enter the Description."></textarea></td>
			  </div>
			</tr>
			  <tr>
			<div class="form-group">
			  <td> <label for="captcha">Are you Human?</label></td>
			  </div>
			 </tr>
			 <tr>
			<div class="form-group">
			  <td> <img src="../captcha.jsp"/></td>
			  <td> <input type="text" class="form-control" id="cname" name="cname" placeholder="Type text from image"></td>
			  </div>
			</tr>
			
			<tr>
			
			  <td colspan="4"  ><center><button type="submit" class="btn btn-info btn-lg">Post Ad</button></center></td>
			  
		    </tr>
		  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<script type="text/javascript">
 var frmvalidator  = new Validator("myform");
frmvalidator.addValidation("htype","req","Please enter House/Room Type");

frmvalidator.addValidation("acc","req","Please enter Number of persons");
frmvalidator.addValidation("acc","numeric");

frmvalidator.addValidation("price","req","Please enter Price");
frmvalidator.addValidation("cname","req","Please enter Text from image");
frmvalidator.addValidation("price","numeric");

frmvalidator.addValidation("houseno","req","Please enter House NO.");
frmvalidator.addValidation("amenities","req","Please Select Amenities");
frmvalidator.addValidation("houseno","alphanumeric");

frmvalidator.addValidation("street","req","Please enter Street");
frmvalidator.addValidation("city","req","Please enter City");
frmvalidator.addValidation("state","req","Please enter State");
frmvalidator.addValidation("from","req","Please enter Availability");
frmvalidator.addValidation("title","req","Please enter Title");
frmvalidator.addValidation("description","req","Please enter house description");
</script>
</div>

<div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      
      <!-- <a href="#" class="navbar-btn btn-danger btn pull-right">
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
	response.sendRedirect("../Login.jsp");
 }
 



 %>
