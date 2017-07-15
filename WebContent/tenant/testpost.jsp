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
	%>
<head>
 
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
</head>

<div align="center">
  <table width="625" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr>
            <td width="619" height="324">
  <div class="jumbotron">
  <table width="694" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="692"><fieldset><legend><%=rs.getString("title") %></legend>
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
 <table width="679" align="center">
   <tr>
       <td width="109" height="21"><label for="location">Location:</label></td>
       <td width="147"><%= rs.getString("street") %></td>
       <td width="144" ><label for="htype">House Type: </label></td>
       <td width="259"><%= rs.getString("housetype") %></td>
   </tr>
   <tr>
       <td height="21"><label for="fromdate">Available From:</label></td>
       <td height="21" colspan="3"><%= rs.getString("fromdate") %></td>
  </tr>
  <tr>
  <td>
  	<button type="submit" class="btn btn-success btn-md" onclick="popupUploadForm()" ><span class="glyphicon glyphicon-envelope"></span> Send Message</button>
  </td>
  <script>
    function popupUploadForm(){
        var newWindow = window.open('ContactOwner.jsp?postid=<%= postid%>', 'name', 'height=500,width=600');
    }
  </script>
  <td>
  	<a href="https://maps.google.com/?q=<%=rs.getString("houseno")+","+rs.getString("street")+","+rs.getString("city")+","+rs.getString("state") %>" target="_blank" class="btn btn-info btn-md"><span class="glyphicon glyphicon-envelope">&nbsp;Show on map</a>
  </td>
  </tr>
  
  
  
 
   <%
      con.close();
   %>
   
 </table>
				    
			          <p>&nbsp;</p>
	            </td>
          </tr>
        </table> 
		</fieldset>
	  </td>
    </tr>
  </table>
</div>
</td></tr></table></div>



<%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("../Login.jsp");
 }
 



 %>

