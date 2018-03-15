package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import jdbc.JdbcUtil;
import model.CBangDto;

public class CBangDao {

	public CBangDto selectMember(Connection conn, String member_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM CBANG WHERE member_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_no);
			rs = pstmt.executeQuery();
			CBangDto dto = null;
			if(rs.next()) {
				dto = new CBangDto(rs.getString("memeber_no"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("phone"),
						rs.getString("profile_photo"),
						rs.getDate("join_date"),
						rs.getString("job"),
						rs.getString("office_no"),
						rs.getString("path_code"),
						rs.getString("office_name"),
						rs.getString("permit_no"),
						rs.getString("office_address"),
						rs.getString("represent"),
						rs.getString("office_phone")
						);
			}
			return dto;
						
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	

}
