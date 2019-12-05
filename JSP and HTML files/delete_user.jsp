<%-- 
    Document   : delete
    Created on : Nov 19, 2019, 12:52:04 AM
    Author     : ayush
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
  
     
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       String Email = request.getParameter("id");
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("delete from User_Info where email = ?");
       pst.setString(1, Email);
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
