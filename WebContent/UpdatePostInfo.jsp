

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
   <script src="js/select2.min.js"></script>
   <link href="css/select2.min.css" rel="stylesheet" />
   
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
	String housetype="",price="", houseno="", street="",city="", state="", fromdate="",postdate="",title="",description="";
	int person=0,minstay=0,bed=0,bathroom=0;
	String postid=request.getParameter("postid");
	Connection con=DBInfo.getConnection();
	String query="select * from house where postid=?";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1,postid);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		 housetype=rs.getString("housetype");
		 person=rs.getInt("person");
		 price=rs.getString("price");
		 houseno=rs.getString("houseno");
		 street=rs.getString("street");
		 city=rs.getString("city");
		 state=rs.getString("state");
		 fromdate=rs.getString("fromdate");
		 minstay=rs.getInt("minstay");
		 bed=rs.getInt("bed");
		 bathroom=rs.getInt("bathroom");
		 postdate=rs.getString("postdate");
		 title=rs.getString("title");
		 description=rs.getString("description");
	}
	ps.close();
%>
<div id="container">    
<form id="form" role="form" action="PostInfoUpdated.jsp" method="post">
<table width="577" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td>
		  <fieldset>
		  <legend>Update Post Information </legend>
		  <table width="553" border="0" align="center" cellpadding="0" cellspacing="1">
		  <tr>
			<div class="form-group">
			  <td> <label for="acc">Post ID:</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="postid" required="required" name="postid" value="<%=postid%>" readonly></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group" >
			  <td width="184"> <label for="house">House/Room Type: </label></td>
			  <td colspan="3"><select class="form-control select-housetype" id="htype" required="required" name="htype" >
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
			  <td> <label for="acc">Accommodates:</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="person" required="required" name="person" placeholder="No. Of Persons" value="<%=person%>" min="1" required="required"></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="price">Price:</label></td>
			  <td colspan="3"><input type="number" class="form-control" id="price" required="required" name="price" placeholder="Enter Price" value="<%=price %>"min="0" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="houseno">House No.</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="houseno" required="required" name="houseno" placeholder="Enter House No." value="<%=houseno%>" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="street">Street</label></td>
			  <td colspan="3"><input type="text" class="form-control" req id="street" required="required" name="street" placeholder="Enter Street" value="<%=street%>"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="city">City</label></td>
			  <td colspan="3"><input name="city" class="form-control" id="city"  required="required" placeholder="Enter City" value="<%=city%>" required="required"></td>
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="state">State</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="state" required="required" name="state" placeholder="Enter State" value="<%=state %>"required="required"></td>
			  </div>
			</tr>
									
			<tr>
			<div class="form-group">
			  <td> <label for="from">Available From:</label></td>
			  <td colspan="3"><input type="date" class="form-control" id="fromdate" required="required" name="fromdate" value="<%=fromdate%>" required="required"></td>
			  </div>
			</tr>
			   
			   <tr>
			   <div class="form-group" >
			  <td width="184"> <label for="house">Amenities: </label></td>
			  <td colspan="3"><select class="form-control select-amenities" multiple="multiple" required="required" id="amenities" name="amenities" >
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
			  <td colspan="3"><input type="number" class="form-control" id="bed" required="required" name="bed" placeholder="Enter the number of beds(single)" value="<%=bed%>" required="required"></td>
			  </div>
			</tr>

			<tr>
			<div class="form-group">
			  <td> <label for="bath">No. Of Bathrooms:</label></td>
			  <td colspan="3"><input type="number" min="0"class="form-control" required="required" id="bathroom" name="bathroom" placeholder="Enter the number of bathrooms" value="<%=bathroom%>" required="required"></td>
			  </div>
			</tr>

			<tr>
			<div class="form-group">
			  <td> <label for="minstay">Minimum Stay:</label></td>
			  <td colspan="3"><input type="number" class="form-control" required="required" min="0" id="minstay" name="minstay" placeholder="Enter the minimum stay(In Months)"value="<%=minstay%>" required="required"></td>
			  </div>
			</tr>

			
			<tr>
			<div class="form-group">
			  <td colspan="2" align="center"> <label for="title"><h3>Description Of Add:</h3></label></td>
			  
			  </div>
			</tr>
			
			<tr>
			<div class="form-group">
			  <td> <label for="title">Title:</label></td>
			  <td colspan="3"><input type="text" class="form-control" id="title" required="required" name="title" placeholder="Enter Title" value="<%=title %>" required="required"></td>
			  </div>
			</tr>
  
			   <tr>
			<div class="form-group">
			  <td> <label for="desc">Description:</label></td>
			  <td colspan="3"><textarea name="description" class="form-control" required="required" id="description" placeholder="Enter the Description." required="required"><%=description %></textarea></td>
			  </div>
			</tr>
			  
			<tr>
			  <td colspan="2"><center><button type="submit" class="btn btn-info btn-lg">Update</button></center></td>
		    </tr>
		  </table>
		  </fieldset>
	 </td>
    </tr>
</table>
</form>
</div><br><br><br><br><br>
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
	response.sendRedirect("Login.jsp");
 }
 



 %>