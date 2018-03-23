package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import jdbc.JdbcUtil;
import model.AdminDto;
import model.MembershipDto;

public class MembershipDao {
	
	public List<MembershipDto> membershipList(Connection conn, int start, int end) throws SQLException{
		PreparedStatement pstmt = null;  
		ResultSet rs = null;
		String sql = "SELECT * FROM CBANG_MEMBER M JOIN REAL_ESTATE_OFFICE O ON M.OFFICE_NO = O.OFFICE_NO JOIN JOIN_PATH P ON M.PATH_CODE = P.PATH_CODE ORDER BY O.OFFICE_NO ASC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<MembershipDto> list = new ArrayList<>();
			while(rs.next()) {
				list.add(convertMember(rs));		
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}/////////////////////////////////////////////////////

	private MembershipDto convertMember(ResultSet rs) throws SQLException{
		MembershipDto dto = new MembershipDto(rs.getString("member_no"), 
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
				rs.getString("address"), 
				rs.getString("represent"), 
				rs.getString("office_phone"),
				rs.getString("path_type"));
		
		return dto;
	}
	
	
}
