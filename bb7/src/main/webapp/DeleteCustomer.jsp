<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DeleteCustomer</title>
</head>
<body>
    <h2>Delete Customer</h2>
    <hr/>
    <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String idParam = request.getParameter("id");
        boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
        if (isPost) {
            // Handle the deletion
            try {
                int id = Integer.parseInt(idParam);
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud", "root", "12345");
                String sql = "DELETE FROM CUSTOMER WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, id);
                pstmt.executeUpdate();
                out.println("<p>Record with ID " + id + " has been deleted.</p>");
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                out.println("<p>Error occurred while deleting the record.</p>");
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        } else if (idParam != null && !idParam.isEmpty()) {
            // Display the record
            try {
                int id = Integer.parseInt(idParam);
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud", "root", "12345");
                stmt = con.createStatement();
                String sql1 = "SELECT * FROM customer WHERE id = " + id;
                rs = stmt.executeQuery(sql1);
                if (rs.next()) {
                    %>
                    <form method="post" action="DeleteCustomer.jsp?id=<%= id %>">
                        ID : <%= rs.getInt("id") %><br>
                        Name : <%= rs.getString("name") %><br>
                        Address: <%= rs.getString("address") %><br>
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <input type="submit" name="submit" value="Delete"/>
                        <br><a href="Customer.jsp">Keep The Record</a>
                    </form>
                    <%
                } else {
                    out.println("<p>No record found with ID " + id + ".</p>");
                }
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                out.println("<p>Error occurred while retrieving the record.</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        } else {
            out.println("<p>No ID provided for the record to be deleted.</p>");
        }
    %>
    <a href="Index.jsp">Home</a>
</body>
</html>
