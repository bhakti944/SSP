<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="p1.Student" %>
<%@ page import="p1.DatabaseUtil" %> <!-- Assuming you have a DatabaseUtil class for connection -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm00NTYtMDExZC5qcGc.jpg'); 
            background-size: cover; 
            background-position: center; 
            margin: 0;
            padding: 20px;
            color: #333; 
        }
        h2 {
            color: #5b3a29; 
            text-align: center;
            margin-bottom: 20px;
        }
        .record {
            background: rgba(255, 255, 255, 0.9); 
            padding: 30px; 
            border-radius: 8px; 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
            border: 1px solid #d1b3a0; 
        }
        .label {
            font-weight: bold;
            color: #5b3a29; 
        }
        .success-message {
            text-align: center; 
            margin: 20px 0; 
            font-weight: bold; 
            color: #5b3a29; 
        }
        .error-message {
            text-align: center; 
            margin: 20px 0; 
            font-weight: bold; 
            color: #d9534f; 
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .back-button {
            background-color: #8c6b4f; 
            color: white;
            border: none;
            padding: 12px 20px; 
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px; 
        }
        .back-button:hover {
            background-color: #7a5a3d; 
        }
    </style>
</head>
<body>
    <jsp:useBean id="u" class="p1.Student" scope="request" />
    <jsp:setProperty name="u" property="*" />

    <h2>The Record Is</h2>
    <div class="record">
        <p><span class="label">ID:</span> <jsp:getProperty name="u" property="id" /></p>
        <p><span class="label">Name:</span> <jsp:getProperty name="u" property="name" /></p>
        <p><span class="label">Address:</span> <jsp:getProperty name="u" property="address" /></p>
        <p><span class="label">Email:</span> <jsp:getProperty name="u" property="email" /></p>
        <p><span class="label">Phone:</span> <jsp:getProperty name="u" property="phone" /></p>
        <p><span class="label">Course:</span> <jsp:getProperty name="u" property="course" /></p>
        <p><span class="label">Gender:</span> <jsp:getProperty name="u" property="gender" /></p>
        <p><span class="label">Interests:</span> <jsp:getProperty name="u" property="interests" /></p>
    </div>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isSuccess = false;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO students (id, name, address, email, phone, course, gender, interests) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u.getId());
            pstmt.setString(2, u.getName());
            pstmt.setString(3, u.getAddress());
            pstmt.setString(4, u.getEmail());
            pstmt.setString(5, u.getPhone());
            pstmt.setString(6, u.getCourse());
            pstmt.setString(7, u.getGender());
            pstmt.setString(8, u.getInterests());

            int rowsInserted = pstmt.executeUpdate();
            isSuccess = rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
    <% if (isSuccess) { %>
        <div class="success-message">Record successfully inserted!</div>
    <% } else { %>
        <div class="error-message">Error inserting record.</div>
    <% } %>

    <div class="button-container">
        <form action="register.jsp" method="get">
            <input type="submit" class="back-button" value="Back to Registration">
        </form>
    </div>
</body>
</html>