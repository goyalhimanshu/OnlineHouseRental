<%
try
{

System.out.println("before session username="+session.getAttribute("username").toString());

%>


<%@page import="p1.DBInfo"%>
<%-- <%@page import="sun.security.pkcs11.Secmod.DbMode"%>--%>  
<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
            response.setContentType("text/xml");
            String sn=request.getParameter("ok");
           // int i=Integer.parseInt(sn);
 
                    System.out.println("Helo");
                    Connection con =DBInfo.getConnection();
                    String select="select distinct street from house where city=?";
                    PreparedStatement ps=con.prepareStatement(select);
                    ps.setString(1, sn);
                    ResultSet rs=ps.executeQuery();
 					System.out.println("Hello");
                    out.println("<emp>");
                    while(rs.next())
                    {                        
                    	System.out.println(rs.getString("street"));    
                        out.println("<empname>"+rs.getString("street")+"</empname>");
 
                    }
                    out.println("</emp>");
 
rs.close();
ps.close();
con.close();
 
%>
<%
}
catch(Exception e)
{
	
	System.out.println(e.getMessage());
	response.sendRedirect("../Login.jsp");
 }
 



 %>
