package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;

public class DashboardDao {
	
	//전체 회원 수]
	public int getTotalMemberCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM cbang_member";
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;			
		} 
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);			
		}	
	}
	
	//전체 매물 수]
	public int getTotalRoomCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM room WHERE state='거래중'";
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;			
		} 
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);			
		}	
	}	
	
	
}
