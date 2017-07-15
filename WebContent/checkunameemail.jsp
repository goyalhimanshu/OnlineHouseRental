<!DOCTYPE html>
<html lang="en">
<head>
  <title>House Rent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 </head>

<%@page import="p1.DBInfo"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
 
            String sn=request.getParameter("ver");
 
                    Connection con=DBInfo.getConnection();
                    String select="select * from login where username=?";
                    PreparedStatement ps=con.prepareStatement(select);
                    ps.setString(1, sn);
                    //ResultSet rs = st.executeQuery("select * from emp where empno="+sn);
                    ResultSet rs = ps.executeQuery();  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Username already taken");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
 
                    }
 
rs.close();
ps.close();
con.close();
 
%>
</html>