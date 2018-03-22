package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.AdminDto;
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
	
	//목록]
	public List<BuildingOptionListDto> buildingOptionList(){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			List<BuildingOptionListDto> content = dao.select(conn);
			return content;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}			
	}	

}
