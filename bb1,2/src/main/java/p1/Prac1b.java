package p1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
public class Prac1b {
	public static void main(String[] args) throws Exception   {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver loaded");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssp","root","12345");
		System.out.println("Connection created");
		PreparedStatement ps=con.prepareStatement("UPDATE students SET id=3054 WHERE name='Bhakti Bhoite'");
       System.out.println("Statement created");
       int i=ps.executeUpdate();
       if (i>0)
       	System.out.println("Record updated");
       else
       	System.out.println("Updation failed");
	}
}
