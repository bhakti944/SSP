package b4;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProcessServlet")  // URL mapping for the servlet
public class ProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProcessServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieve form parameters
        String s1 = request.getParameter("txtName");
        String s2 = request.getParameter("sspM1");
        String s3 = request.getParameter("dbmsM1");

        // HTML content
        out.println("<html><body><h1>");
        out.println("Your Name is " + s1);
        
        // Validate and process marks input
        try {
            int m1 = Integer.parseInt(s2);  // Convert SSP Marks to integer
            int m2 = Integer.parseInt(s3);  // Convert DBMS Marks to integer
            int total = m1 + m2;

            out.println("<br>Total Marks = " + total);

            // Determine pass/fail based on the marks
            String result = (m1 >= 40 && m2 >= 40) ? "PASS" : "FAIL";
            out.println("<h2>Result: " + result + "</h2>");
        } catch (NumberFormatException e) {
            out.println("<h2>Invalid input for marks. Please enter valid integers for SSP and DBMS marks.</h2>");
        }

        out.println("</body></html>");
        out.close();
    }

    // Handles POST requests by delegating to doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}