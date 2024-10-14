package p6;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/InsertUser")
@MultipartConfig
public class InsertUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hash password using SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Part filePart = request.getPart("imgfile");  // Handle file upload

        // Ensure a file is uploaded
        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().println("<h1>Error: No file uploaded!</h1>");
            return;
        }

        InputStream inputStream = filePart.getInputStream(); // Get the input stream of the file

        String dbURL = "jdbc:mysql://localhost:3306/imgdb?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "root";  // Your MySQL username
        String dbPassword = "12345";  // Your MySQL password

        String hashedPassword = hashPassword(password);

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");  // Important to load the driver

            // Connect to database
            try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
                String insertUserQuery = "INSERT INTO images (name, password, imgfile) VALUES (?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(insertUserQuery)) {
                    ps.setString(1, name);
                    ps.setString(2, hashedPassword);
                    ps.setBlob(3, inputStream); // Insert the image as a BLOB

                    ps.executeUpdate(); // Execute insert
                    response.sendRedirect("login.jsp"); // Redirect to login page after success
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }
}
