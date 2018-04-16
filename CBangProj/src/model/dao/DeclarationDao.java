package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.DeclarationDto;

public class DeclarationDao {
	
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public String selectOne(Connection conn, String room_no) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		String sql = "SELECT stored_file_name FROM PHOTO WHERE ROOM_NO = ? AND DEL_GB = 'Y'";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, room_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String fileName = rs.getString("stored_file_name");
				return fileName;
			}
			return "대표사진 없음";
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<DeclarationDto> selectList(Connection conn, int start, int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		String sql = "SELECT * FROM (SELECT F.*,R.LOCATION_CODE,ROWNUM R FROM FAULT F JOIN ROOM R ON F.ROOM_NO = R.ROOM_NO) WHERE R BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(start));
			pstmt.setString(2, String.valueOf(end));
			rs = pstmt.executeQuery();
			List<DeclarationDto> list = new ArrayList<>();
			while (rs.next()) {
				list.add(convertMember(rs));
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}/////////////////////////////////////////////////////

	private DeclarationDto convertMember(ResultSet rs) throws SQLException{
		DeclarationDto dto = new DeclarationDto(
				rs.getString("fault_no"),
				rs.getString("type"),
				rs.getString("add_info"),
				rs.getString("phone"),
				rs.getString("room_no")
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
