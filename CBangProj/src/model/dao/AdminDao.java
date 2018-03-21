package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.AdminDto;
import util.PBKDF2;

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
			pstmt.setString(2, PBKDF2.createHash(dto.getPassword()));
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.executeUpdate();			
		} catch(Exception e) {}
	}
	
	//전체 레코드 수]
	public int selectCount(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM cbang_admin";
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
	public List<AdminDto> select(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cbang_admin JOIN admin_privilege USING(privilege_code)";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<AdminDto> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertAdmin(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}	
	
	//ResultSet에서 데이터를 읽어와 Admin 객체를 생성한다.
	private AdminDto convertAdmin(ResultSet rs) throws SQLException{
		AdminDto adminDto = new AdminDto(
				rs.getString("admin_code"),
				rs.getString("id"),
				null,
				rs.getString("name"),
				rs.getString("email"),
				rs.getString("privilege_code"));
		adminDto.setPrivilege_info(rs.getString("privilege_info"));
		
		return adminDto;
	}
}
