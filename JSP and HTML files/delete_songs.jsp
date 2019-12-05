<%-- 
    Document   : delete_songs
    Created on : Nov 20, 2019, 1:16:43 AM
    Author     : ayush
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
  
     
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       String id = request.getParameter("id");
       String id1 = request.getParameter("id1");
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("delete from Songs where Song_Title = ? and Year = ?");
       pst.setString(1, id);
       pst.setInt(2,Integer.parseInt(id1));
        pst.executeUpdate();
       
       
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Record Deleted Successfully</h1>
    </body>
</html>