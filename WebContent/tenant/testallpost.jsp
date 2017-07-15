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
 	@import "http://fonts.googleapis.com/css?family=Roboto:300,400,500,700";
		.container { margin-top: 20px; }
		.mb20 { margin-bottom: 20px; } 
		hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
		hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
		hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }
		.search-result .thumbnail { border-radius: 0 !important; }
		.search-result:first-child { margin-top: 0 !important; }
		.search-result { margin-top: 20px; }
		.search-result .col-md-2 { border-right: 1px dotted #ccc; min-height: 140px; }
		.search-result ul { padding-left: 0 !important; list-style: none;  }
		.search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
		.search-result ul li i { padding-right: 5px; }
		.search-result .col-md-7 { position: relative; }
		.search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
		.search-result h3 > a, .search-result i { color: #248dc1 !important; }
		.search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; } 
		.search-result span.plus { position: absolute; right: 0; top: 126px; }
		.search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
		.search-result span.plus a:hover { background-color: #414141; }
		.search-result span.plus a i { color: #fff !important; }
		.search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; } 
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
			Connection con=DBInfo.getConnection();
			String counttotal="select count(*) as total from house where city=? and street=?";
				PreparedStatement ps0=con.prepareStatement(counttotal);
				ps0.setString(1, city);
				ps0.setString(2, location);
				ResultSet rs0=ps0.executeQuery();
				int total=0;
				if(rs0.next())
				{		
			 		
				total=rs0.getInt(1);
				}
%>

<div class="container">
<br><br>
    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger"><%= total %></strong> results were found for the search for <strong class="text-danger"><%= location+", "+city %></strong></h2>								
	</hgroup>
<section class="col-xs-12 col-sm-6 col-md-12">
<%
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
    
		<article class="search-result row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<a href="ShowPost.jsp?postid=<%=rs.getString("postid") %>" title="<%=rs.getString("title") %>" class="thumbnail"><img src="../servlet/DisplayPhotoServlet?postid=<%= rs.getString("postid") %>&row=1" /></a>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-3">
				<ul class="meta-search" >
					<li><i class="glyphicon glyphicon-calendar"></i> <span>Posted On: <%=rs.getString("postdate") %></span></li>
					<li><i class="glyphicon glyphicon-calendar"></i> <span>Available From: <%=rs.getString("fromdate") %></span></li>
					<li><i class="glyphicon glyphicon-user"></i> <span> Posted by: <%=rs.getString("postedby") %></span></li>
					<li><i class="glyphicon glyphicon-tags"></i> <span> INR <%=rs.getString("price") %></span></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 excerpet">
				<h3><a href="ShowPost.jsp?postid=<%=rs.getString("postid") %>" title=""><%=rs.getString("title") %></a></h3>
				<p><%=rs.getString("description") %></p>
				<button type="submit" class="btn btn-default" id="contact<%= count%>">Contact </button>						
           
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
			  <div class="tooltip-wrapper" data-title="Already Reported!">
			  <button   class="btn btn-danger" role="button" id="report<%=count%> %>" disabled ><span class="glyphicon glyphicon-remove"></span>&nbsp;Report</button>
			  </div>
			  
			  <%
			  	}
			   else
			   {
			   	%> 		 
			  	<button type="submit"  class="btn btn-danger" role="button" id="report<%=count%>"><span class="glyphicon glyphicon-remove"></span>&nbsp;Report</button>
			  	<%
			  	}
			   %>
			   </div>
			<span class="clearfix borda"></span>
		</article>

<script>
$(function() {
    $('.tooltip-wrapper').tooltip({position: "bottom"});
});
</script>
		  
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
			            
			              <label for="email"><span class="glyphicon glyphicon-user"></span> <b>@</b>Email</label>
			              <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required="required">
			            </div>
			            <div class="form-group">
			              <label for="name"><span class="glyphicon glyphicon-user"></span> Name</label>
			              <input type="text" class="form-control" id="name" name="name" placeholder="Name" required="required">
			            </div>
			            <div class="form-group">
			              <label for="mobile"><span class="glyphicon glyphicon-earphone"></span> Mobile</label>
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
			<script>
			$(document).ready(function(){
			    $("#report<%=count%>").click(function(){
			        $("#myModalReport<%=count%>").modal();
			    });
			});
			</script>

<!-- Modal --Report ends-->

<%
System.out.println("count"+count);
}
%>
</section>
</div><br><br>
 <%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("../Login.jsp");
 }
 
 %>
 
