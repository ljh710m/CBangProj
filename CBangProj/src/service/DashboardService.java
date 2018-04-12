package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import model.JoinPathCountDto;
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
	
	public int totalGeneralMemberCount() {
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			return dashboardDao.getTotalGeneralMemberCount(conn);
			
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
	
	public int totalReportedRoomcount() {		
		try(Connection conn = ConnectionProvider.getConnection()) {
						
			return dashboardDao.getTotalReportedRoomCount(conn);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<JoinPathCountDto> joinPathCount() {
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			return dashboardDao.getJoinPathCount(conn);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
}
