package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.JoinPathCountDto;

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
	
	//일반 회원 수]
	public int getTotalGeneralMemberCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM cbang_member WHERE office_no is null";
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
	
	//신고된 매물 수]
	public int getTotalReportedRoomCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM fault";
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
	
	//회원 가입 경로
	public List<JoinPathCountDto> getJoinPathCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT path_type, path_code, count(*) FROM cbang_member join join_path USING(path_code) GROUP BY path_type, path_code";
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			List<JoinPathCountDto> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertRs(rs));				
			}
			return result;	
		} 
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);			
		}
	}
	
	private JoinPathCountDto convertRs(ResultSet rs) throws SQLException{
		JoinPathCountDto joinPathCountDto = new JoinPathCountDto(
				rs.getString(2),
				rs.getString(1),
				rs.getString(3));
		
		return joinPathCountDto;		
	}
	
}
