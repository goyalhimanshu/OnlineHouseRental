<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>


<%@page import="com.sun.org.glassfish.gmbal.IncludeSubclass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.DBInfo"%>
<%@page import="java.sql.Connection"%>

<%
 		String postid=request.getParameter("postid");
		Connection con=DBInfo.getConnection();
		String select="select * from house where postid=?";
		PreparedStatement ps = con.prepareStatement(select);
		ps.setString(1,postid);
		ResultSet rs = ps.executeQuery();
		rs.absolute(1);
%><head>
	<link rel="stylesheet" type="text/css" href="engine1/style.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
	
	<style type="text/css">
	.pricetag{
    white-space:nowrap;
    position:relative;
    margin:0 5px 0 10px;
    displaY:inline-block;
    height:25px;
    border-radius: 0 5px 5px 0;
    padding: 0 25px 0 15px;
    background:#E8EDF0;
    border: 0 solid #C7D2D4;
    border-top-width:1px;
    border-bottom-width:1px;
    color:#999;
    line-height:23px;
}
.pricetag:after{
    position:absolute;
    right:0;
    margin:1px 7px;
    font-weight:bold;
    font-size:19px;
    content:"\00D7";
}
.pricetag:before{
    position:absolute;
    content:"\25CF";
    color:white;
    text-shadow: 0 0 1px #333;
    font-size:11px;
    line-height:0px;
    text-indent:12px;
    left:-15px;
    width: 1px;
    height:0px;
    border-right:14px solid #E8EDF0;
    border-top:  13px solid transparent;
    border-bottom:  13px solid transparent;
}
	
	
	</style>
</head>

<br>
<div align="center">
	<table width="625" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr>
            <td width="619" height="150">
 				 <div class="jumbotron">
				 <table width="694" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="692"><fieldset><legend>&nbsp;&nbsp;&nbsp;<%=rs.getString("title") %> <font align="right"><span class="pricetag">INR <%=rs.getString("price") %></span></font></legend>
        <table width="688" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="682" height="214">
            	<table width="679" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="118" "> <label for="name">Posted By:</label></td>
                        <td width="197" ><%= rs.getString("name").toUpperCase() %></td>
						<td width="85" ><label for="city">City:</label></td>
                        <td width="279"><%= rs.getString("city") %></td>
                    </tr>
                    <br>
                    <tr>
					    <td ><label for="owner">Agent/Owner:</label></td>
                        <td ><%= rs.getString("postedby") %></td>
                        <td ><label for="postdate">Posted on:</label></td>
                        <td><%= rs.getString("postdate") %></td>
                    </tr>
                    <br>
			    </table><br>
				<div id="wowslider-container1">
				<div class="ws_images">
				<ul>
			  <%	
					int count=0;
					PreparedStatement ps1 = con.prepareStatement("select * from houseimage where postid=?");
					ps1.setString(1,postid);
					ResultSet rs1 = ps1.executeQuery();
					int row=0;					
					while ( rs1.next()) 
					{
						row++;
	           %>
	                <li>
		                <a href="../servlet/DisplayPhotoServlet?postid=<%=postid %>&row=<%= row %>"><img src="../servlet/DisplayPhotoServlet?postid=<%=postid %>&row=<%= row %>"  id="wows1_<%= count%>"/>
	    	            </a>
	                </li>
	           <%
	                  count++;
	      			}
	      			rs1.beforeFirst();
	      		%>
      			  </ul>
	      		</div>
	      		<div class="ws_bullets">
	      		<div>
	      		<%
	      			row=0;
					while ( rs1.next()) 
					{
						row++;
				%>
					<a href="#"><span><img src="../servlet/DisplayPhotoServlet?postid=<%=postid %>&row=<%= row %>" height="120" width="120"/><%=row %></span></a>
					<%
					}						
		    	%>
				</div>
			</div>
		
		<div class="ws_shadow">
		</div>
	</div>	
<script type="text/javascript" src="engine1/wowslider.js"></script>
<script type="text/javascript" src="engine1/script.js"></script>
<br/><br/>
<table width="732" border="0">
  <tr>
    <td width="380" height="350" align="center"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="212" border="0" align="center" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th width="212"><h3>Details</h3></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td width="212" height="21"><label for="address">Address: <%= rs.getString("houseno")+","+rs.getString("street")+","+rs.getString("city")+","+rs.getString("state")%></label></td>
        </tr>
        <tr>
          <td width="212" height="21"><label for="address">Available From:<%= rs.getString("fromdate")%></label></td>
        </tr>
        <tr>
          <td width="212" height="21"><label for="minstay">Minimum Stay:<%= rs.getString("minstay")%></label></td>
        </tr>
        <tr>
          <td width="212" height="21"><label for="bed">No. Of Bedroom:<%= rs.getString("bed")%></label></td>
        </tr>
        <tr>
          <td width="212" height="21"><label for="bathroom">No. Of Bathroom<%= rs.getString("bathroom")%> </label></td>
        </tr>
        <tr>
          <td width="212" height="21"><label for="amenities">Amenities:<%= rs.getString("amenities")%> </label></td>
        </tr>
      </tbody>
    </table>
      <table width="212" border="0" align="center">
        <tr>
          <td width="206" height="65"><h3 align="center">Description:</h3></td>
        </tr>
        <tr>
          <td height="25"><div align="center"><%= rs.getString("description")%></div></td>
        </tr>
      </table>
      <h3 align="center">&nbsp;</h3>
      <p align="center">&nbsp;</p></td>
    <td width="342" align="center" valign="top"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <button type="submit" class="btn btn-success btn-md" onclick="popupUploadForm()" ><span class="glyphicon glyphicon-envelope"></span> Send Message</button>
       <p>&nbsp;</p>
       <p><a href="https://maps.google.com/?q=<%=rs.getString("houseno")+","+rs.getString("street")+","+rs.getString("city")+","+rs.getString("state") %>" target="_blank" class="btn btn-info btn-md"><span class="glyphicon glyphicon-envelope"></span>&nbsp;Show on map</a></p>
    <td>&nbsp;</td>
    <script>
    function popupUploadForm(){
        var newWindow = window.open('ContactOwner.jsp?postid=<%= postid%>', 'name', 'height=500,width=600');
    }
  </script>
  <td>&nbsp;</td>
  </tr>
</table>
            
<%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("../Login.jsp");
 }
 



 %>
            