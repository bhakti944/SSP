<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/MyLib.tld" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Multiplication Table</title>
</head>
<body>
  <h1>Multiplication Table</h1>
  <%
      String numberParam = request.getParameter("number");
      int number = 0;
      boolean isValid = false;
      if (numberParam != null) {
          try {
              number = Integer.parseInt(numberParam);
              isValid = true;
          } catch (NumberFormatException e) {
              isValid = false;
          }
      }
  %>
  <t:table number="<%= number %>" valid="<%= isValid %>"></t:table>
  <a href="index.jsp">Go Back</a>
</body>
</html>

