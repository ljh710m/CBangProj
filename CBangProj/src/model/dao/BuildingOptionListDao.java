package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.AdminDto;
import model.BuildingOptionListDto;
import util.PBKDF2;

public class BuildingOptionListDao {
	
	//입력용]
	public void insert(Connection conn, String name) throws SQLException{
		String sql="INSERT INTO building_option_list VALUES(BUILDING_OPTION_LIST_CODE_SEQ.nextval,?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		}
	}
	
	//수정용]
	public void update(Connection conn, String name, String code) throws SQLException{
		String sql="UPDATE building_option_list SET name = ? WHERE option_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, name);
			pstmt.setString(2, code);
			pstmt.executeUpdate();
		}
	}
	
	//삭제용]
	public void delete(Connection conn, String code) throws SQLException{
		String sql="DELETE FROM building_option_list WHERE option_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){			
			pstmt.setString(1, code);
			pstmt.executeUpdate();
		}
	}
	
	//전체 레코드 수]
	public int getTotalRowCount(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM building_option_list";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//전체 목록 가져오기]
	public List<BuildingOptionListDto> select(Connection conn,int start,int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT b.*,rownum r FROM building_option_list b) WHERE r BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, String.valueOf(start));
			pstmt.setString(2, String.valueOf(end));
			rs = pstmt.executeQuery();			
			List<BuildingOptionListDto> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertOption(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//ResultSet에서 데이터를 읽어와 BuildingOptionList 객체를 생성한다.
	private BuildingOptionListDto convertOption(ResultSet rs) throws SQLException{
		BuildingOptionListDto buildingOptionListDto = new BuildingOptionListDto(
				rs.getString("option_code"),
				rs.getString("name"));
		
		return buildingOptionListDto;
	}

}
