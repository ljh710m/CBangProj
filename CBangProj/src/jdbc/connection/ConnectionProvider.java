package jdbc.connection;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionProvider {
	
	private static Connection conn;
		
	public static Connection getConnection() throws SQLException {
		try {
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup("java:comp/env/jdbc/OracleXE");
			conn = source.getConnection();
		} catch (NamingException e) {			
			e.printStackTrace();
		}
		
		return conn;
	}
}
