package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.JoinPathDto;

public class JoinPathDao {
	
	//입력용]
	public void insert(Connection conn, String path_type) throws SQLException{
		String sql="INSERT INTO join_path VALUES(JOIN_PATH_CODE_SEQ.nextval,?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, path_type);
			pstmt.executeUpdate();
		}
	}
	
	//수정용]
	public void update(Connection conn, String path_type, String path_code) throws SQLException{
		String sql="UPDATE join_path SET path_type = ? WHERE path_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, path_type);
			pstmt.setString(2, path_code);
			pstmt.executeUpdate();
		}
	}
	
	//삭제용]
	public void delete(Connection conn, String path_code) throws SQLException{
		String sql="DELETE FROM join_path WHERE path_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){			
			pstmt.setString(1, path_code);
			pstmt.executeUpdate();
		}
	}
	
	//전체 레코드 수]
	public int getTotalRowCount(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM join_path";
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
	public List<JoinPathDto> select(Connection conn,int start,int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT b.*,rownum r FROM join_path b) WHERE r BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, String.valueOf(start));
			pstmt.setString(2, String.valueOf(end));
			rs = pstmt.executeQuery();			
			List<JoinPathDto> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertOption(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//ResultSet에서 데이터를 읽어와 JoinPathDto 객체를 생성한다.
	private JoinPathDto convertOption(ResultSet rs) throws SQLException{
		JoinPathDto joinPathDto = new JoinPathDto(
				rs.getString("path_code"),
				rs.getString("path_type"));
		
		return joinPathDto;
	}

}
