package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.AdminPrivilegeDto;
import model.dao.AdminPrivilegeDao;


public class AdminPrivilegeService {
	
	private AdminPrivilegeDao dao = new AdminPrivilegeDao();
	
	//등록]
	public void insert(String privilege_info) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.insert(conn,privilege_info);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//변경]
	public void update(String privilege_info, String privilege_code) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.update(conn,privilege_info,privilege_code);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//삭제]
	public void delete(String privilege_code) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.delete(conn, privilege_code);
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
	public List<AdminPrivilegeDto> adminPrivilegeList(int start,int end){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			List<AdminPrivilegeDto> content = dao.select(conn,start,end);
			return content;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}			
	}	

}
