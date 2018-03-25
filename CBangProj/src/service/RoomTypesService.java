package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.RoomTypesDto;
import model.dao.RoomTypesDao;

public class RoomTypesService {
	
	private RoomTypesDao dao = new RoomTypesDao();
	
	//등록]
	public void insert(String room_type) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.insert(conn,room_type);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//변경]
	public void update(String room_type, String rm_type_code) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.update(conn,room_type,rm_type_code);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//삭제]
	public void delete(String rm_type_code) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.delete(conn, rm_type_code);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//전체 레코드 수]
	public int getTotalRowCount() {
		Connection conn = null;
		int totalRowCount=0;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			totalRowCount = dao.getTotalRowCount(conn);
			
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);			
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
		return totalRowCount;
	}	
	
	//목록]
	public List<RoomTypesDto> roomTypesList(int start,int end){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			List<RoomTypesDto> content = dao.select(conn,start,end);
			return content;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}			
	}

}
