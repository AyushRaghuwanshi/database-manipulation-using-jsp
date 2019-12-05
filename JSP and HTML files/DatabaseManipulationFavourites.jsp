<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit_user")!=null){
       String name = request.getParameter("Email");
       String email = request.getParameter("Song_Title");
       String password = request.getParameter("Year");
     
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("insert into Favourites (Email,Song_Title,Year) values(?,?,?)");
       pst.setString(1, name);
       pst.setString(2, email);
       pst.setString(3, password);
    
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
        <h1>User info</h1>
        <form method="POST">
  Email:<br>
  <input type="text" name="Email" >
  <br>
  Song_Title<br>
  <input type="text" name="Song_Title">
  <br>
  Year<br>
  <input tx ype="text" name="Year">
  <br>
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 
<table style="width:100%">
  <tr>

    <th>email</th>
    <th>song title</th>
    <th>year</th>
    <th></th>
    <th></th>
  </tr>
  
  <%
    Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       String query = "select * from Favourites";
       Statement st = cn.createStatement();
       rs = st.executeQuery(query);
       while(rs.next()){
           
       
    %>
  <tr>
      <td><%=rs.getString("Email")  %></td>
      <td><%=rs.getString("Song_Title")  %></td>
      <td><%=rs.getString("year")  %></td>
      <td><a href = "">edit</a></td>
      <td><a href = "">delete</a></td>
  </tr>
  <%
           
       }
  %>
  
</table>
    </body>
</html>