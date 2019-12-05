<%-- 
    Document   : update
    Created on : Nov 18, 2019, 11:49:11 PM
    Author     : ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
   if(request.getParameter("submit_user")!=null){
       String name = request.getParameter("name");
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String address = request.getParameter("address");
       String dob = request.getParameter("dob");
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       String Email = request.getParameter("id");
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("update  User_Info set Name=?,Email=?,Password=?,Address=?,DoB=? where Email=?");
       pst.setString(1, name);
       pst.setString(2, email);
       pst.setString(3, password);
       pst.setString(4, address);
       pst.setString(5, dob);
       pst.setString(6,Email);
       pst.executeUpdate();
       
       
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;
}
        </style>>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update</h1>
        <% 
        Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("select * from User_Info where Email= ?");
       String email = request.getParameter("id");
       pst.setString(1,email);
       rs = pst.executeQuery();
       rs.next();
        %>
        <form method="POST">
  Name:<br>
  <input type="text" name="name" value="<%=rs.getString("name")%>" >
  <br>
  Email<br>
  <input type="text" name="email" value="<%=rs.getString("email")%>">
  <br>
  password<br>
  <input tx ype="text" name="password" value="<%=rs.getString("password")%>">
  <br>
  Address<br>
  <input type="text" name="address" value="<%=rs.getString("address")%>">
  
  <br>
  DOB<br>
  <input type="text" name="dob" value="<%=rs.getString("dob")%>" >
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 

  
  

  
</table>
    </body>
</html>