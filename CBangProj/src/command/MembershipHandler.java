package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MembershipDto;
import mvc.command.CommandHandler;
import service.MembershipService;

public class MembershipHandler implements CommandHandler{
	
	private MembershipService service = new MembershipService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<MembershipDto> list = service.selectList(1, 10);
		req.setAttribute("list", list);
		
		return "/backend/admin/membership.jsp";
	}
	
}
