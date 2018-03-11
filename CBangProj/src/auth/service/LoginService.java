package auth.service;

import model.AdminDto;
import model.dao.AdminDao;

public class LoginService {
	
	private AdminDao adminDao = new AdminDao();
	
	public User login(String id, String password) {
		AdminDto adminDto = adminDao.selectById(id);
		
		if(adminDto == null) {
			throw new LoginFailException();
		}
		if(!adminDto.matchPassword(password)) {
			throw new LoginFailException();
		}
		return new User(adminDto.getId(), adminDto.getName());
	}
}
