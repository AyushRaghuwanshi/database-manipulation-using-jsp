<%-- 
    Document   : All_Songs
    Created on : Nov 20, 2019, 3:12:12 PM
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
        <h1>All Songs</h1>
        <%
    
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("Select * from All_Songs");
       rs = pst.executeQuery();
      
    
   
     while(rs.next()){  
       
    
%>

<h4><%=rs.getString("Song_Title")%></h4>

<% 

}
%>
    </body>
</html>
