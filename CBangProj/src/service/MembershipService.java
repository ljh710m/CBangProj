package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.servlet.ServletContext;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.MembershipDto;
import model.dao.MembershipDao;

public class MembershipService {  
	
	private MembershipDao dao = new MembershipDao();
	
	public List<MembershipDto> selectList(int start, int end, String office_no) {
		
		try (Connection conn = ConnectionProvider.getConnection()){
			List<MembershipDto> list = dao.membershipList(conn, start, end, office_no);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public int getTotalRowCount() {
		Connection conn = null;
		int totalRowCount=0;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			totalRowCount = dao.getTotalRecordCount(conn);
			
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);			
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
		return totalRowCount;
	}
	
}
