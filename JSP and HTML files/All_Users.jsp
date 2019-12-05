<%-- 
    Document   : All_Users
    Created on : Nov 20, 2019, 2:16:08 AM
    Author     : ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>All users</h1>
        <%
    
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("Select * from All_Users");
       rs = pst.executeQuery();
      
    
   
     while(rs.next()){  
       
    
%>

<h4><%=rs.getString("Name")%></h4>

<% 

}
%>
    </body>
</html>
