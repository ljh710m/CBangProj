package service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.dao.BuildingOptionListDao;

public class BuildingOptionListService {
	
	private BuildingOptionListDao dao = new BuildingOptionListDao();
	
	public void insert(String name) {
		Connection conn = null;
		
		try {
			//DB 커넥션을 구하고, 트랜잭션을 시작
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.insert(conn,name);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
