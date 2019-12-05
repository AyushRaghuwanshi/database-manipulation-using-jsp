<%-- 
    Document   : Report.jsp
    Created on : Nov 20, 2019, 9:27:37 AM
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
        <h1 align="Center">Report Page</h1>
        <h3> friends = </h3>
        <%
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String email = request.getParameter("email");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
            pst = cn.prepareStatement("select Friend_Email from Friends where Person_Email = ?");
            pst.setString(1, email);
            rs = pst.executeQuery();
            
            while(rs.next()){
        %>
        <h5><%=rs.getString("Friend_Email")%></h5>
        
        <%
            }
        %>
        
       
        <h3>Groups</h3>
         <%
        
            
            
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
            pst = cn.prepareStatement("select Group_Name from Fans where Email = ?");
            pst.setString(1,email);
            rs = pst.executeQuery();
            
            while(rs.next()){
        %>
        <h5><%=rs.getString("Group_Name")%></h5>
            <%
            }
            %>
    </body>
</html>
