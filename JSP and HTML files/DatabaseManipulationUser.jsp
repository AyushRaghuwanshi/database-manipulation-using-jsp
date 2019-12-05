<%-- 
    Document   : DatabaseManipulation
    Created on : Nov 17, 2019, 6:41:30 PM
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
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("insert into User_Info (Name,Email,Password,Address,DoB) values(?,?,?,?,?)");
       pst.setString(1, name);
       pst.setString(2, email);
       pst.setString(3, password);
       pst.setString(4, address);
       pst.setString(5, dob);
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
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>User info</h1>
        <form method="POST">
  Name:<br>
  <input type="text" name="name" >
  <br>
  Email<br>
  <input type="text" name="email">
  <br>
  password<br>
  <input type="text" name="password">
  <br>
  Address<br>
  <input type="text" name="address">
  
  <br>
  DOB<br>
  <input type="text" name="dob" value = "yyyy-mm-dd">
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 
<table style="width:100%">
  <tr>
    <th>name</th>
    <th>email</th>
    <th>password</th>
    <th>address</th>
    <th>dob</th>
    <th></th>
    <th></th>
  </tr>
  
  <%
    Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       String query = "select * from User_Info";
       Statement st = cn.createStatement();
       rs = st.executeQuery(query);
       while(rs.next()){
           
       
    %>
  <tr>
      <td><%=rs.getString("Name")  %></td>
      <td><%=rs.getString("Email")  %></td>
      <td><%=rs.getString("Password")  %></td>
      <td><%=rs.getString("Address")  %></td>
      <td><%=rs.getString("DoB")  %></td>
      <td><a href = "update_user.jsp?id=<%=rs.getString("Email")%>">edit</a></td>
      <td><a href = "delete_user.jsp?id=<%=rs.getString("Email")%>">delete</a></td>
  </tr>
  <%
           
       }
  %>
  
</table>
    </body>
</html>
