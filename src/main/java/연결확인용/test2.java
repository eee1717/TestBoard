package 연결확인용;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test2 {

	public static void main(String argp[]) {
		
       Connection conn;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/URDO", "root" ,"1234");
	

			
			
			
			System.out.println("Success");
			
		} catch(SQLException ex) {
			
		 System.out.println("SQLException:" +ex);	
			
		} catch(Exception e) {
		   System.out.println("Exception:" +e);	
		}
		
		
	}
	
	
	
}
