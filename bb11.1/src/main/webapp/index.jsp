<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
   <title>Currency Converter</title>
   <style>
       body {
           font-family: Arial, sans-serif;
           background-color: #f4f4f4;
           margin: 0;
           padding: 20px;
       }
       h2 {
           color: #333;
       }
       form {
           background: white;
           padding: 20px;
           border-radius: 8px;
           box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
           width: 300px;
       }
       label {
           display: block;
           margin-bottom: 10px;
           font-weight: bold;
       }
       input[type="text"], select {
           width: calc(100% - 20px);
           padding: 10px;
           margin-bottom: 15px;
           border: 1px solid #ddd;
           border-radius: 4px;
       }
       input[type="submit"] {
           background-color: #28a745;
           color: white;
           border: none;
           padding: 10px;
           border-radius: 4px;
           cursor: pointer;
           font-size: 16px;
       }
       input[type="submit"]:hover {
           background-color: #218838;
       }
       .result {
           margin-top: 20px;
           color: #28a745;
       }
   </style>
</head>
<body>
   <h2>Currency Converter</h2>
   <form action="convert" method="post">
       <label for="amount">Amount:</label>
       <input type="text" name="amount" id="amount" required>
       <label for="currency">Currency:</label>
       <select name="currency" id="currency">
           <option value="INRtoUSD">INR to USD</option>
           <option value="USDtoINR">USD to INR</option>
           <option value="INRtoAED">INR to AED</option>
           <option value="AEDtoINR">AED to INR</option>
           <option value="INRtoEUR">INR to EUR</option>
           <option value="EURtoINR">EUR to INR</option>
       </select>
       <input type="submit" value="Convert">
   </form>
   <c:if test="${not empty result}">
       <h3 class="result">Converted Amount: ${result}</h3>
   </c:if>
</body>
</html>


