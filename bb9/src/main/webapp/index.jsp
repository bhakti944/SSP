<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/MyLib.tld" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Multiplication Table Generator</title>
</head>
<body>
  <h1>Multiplication Table Generator</h1>
  <form method="post" action="table.jsp">
      <label for="number">Enter a number:</label>
      <input type="number" id="number" name="number" required>
      <input type="submit" value="Generate Table">
  </form>
</body>
</html>
