package p1;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
public class Prac1c {
	public static void main(String[] args) throws Exception   {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver loaded");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssp","root","12345");
		System.out.println("Connection created");
		PreparedStatement ps=con.prepareStatement("DELETE FROM students WHERE id=3098;");
       System.out.println("Statement created");
       int i=ps.executeUpdate();
       if (i>0)
       	System.out.println("Record deleted");
       else
       	System.out.println("Deletion failed");
	}
}
