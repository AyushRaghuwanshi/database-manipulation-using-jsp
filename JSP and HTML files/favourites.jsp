<%-- 
    Document   : favourites
    Created on : Nov 20, 2019, 11:24:25 AM
    Author     : ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("submit_user")!=null){
       
       String email = request.getParameter("email");
       String title = request.getParameter("Song_Title");
       
 
       Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
       pst = cn.prepareStatement("select * from Songs where Song_Title = ?");
       pst.setString(1, title);
       rs = pst.executeQuery();
       rs.next();
       int year = rs.getInt("Year");
       pst = cn.prepareStatement("insert into Favourites (Email,Song_Title,Year) values (?,?,?)" );
       pst.setString(1, email);
       pst.setString(2, title);
       pst.setInt(3, year);
       pst.executeUpdate();
       
       
       
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h2>Adding the favourite song</h2>
    <br>
    <h2>list of songs which we can add = </h2>
    <%
    Connection cn;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       cn = DriverManager.getConnection("jdbc:mysql://localhost/Music","root","");
        pst = cn.prepareStatement("Select Song_Title from Songs");
        
       rs = pst.executeQuery();
      
    
   
     while(rs.next()){  
    %>
    <h3><%=rs.getString("Song_Title")%></h3>
    <%
            }
    %>
    
    
    <table style="width:100%">
  <tr>
    <th>Email</th>
    <th>song_title</th>
    <th>year</th>
  </tr>
  
  <%
  
       
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
      <td><%=rs.getInt("Year")  %></td>
      
  </tr>
  <%
           
       }
  %>
  
  
  
</table>
  <br>
  <h3>add email and song</h3>
  <form method="POST">
  Email:<br>
  <input type="text" name="email" >
  <br>
  Song_Title<br>
  <input type="text" name="Song_Title">
  <br>
  <input type="submit" value="Submit" name = "submit_user">
</form> 
    
    </body>
</html>
