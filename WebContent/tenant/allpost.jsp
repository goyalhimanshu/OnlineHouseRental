<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>

 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.DBInfo"%>
<%@page import="java.sql.Connection"%>


<style type="text/css">
<!--
body {
	margin-left: 0pt;
	margin-top: 0pt;
	margin-right: 0pt;
	margin-bottom: 0pt;
}
-->
</style>
 <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  
  .report-modal-header,{
      background-color: #ff0000;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  
  
  .tooltip-wrapper {
    display: inline-block;
}
  
  
  </style>

<%

	 String city=request.getParameter("city");
 	 String location=request.getParameter("area");
		String loginemail="";
		//session.setAttribute("city", city);
		//session.setAttribute("area",location);;
		
		Connection con=DBInfo.getConnection();
		String selectloginemail="select email from login where username=?";
		PreparedStatement ps1=con.prepareStatement(selectloginemail);
		ps1.setString(1, session.getAttribute("username").toString());
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{
			loginemail=rs1.getString("email");
			
		}	
		System.out.println("loginemail"+loginemail);	
		
		String select="select * from house where city=? and street=?";
		PreparedStatement ps=con.prepareStatement(select);
		ps.setString(1, city);
		ps.setString(2, location);
		ResultSet rs=ps.executeQuery();
		int count=0;
		while(rs.next())
		{		
			count++;
		 %>
		 <br>
		   <table width="625" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr>
            <td width="619" height="324">
		 <div class="jumbotron">
 	  			<input type="hidden" name="postid" value=<%=rs.getString("postid") %>>
  <table width="609" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr>
            <td width="581" height="277">
      <fieldset><legend><a href="ShowPost.jsp?postid=<%=rs.getString("postid") %>"><%=rs.getString("title") %></a></legend><table width="577" height="210" border="0" align="center" cellpadding="1" cellspacing="1">
			<tr>
			<div class="form-group" >
			  <td width="88"> <label for="uname">City:</label></td>
			  <td width="279"><%=rs.getString("city")%></td>
			  <td width="228" rowspan="4"> <div align="center"><img src="../servlet/DisplayPhotoServlet?postid=<%= rs.getString("postid") %>&row=1" width="250" height="200" "></a></div></td>
			</div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="pwd">Locality:</label></td>
			  <td><%=rs.getString("street")%></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td> <label for="fromdate">Available From:</label></td>
			  <td><%=rs.getString("fromdate")%></td>
			  </div>
			</tr>
			<tr>
			<div class="form-group">
			  <td height="22"> <label for="details">Details:</label></td>
			  <td><%=rs.getString("description")%></td>
			  </div>
			</tr>
			 
			<tr>
			
			  <td height="24"><div align="center">
			    <button type="submit" class="btn btn-default" id="contact<%= count%>">Contact </button>
		      </div>
		      </td>
		      <%
		      	String reportemail="";
		      	int flag=0;
		      	System.out.println("postid"+rs.getString("postid"));
		      	
		      	String selectreportemail="select * from report where reporteremail=? and postid=?";
		      	PreparedStatement ps2=con.prepareStatement(selectreportemail);
		      	ps2.setString(1, loginemail);
		      	ps2.setString(2, rs.getString("postid"));
		      	ResultSet rs2=ps2.executeQuery();
		      	while(rs2.next())
		      	{
		      		System.out.println("reporteremail"+rs2.getString("reporteremail"));
		      		flag=1;
		      		break;
		      	
		      	}
		      
		      
		      
		      
		      if(flag==1)
		      {
		           
		      %>
			  <td height="24">&nbsp;</td>
			  
			  <td>
			  <div class="tooltip-wrapper" data-title="Already Reported!">
			  <button   class="btn btn-danger" role="button" id="report<%=count%> %>" disabled ><span class="glyphicon glyphicon-remove"></span>&nbsp;Report</button>
			  </div>
			  </td>
			  <%
			  	}
			   else
			   {
			   	%>
			   		 <td height="24">&nbsp;</td>
			  		 <td><button type="submit"  class="btn btn-danger" role="button" id="report<%=count%>"><span class="glyphicon glyphicon-remove"></span>&nbsp;Report</button></td>
			  <%
			  	}
			   %>
		    </tr>
		    <script>
$(function() {
    $('.tooltip-wrapper').tooltip({position: "bottom"});
});
</script>
		    
		  </table>
</fieldset>
		</td>
          </tr>
</table>


<!-- Modal --contact start-->
			  <div class="modal fade" id="myModalContact<%= count%>" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header" style="padding:35px 50px;">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <center><h4><span class="glyphicon glyphicon-envelope"></span> Contact</h4><br/>For PostID:<%= rs.getString("postid")%></center>
			        </div>
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form" id="form" action="../servlet/SendContactEmail" method="post">
			            <div class="form-group">
			            
			              <label for="email"><span class="glyphicon glyphicon-user"></span> Email</label>
			              <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required="required">
			            </div>
			            <div class="form-group">
			              <label for="name"><span class="glyphicon glyphicon-eye-open"></span> Name</label>
			              <input type="text" class="form-control" id="name" name="name" placeholder="Name" required="required">
			            </div>
			            <div class="form-group">
			              <label for="mobile"><span class="glyphicon glyphicon-mobile"></span> Mobile</label>
			             <input type="number" pattern=".{10,10}" class="form-control" id="mobile" name="mobile" placeholder="Mobile No." required="required">
			            </div>
			            <div class="form-group">
			              <label for="msg"><span class="glyphicon glyphicon-list-alt"></span> Message</label>
			              <textarea name="msg" class="form-control" id="msg" placeholder="Message..." required="required"></textarea>
			            </div>
			            <input type="hidden" name="postid" value="<%= rs.getString("postid")%>">
			              <button type="submit" class="btn btn-success btn-block" ><span class="glyphicon glyphicon-envelope"></span> Send Message</button>
			          </form>
			        </div>
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
			        </div>
			      </div>
			      </div>
			  </div> 
			</div>
			<script>
			$(document).ready(function(){
			    $("#contact<%= count%>").click(function(){
			        $("#myModalContact<%=count%>").modal();
			    });
			});
			</script>
<!-- Modal --contact ends-->




<!-- Modal --Report Starts-->
			  <div class="modal fade" id="myModalReport<%=count%>" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="report-modal-header" style="padding:35px 50px;">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <center><h4><span class="glyphicon glyphicon-remove"></span> Report</h4><br/>For PostID:<%= rs.getString("postid")%></center>
			        </div>
			        
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form" id="reportform" action="../servlet/SendReportEmail" method="post">
			            <div class="form-group">
			              <label for="email"><span class="glyphicon glyphicon-user"></span> Email</label>
			              <input type="email" class="form-control" id="email" name="email" value=<%= loginemail %> readonly="readonly" required="required">
			            </div>
			            
			            <div class="form-group">
			              <label for="reason"><span class="glyphicon glyphicon-list-alt"></span> Reason of Report</label>
			              <textarea name="reason" class="form-control" id="reason" placeholder="Reason..." required="required"></textarea>
			            </div>
			            <input type="hidden" name="postid" value="<%= rs.getString("postid")%>">
			              <button type="submit" class="btn btn-success btn-block" ><span class="glyphicon glyphicon-remove"></span> Report</button>
			          </form>
			        </div>
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
			        </div>
			      </div>
			      </div>
			  </div> 
			</div>
			<script>
			$(document).ready(function(){
			    $("#report<%=count%>").click(function(){
			        $("#myModalReport<%=count%>").modal();
			    });
			});
			</script>

<!-- Modal --Report ends-->



		<br>
		</div>
		</td>
		</tr></table>
<%
System.out.println("count"+count);
}
 %>
 <%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("../Login.jsp");
 }
 



 %>
 
