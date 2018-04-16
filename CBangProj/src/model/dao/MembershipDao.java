package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.AdminDto;
import model.MembershipDto;

public class MembershipDao {
	
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public List<MembershipDto> membershipList(Connection conn, int start, int end, String office_no) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		String sql = "SELECT * FROM (SELECT C.*,PATH_TYPE,OFFICE_NAME,PERMIT_NO,ADDRESS,REPRESENT,OFFICE_PHONE,OFFICE_PHOTO,PERMIT_PHOTO,ROWNUM R FROM CBANG_MEMBER C JOIN REAL_ESTATE_OFFICE E ON C.OFFICE_NO = E.OFFICE_NO JOIN JOIN_PATH P ON C.PATH_CODE = P.PATH_CODE WHERE C.OFFICE_NO IS NOT NULL ";
				if(office_no != null)
					sql+= "AND E.OFFICE_NO = '"+office_no+"' ";
				
				sql+= ") WHERE R BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(start));
			pstmt.setString(2, String.valueOf(end));
			rs = pstmt.executeQuery();
			List<MembershipDto> list = new ArrayList<>();
			while (rs.next()) {
				list.add(convertMember(rs));
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}/////////////////////////////////////////////////////
	
	public void updateName(Connection conn, String name, String editName, String office_no) throws Exception {
		String sql = "UPDATE CBANG_MEMBER SET NAME = ? WHERE NAME = ? AND OFFICE_NO = ?";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, editName);
			pstmt.setString(2, name);
			pstmt.setString(3, office_no);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

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
				rs.getString("path_type"),
				rs.getString("office_photo"),
				rs.getString("permit_photo")
				);
		return dto;
	}
	
	public int getTotalRecordCount(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM CBANG_MEMBER M JOIN REAL_ESTATE_OFFICE O ON M.OFFICE_NO = O.OFFICE_NO JOIN JOIN_PATH P ON M.PATH_CODE = P.PATH_CODE WHERE O.OFFICE_NO IS NOT NULL";
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
	
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(ConnectionProvider.getConnection() !=null) ConnectionProvider.getConnection().close();
		} catch (Exception e) {}
	}////////////////////////

}
