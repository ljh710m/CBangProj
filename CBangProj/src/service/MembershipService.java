package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.servlet.ServletContext;

import jdbc.connection.ConnectionProvider;
import model.MembershipDto;
import model.dao.MembershipDao;

public class MembershipService {
	
	private MembershipDao dao = new MembershipDao();
	
	public List<MembershipDto> selectList(int start, int end) {
		
		try (Connection conn = ConnectionProvider.getConnection()){
			List<MembershipDto> list = dao.membershipList(conn, start, end);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
