package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.AdminPrivilegeDto;

public class AdminPrivilegeDao {
	
	//입력용]
	public void insert(Connection conn, String privilege_info) throws SQLException{
		String sql="INSERT INTO admin_privilege VALUES(ADMIN_PRIVILEGE_CODE_SEQ.nextval,?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, privilege_info);
			pstmt.executeUpdate();
		}
	}
	
	//수정용]
	public void update(Connection conn, String privilege_info, String privilege_code) throws SQLException{
		String sql="UPDATE admin_privilege SET privilege_info = ? WHERE privilege_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, privilege_info);
			pstmt.setString(2, privilege_code);
			pstmt.executeUpdate();
		}
	}
	
	//삭제용]
	public void delete(Connection conn, String privilege_code) throws SQLException{
		String sql="DELETE FROM admin_privilege WHERE privilege_code = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){			
			pstmt.setString(1, privilege_code);
			pstmt.executeUpdate();
		}
	}
	
	//전체 레코드 수]
	public int getTotalRowCount(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM admin_privilege";
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
	public List<AdminPrivilegeDto> select(Connection conn,int start,int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT b.*,rownum r FROM admin_privilege b) WHERE r BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, String.valueOf(start));
			pstmt.setString(2, String.valueOf(end));
			rs = pstmt.executeQuery();			
			List<AdminPrivilegeDto> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertOption(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//ResultSet에서 데이터를 읽어와 AdminPrivilegeDto 객체를 생성한다.
	private AdminPrivilegeDto convertOption(ResultSet rs) throws SQLException{
		AdminPrivilegeDto adminPrivilegeDto = new AdminPrivilegeDto(
				rs.getString("privilege_code"),
				rs.getString("privilege_info"));
		
		return adminPrivilegeDto;
	}

}
