<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm00NTYtMDExZC5qcGc.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire viewport */
            background-position: center; /* Center the image */
            margin: 0;
            padding: 20px;
            color: #333; /* Default text color */
        }
        h1 {
            color: #5b3a29; /* Dark brown for the header */
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent white for form background */
            padding: 30px; /* Increased padding for better spacing */
            border-radius: 8px; /* Slightly larger border radius */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
            border: 1px solid #d1b3a0; /* Light brown border */
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #5b3a29; /* Dark brown for labels */
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px; /* Increased padding for inputs */
            margin-bottom: 15px; /* Increased margin for better spacing */
            border: 1px solid #c2a68a; /* Medium beige border */
            border-radius: 4px;
            box-sizing: border-box; /* Ensures padding is included in width */
        }
        input[type="radio"],
        input[type="checkbox"] {
            margin-right: 5px;
        }
        input[type="submit"],
        input[type="reset"] {
            background-color: #8c6b4f; /* Medium brown for buttons */
            color: white;
            border: none;
            padding: 12px 20px; /* Increased padding for buttons */
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            font-size: 16px; /* Increased font size for buttons */
        }
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #7a5a3d; /* Darker brown on hover */
        }
        .interests {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <h1>Registration Form</h1>
    <form action="printrecord.jsp" method="post">
        <label for="id">Enter ID:</label>
        <input type="text" id="id" name="id" required>
        
        <label for="name">Enter Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="address">Enter Address:</label>
        <input type="text" id="address" name="address" required>
        
        <label for="email">Enter Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="phone">Enter Phone:</label>
        <input type="tel" id="phone" name="phone" required>
        
        <label for="course">Select Engineering Course:</label>
        <select id="course" name="course" required>
            <option value="">--Select a Course--</option>
            <option value="Computer Science">Computer Science</option>
            <option value="Artificial Intelligence">Artificial Intelligence</option>
            <option value="Data Science">Data Science</option>
            <option value="Machine Learning">Machine Learning</option>
        </select>
 
        <label>Gender:</label>
        <input type="radio" name="gender" value="Male" required> Male
        <input type="radio" name="gender" value="Female" required> Female
        <input type="radio" name="gender" value="Other" required> Other<br>
        
        <div class="interests">
        <label>Interests:</label><br>
        <input type="checkbox" name="interests" value="Arts"> Arts<br>
        <input type="checkbox" name="interests" value="Music"> Music<br>
        <input type="checkbox" name="interests" value="Dance"> Dance<br>
        <input type="checkbox" name="interests" value="Sports"> Sports<br>
        </div>
      
        <input type="submit" value="Submit">
        <input type="reset" value="Reset Form">
    </form>
</body>
</html>
