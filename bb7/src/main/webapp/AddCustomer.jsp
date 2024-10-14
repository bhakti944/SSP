<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
</head>
<body>
    <h2>Add Customer Record</h2>
    <hr/>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
        if (isPost) {
            // Handle the addition of a new customer
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String address = request.getParameter("address").trim();
                // Establish the connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud", "root", "12345");
                // Prepare SQL query for inserting the record
                String sql = "INSERT INTO CUSTOMER (id, name, address) VALUES (?, ?, ?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, id);
                pstmt.setString(2, name);
                pstmt.setString(3, address);
                // Execute the query
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<p>Customer added successfully.</p>");
                } else {
                    out.println("<p>Failed to add customer.</p>");
                    out.println("<a href='AddCustomer.jsp'>Try Again</a>");
                }
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                out.println("<p>Error occurred while adding the customer.</p>");
                out.println("<a href='AddCustomer.jsp'>Try Again</a>");
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        } else {
            // Display the form to add a new customer
    %>
            <form method="post" action="AddCustomer.jsp">
                ID: <input type="text" name="id" required><br>
                Name: <input type="text" name="name" required><br>
                Address: <input type="text" name="address" required><br>
                <input type="submit" value="Add Customer">
            </form>
    <%
        }
    %>
    <a href="Index.jsp">Home</a>
</body>
</html>
