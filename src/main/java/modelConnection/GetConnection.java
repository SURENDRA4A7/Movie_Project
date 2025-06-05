package modelConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class GetConnection {
	public static Connection getConnection() { 
		String url="jdbc:mysql://localhost:3306/jdbc";
		String username="root";
		String password="Manthu@252676";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection(url,username,password);
			
			System.out.println("Connection Established");
			return conn;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
