<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer</title>
</head>
<body>
<h4>Customer</h4>
<a href="AddCustomer.jsp">Add New</a>
<hr />
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        // Register the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish the connection
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud", "root", "12345");
        // Create a Statement
        stmt = con.createStatement(); 
        // Execute the query
        String sql1 = "SELECT * FROM customer";
        rs = stmt.executeQuery(sql1);
        
        int cnt = 1;
%>
<table border="1">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>ID</th>
            <th>Name</th>
            <th>City</th>
            <th colspan="2" align="center">Action</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) {
            int cid = rs.getInt("id");
            String cname = rs.getString("name");
            String caddress = rs.getString("address");
        %>
        <tr>
            <td><%= cnt %></td>
            <td><%= cid %></td>
            <td><%= cname %></td>
            <td><%= caddress %></td>
            <td><a href="EditCustomer.jsp?id=<%= cid %>">Edit</a></td>
            <td><a href="DeleteCustomer.jsp?id=<%= cid %>">Delete</a></td>
        </tr>
        <% 
            cnt++;
        } 
        %>
    </tbody>
</table>
<%
    } catch (ClassNotFoundException e) {
        out.println("JDBC Driver not found.");
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("SQL Exception occurred.");
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
