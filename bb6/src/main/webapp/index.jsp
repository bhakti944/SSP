<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Index</title>
</head>
<body>
   <div class="container">
       <h1>Welcome! Please Login or Register</h1>
      
       <!-- Display logout message if exists -->
       <%
           String logoutMessage = (String) request.getSession().getAttribute("logoutMessage");
           if (logoutMessage != null) {
       %>
           <div class="alert alert-success">
               <%= logoutMessage %>
           </div>
       <%
           request.getSession().removeAttribute("logoutMessage");
           }
       %>
       <a href="login.jsp" class="btn btn-primary">Login</a>
       <a href="register.jsp" class="btn btn-secondary">Register</a>
   </div>
</body>
</html>

