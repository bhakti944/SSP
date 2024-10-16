<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.*, java.io.InputStream, java.util.Base64" %>
<html>
<head>
   <title>Welcome</title>
</head>
<body>
<%
   HttpSession sesh = request.getSession(false);
   if (sesh == null || sesh.getAttribute("username") == null) {
       response.sendRedirect("login.jsp");
       return;
   }

   String username = (String) sesh.getAttribute("username");
   String dbURL = "jdbc:mysql://localhost:3306/imgdb?useSSL=false&allowPublicKeyRetrieval=true";
   String dbUser = "root"; // Your MySQL username
   String dbPassword = "12345"; // Your MySQL password 

   try {
       // Load MySQL driver
       Class.forName("com.mysql.cj.jdbc.Driver");

       // Connect to the database
       try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
           String sqlQuery = "SELECT name, imgfile FROM images WHERE name = ?";
           try (PreparedStatement ps = con.prepareStatement(sqlQuery)) {
               ps.setString(1, username);
               try (ResultSet rs = ps.executeQuery()) {
                   if (rs.next()) {
                       String name = rs.getString("name");
                       Blob blob = rs.getBlob("imgfile");

                       // Convert Blob to InputStream
                       InputStream imageStream = blob.getBinaryStream();
                       byte[] imageBytes = new byte[(int) blob.length()];
                       imageStream.read(imageBytes);

                       // Convert the image bytes to Base64 to display in HTML
                       String imageBase64 = Base64.getEncoder().encodeToString(imageBytes);
%>
                       <h1>Welcome, <strong><%= name %></strong>!</h1>
                       <img src="data:image/jpeg;base64,<%= imageBase64 %>" alt="User Image" style="max-width:300px; max-height:300px;"/>
<%
                   } else {
                       out.println("<p>User not found.</p>");
                   }
               }
           }
       }
   } catch (Exception e) {
       e.printStackTrace();
       out.println("<p>Error: " + e.getMessage() + "</p>");
   }
%>
   <p><a href="Logout.jsp">Logout</a></p>
</body>
</html>
