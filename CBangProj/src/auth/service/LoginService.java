package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import model.AdminDto;
import model.dao.AdminDao;

public class LoginService {
	
	private AdminDao adminDao = new AdminDao();
	
	public User login(String id, String password) {
		try(Connection conn = ConnectionProvider.getConnection()){
			AdminDto adminDto = adminDao.selectById(conn, id);
			
			if(adminDto == null) {
				throw new LoginFailException();
			}
			if(!adminDto.matchPassword(password)) {
				throw new LoginFailException();
			}
			return new User(adminDto.getId(), adminDto.getName());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}		
	}
}
