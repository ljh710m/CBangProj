package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.DeclarationDto;
import model.dao.DeclarationDao;


public class DeclarationService {

	private DeclarationDao dao = new DeclarationDao();
	
	public List<DeclarationDto> selectList(int start, int end) {
		
		try (Connection conn = ConnectionProvider.getConnection()){
			List<DeclarationDto> list = dao.selectList(conn, start, end);
			
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public String selectPhoto(String room_no) {
		try (Connection conn = ConnectionProvider.getConnection()){
			String photoName = dao.selectOne(conn, room_no);
			
			return photoName;
		} catch (Exception e) {
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
