package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import model.AdminDto;

public class AdminDao {
	
	public AdminDto selectById(Connection conn,String id) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cbang_admin where id=?";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			AdminDto adminDto = null;
			if(rs.next()) {
				adminDto = new AdminDto(
						rs.getString("admin_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("privilege_code"));
			}
			return adminDto;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//입력용]
	public void insert(Connection conn, AdminDto dto) throws SQLException{		
		String sql="INSERT INTO cbang_admin VALUES(admin_code_seq.nextval,?,?,?,?,1)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.executeUpdate();			
		}
	}
}
