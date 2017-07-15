
<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>
<!DOCTYPE html>
<html lang="en">

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.DBInfo"%>
<html>
<%@page import="java.sql.Connection"%>
<head>
<title>Search House</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var keys=document.dummy.city.value

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
 
removeall();
 
  if (xmlhttp.readyState==4)
    {
            z=0;
            var roott=xmlhttp.responseXML.documentElement;
            var ress=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
 
            while(ress!=null)
            {
                    addoptions(ress)
                    z++
             var ress=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
            }
    }
 
    function removeall()
    {
 
        var ct=document.dummy.area.length;
        for(i=ct; i>=0; i--)    {    
            document.dummy.area.options[i]=null;
             }
    }
 
    function addoptions(reslt)
    {
 
        var ct1=document.createElement("OPTION");
        ct1.text=reslt;
        ct1.value=reslt;
        document.dummy.area.options.add(ct1);
 
    }
}    
 
xmlhttp.open("GET","db_fetch.jsp?ok="+keys,true);
xmlhttp.send();
}
</script>
</head>
<body>
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
      	<li><a href="SearchHouse.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>
      	<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Settings <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../UpdateUserInfo.jsp">Update Your Info</a></li>
            <!-- <li><a href="PostTable.jsp">Update Ad Info</a></li> -->
          </ul>
        </li>
        <li><a href="../ContactUs.jsp"><span class="glyphicon glyphicon-envelope"></span>Contact Us</a></li>
        <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div id="container">   
<br><br><br><br><br> 
<form name="dummy" action="ShowAllPost.jsp">
<font face="verdana" size="2">
<table width="577" border="0" align="center" cellpadding="0" cellspacing="1">

    <tr>
      <td>
		  <fieldset>
		  <legend>Search Place </legend>
		   <table width="553" border="0" align="center" cellpadding="0" cellspacing="1">
		  <tr>
			<div class="form-group">

 			<td> <label for="city">City:</label></td><td><select required class="form-control" name="city" onchange="loadXMLDoc()">
            <option>select</option>
            
            <%
            Connection con1=DBInfo.getConnection();
            //String select="";
            PreparedStatement ps1=con1.prepareStatement("select distinct city from house");
           	ResultSet rs1=ps1.executeQuery();
            while(rs1.next())
            {
             %>
            <option value="<%=rs1.getString("city") %>"><%=rs1.getString("city") %></option>
            <%
           		} 
             %>
             
            
    </select></td>
    </div></tr>
 
<tr>
			<div class="form-group">

 			<td> <label for="area">Area:</label></td><td><select required class="form-control" name="area">
            <option></option>
    </select></td></div></tr>
     <td height="24"><div align="center">
			    <button type="submit" class="btn btn-default" id="search">Search </button>
		      </div>
		      </td>
    </table>
    </fieldset></td>
    </tr>
    </table></font>
 
</form>
</div>
 <div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2014 - Site Built By Mr. M.
           <a href="http://tinyurl.com/tbvalid" target="_blank" >HTML 5 Validation</a>
      </p>
      
      <a href="http://youtu.be/zJahlKPCL9g" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a>
    </div>
    
    
  </div>
  <div class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2015 - HouseRent
          
      </p>
      
      <!-- <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe on YouTube</a>
  -->   </div>
    
    
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
