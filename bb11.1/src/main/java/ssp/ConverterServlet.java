package ssp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
@WebServlet("/convert")
public class ConverterServlet extends HttpServlet {
   private static final double USD_TO_INR = 74.0; // Example conversion rate
   private static final double INR_TO_USD = 1 / USD_TO_INR; // Calculated rate for INR to USD
   private static final double AED_TO_INR = 20.0; // Example conversion rate
   private static final double INR_TO_AED = 1 / AED_TO_INR; // Calculated rate for INR to AED
   private static final double EUR_TO_INR = 80.0; // Example conversion rate
   private static final double INR_TO_EUR = 1 / EUR_TO_INR; // Calculated rate for INR to EUR
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       double amount = Double.parseDouble(request.getParameter("amount"));
       String currency = request.getParameter("currency");
       double convertedAmount;
       switch (currency) {
           case "INRtoUSD":
               convertedAmount = amount * INR_TO_USD;
               break;
           case "USDtoINR":
               convertedAmount = amount * USD_TO_INR;
               break;
           case "INRtoAED":
               convertedAmount = amount * INR_TO_AED;
               break;
           case "AEDtoINR":
               convertedAmount = amount * AED_TO_INR;
               break;
           case "INRtoEUR":
               convertedAmount = amount * INR_TO_EUR;
               break;
           case "EURtoINR":
               convertedAmount = amount * EUR_TO_INR;
               break;
           default:
               convertedAmount = 0.0;
       }
       request.setAttribute("result", String.format("%.2f", convertedAmount)); // Format to 2 decimal places
       RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
       dispatcher.forward(request, response);
   }
}
