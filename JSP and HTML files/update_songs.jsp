<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit_user")!=null){
       String name = request.getParameter("Artist");
       String email = request.getParameter("Song_Title");
       String password = request.getParameter("Album");
       String address = request.getParameter("Year");
       String id = request.getParameter("id");
       String id1 = request.getParameter("id1");
       int year = Integer.parseInt(address);
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("update Songs set Artist = ?, Song_Title = ?,Album = ?,Year = ? where Song_Title = ? and Year = ?");
       pst.setString(1, name);
       pst.setString(2, email);
       pst.setString(3, password);
       pst.setInt(4,year);
       pst.setString(5,id);
       pst.setInt(6,Integer.parseInt(id1));
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
        <h1>Songs</h1>
        <%
           Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       String id = request.getParameter("id");
       String id1 = request.getParameter("id1");
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("select * from Songs where Song_Title = ? and Year = ?");
       pst.setString(1,id);
       pst.setInt(2,Integer.parseInt(id1));
       rs = pst.executeQuery();
       rs.next(); 
        %>
        <form method="POST">
  Artist:<br>
  <input type="text" name="Artist" value="<%=rs.getString("Artist")%>" >
  <br>
  Song_Title<br>
  <input type="text" name="Song_Title" value="<%=rs.getString("Song_Title")%>">
  <br>
  Album<br>
  <input tx ype="text" name="Album" value="<%=rs.getString("Album")%>">
  <br>
  Year<br>
  <input type="text" name="Year" value="<%=rs.getInt("Year")%>">
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 
<table style="width:100%">
  
 
  
</table>
    </body>
</html>