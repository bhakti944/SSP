<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EditCustomer</title>
</head>
<body>
    <h2>Edit Customer</h2>
    <hr/>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        Statement stmt = null;
        ResultSet rs = null;
        String action = request.getParameter("action");
        boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
        if (isPost) {
            // Handle the update operation
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String address = request.getParameter("address").trim();
                // Establish the connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud", "root", "12345");
                // Prepare SQL query for updating the record
                String sql = "UPDATE CUSTOMER SET name = ?, address = ? WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, address);
                pstmt.setInt(3, id);
                // Execute the update query
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<p>Customer record updated successfully.</p>");
                } else {
                    out.println("<p>Failed to update customer record.</p>");
                }
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                out.println("<p>Error occurred while updating the customer record.</p>");
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        } else {
            // Display the edit form
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud", "root", "12345");
                    stmt = con.createStatement();
                    String sql1 = "SELECT * FROM CUSTOMER WHERE id = " + id;
                    rs = stmt.executeQuery(sql1);
                    if (rs.next()) {
                        %>
                        <form method="post" action="EditCustomer.jsp">
                            <input type="hidden" name="action" value="update">
                            ID: <input type="text" name="id" value="<%= rs.getInt("id") %>" readonly/><br>
                            Name: <input type="text" name="name" value="<%= rs.getString("name") %>"/><br>
                            Address: <input type="text" name="address" value="<%= rs.getString("address") %>"/><br>
                            <input type="submit" value="Update"/>
                        </form>
                        <%
                    } else {
                        out.println("<p>No record found with ID " + id + ".</p>");
                    }
                } catch (SQLException | NumberFormatException e) {
                    e.printStackTrace();
                    out.println("<p>Error occurred while retrieving the customer record.</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                    if (con != null) try { con.close(); } catch (SQLException ignored) {}
                }
            } else {
                out.println("<p>No ID provided for the customer record to edit.</p>");
            }
        }
    %>
    <a href="Index.jsp">Home</a>
</body>
</html>
