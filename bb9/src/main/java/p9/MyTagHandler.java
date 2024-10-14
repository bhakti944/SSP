package p9;
import java.io.IOException;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;
public class MyTagHandler extends TagSupport {
   private static final long serialVersionUID = 1L;
   private int number;
   private boolean valid;
   public void setNumber(int number) {
       this.number = number;
   }
   public void setValid(boolean valid) {
       this.valid = valid;
   }
   @Override
   public int doStartTag() throws JspException {
       JspWriter out = pageContext.getOut();
       try {
           if (valid) {
               out.println("<h2>Table of " + number + ":</h2>");
               out.println("<table border='1'>");
               out.println("<tr><th>Multiplier</th><th>Result</th></tr>");
               for (int i = 1; i <= 10; i++) {
                   out.println("<tr><td>" + number + " x " + i + "</td><td>" + (number * i) + "</td></tr>");
               }
               out.println("</table>");
           } else {
               out.println("<p>Please enter a valid number.</p>");
           }
       } catch (IOException e) {
           throw new JspException("Error: IOException while writing to client", e);
       }
       return SKIP_BODY;
   }
}

