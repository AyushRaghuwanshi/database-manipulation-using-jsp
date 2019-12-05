<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit_user")!=null){
       String name = request.getParameter("Artist");
       String email = request.getParameter("Song_Title");
       String password = request.getParameter("Album");
       String address = request.getParameter("Year");
       int year = Integer.parseInt(address);
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("insert into Songs (Artist,Song_Title,Album,Year) values(?,?,?,?)");
       pst.setString(1, name);
       pst.setString(2, email);
       pst.setString(3, password);
       pst.setInt(4,year);
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
  Artist:<br>
  <input type="text" name="Artist" >
  <br>
  Song_Title<br>
  <input type="text" name="Song_Title">
  <br>
  Album<br>
  <input type="text" name="Album">
  <br>
  Year<br>
  <input type="text" name="Year">
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 
<table style="width:100%">
  <tr>
    <th>Artist</th>
    <th>song_title</th>
    <th>album</th>
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
       String query = "select * from Songs";
       Statement st = cn.createStatement();
       rs = st.executeQuery(query);
       while(rs.next()){
           
       
    %>
  <tr>
      <td><%=rs.getString("Artist")  %></td>
      <td><%=rs.getString("Song_Title")  %></td>
      <td><%=rs.getString("Album")  %></td>
      <td><%=rs.getInt("Year")  %></td>
      <td><a href = "update_songs.jsp?id=<%=rs.getString("Song_Title")%>&id1=<%=rs.getString("Year")%>">edit</a></td>
      <td><a href = "delete_songs.jsp?id=<%=rs.getString("Song_Title")%>&id1=<%=rs.getString("Year")%>" >delete</a></td>
  </tr>
  <%
           
       }
  %>
  
</table>
    </body>
</html>