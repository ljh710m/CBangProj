package service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.AdminDto;
import model.dao.AdminDao;

public class RegisterService {
	
	private AdminDao adminDao = new AdminDao();
	
	public void register(RegisterRequest regReq) {
		Connection conn = null;
		try {
			//DB 커넥션을 구하고, 트랜잭션을 시작
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			AdminDto adminDto = adminDao.selectById(conn, regReq.getId());
			if(adminDto != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicatedException();
			}
						
			adminDao.insert(conn,
					new AdminDto(
							null,
							regReq.getId(),							
							regReq.getPassword(),							
							regReq.getName(),					
							regReq.getEmail(),
							null)
					);
			conn.commit();			
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch(Exception e) {} 
		finally {
			JdbcUtil.close(conn);
		}
	}
}