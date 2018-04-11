package service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import model.dao.DashboardDao;

public class DashboardService {
	
	private DashboardDao dashboardDao = new DashboardDao();
	
	public int totalMembercount() {		
		try(Connection conn = ConnectionProvider.getConnection()) {
						
			return dashboardDao.getTotalMemberCount(conn);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public int totalRoomcount() {		
		try(Connection conn = ConnectionProvider.getConnection()) {
						
			return dashboardDao.getTotalRoomCount(conn);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
		

}
