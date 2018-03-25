package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.RoomTypesDto;

public class RoomTypesDao {
	
	//입력용]
	public void insert(Connection conn, String room_type) throws SQLException{
		String sql="INSERT INTO rooom_types VALUES(ROOM_TYPES_CODE_SEQ.nextval,?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, room_type);
			pstmt.executeUpdate();
		}
	}
	
	//수정용]
	public void update(Connection conn, String room_type, String rm_type_code) throws SQLException{
		String sql="UPDATE rooom_types SET room_type = ? WHERE rm_type_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, room_type);
			pstmt.setString(2, rm_type_code);
			pstmt.executeUpdate();
		}
	}
	
	//삭제용]
	public void delete(Connection conn, String rm_type_code) throws SQLException{
		String sql="DELETE FROM rooom_types WHERE rm_type_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){			
			pstmt.setString(1, rm_type_code);
			pstmt.executeUpdate();
		}
	}
	
	//전체 레코드 수]
	public int getTotalRowCount(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM rooom_types";
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
	public List<RoomTypesDto> select(Connection conn,int start,int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT b.*,rownum r FROM rooom_types b) WHERE r BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, String.valueOf(start));
			pstmt.setString(2, String.valueOf(end));
			rs = pstmt.executeQuery();			
			List<RoomTypesDto> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertOption(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//ResultSet에서 데이터를 읽어와 RoomTypesList 객체를 생성한다.
	private RoomTypesDto convertOption(ResultSet rs) throws SQLException{
		RoomTypesDto roomTypesDto = new RoomTypesDto(
				rs.getString("rm_type_code"),
				rs.getString("room_type"));
		
		return roomTypesDto;
	}

}
