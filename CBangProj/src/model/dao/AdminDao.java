package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.AdminDto;

public class AdminDao {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
	public AdminDao() {
		try {
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup("java:comp/env/jdbc/OracleXE");
			conn = source.getConnection();
		}
		catch (NamingException e) {e.printStackTrace();}
		catch (SQLException e) {e.printStackTrace();}
	}
	
	//자원반납용]-사용한 커넥션 객체를 다시 풀에 반납
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			// 커넥션 풀에 커넥션 객체 반납]
			if(conn !=null) conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}
	
	public AdminDto selectById(String id) {
		String sql = "SELECT * FROM cbang_admin where id=?";
		AdminDto adminDto = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();			
			if(rs.next()) {
				adminDto = new AdminDto(
						rs.getString("admin_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("privilege_code"));
			}
		} catch (SQLException e) {		
			e.printStackTrace();			
		}
		return adminDto;
	}
		
	//회원여부 판단용]
	public boolean isMember(String id,String password) {
		String sql="SELECT password,privilege_code FROM cbang_admin WHERE id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString(1);
				String privilege_code=rs.getString(2);
				if(pwd == password)
					return true;
				else return false;
			}
			return false;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false; 
		}		
	}
	
	//입력용]
	public int insert(AdminDto dto) {
		int affected=0;
		String sql="INSERT INTO cbang_admin VALUES(admin_code_seq.nextval,?,?,?,?,2)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getAdmin_code());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getName());			
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) { e.printStackTrace();}
		return affected;
	}

}
