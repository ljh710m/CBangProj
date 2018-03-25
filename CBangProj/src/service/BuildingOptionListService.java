package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.BuildingOptionListDto;
import model.dao.BuildingOptionListDao;

public class BuildingOptionListService {
	
	private BuildingOptionListDao dao = new BuildingOptionListDao();
	
	//등록]
	public void insert(String name) {
		Connection conn = null;
		
		try {
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
	
	//변경]
	public void update(String name, String code) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.update(conn,name,code);
			conn.commit();
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//삭제]
	public void delete(String name, String code) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
	
			dao.delete(conn, code);
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
		}
		return totalRowCount;
	}	
	
	//목록]
	public List<BuildingOptionListDto> buildingOptionList(int start,int end){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			List<BuildingOptionListDto> content = dao.select(conn,start,end);
			return content;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}			
	}	

}
