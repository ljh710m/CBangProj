package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import model.AdminDto;
import model.dao.AdminDao;

public class ListAdminService {
	private AdminDao adminDao = new AdminDao();
	
	public AdminPage getAdminPage() {
		try(Connection conn = ConnectionProvider.getConnection()){
			int total = adminDao.selectCount(conn);
			List<AdminDto> content = adminDao.select(conn);
			return new AdminPage(total, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
