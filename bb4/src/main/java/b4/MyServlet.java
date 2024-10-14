package b4;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/myservlet")  // Maps the servlet to /myservlet
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><body><h1>");
        out.println("This is my servlet</h1>");
        out.println("<h2>Hello Bhakti </h2>");
        out.println("This is my SSP program");
        out.println("</body></html>");

        out.close();
    }
}
