<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
   HttpSession sesh = request.getSession(false);
   if (sesh != null) {
       sesh.invalidate();
   }
   request.getSession().setAttribute("logoutMessage", "Successfully logged out.");
   response.sendRedirect("index.jsp");
%>
