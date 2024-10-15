package ssp.bb10;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MYSQLconnection {
   private static final String URL = "jdbc:mysql://localhost:3306/bb10";
   private static final String USER = "root";
   private static final String PASSWORD = "12345";
   public static void main(String[] args) {
       Connection connection = null;
       try {
           // Establish the connection
           connection = DriverManager.getConnection(URL, USER, PASSWORD);
           System.out.println("Connection established successfully!");
           // Perform database operations here
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           // Close the connection
           if (connection != null) {
               try {
                   connection.close();
                   System.out.println("Connection closed.");
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
       }
   }
}
