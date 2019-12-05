<%-- 
    Document   : DatabaseManipulationFriends
    Created on : Nov 19, 2019, 10:08:49 PM
    Author     : ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit_user")!=null){
       String name = request.getParameter("Person_Email");
       String email = request.getParameter("Friend_Email");
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("insert into Friends (Person_Email,Friend_Email) values(?,?)");
       pst.setString(1, name);
       pst.setString(2, email);
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
  Person_Email:<br>
  <input type="text" name="Person_Email" >
  <br>
  Friend_Email<br>
  <input type="text" name="Friend_Email">
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 
<table style="width:100%">
  <tr>
    <th>name</th>
    <th>email</th>
    <th></th>
    <th></th>
  </tr>
  
  <%
    Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       String query = "select * from Friends";
       Statement st = cn.createStatement();
       rs = st.executeQuery(query);
       while(rs.next()){
           
       
    %>
  <tr>
      <td><%=rs.getString("Person_Email")  %></td>
      <td><%=rs.getString("Friend_Email")  %></td>
      <td>edit</td>
      <td>delete</td>
  </tr>
  <%
           
       }
  %>
  
</table>
    </body>
</html>
