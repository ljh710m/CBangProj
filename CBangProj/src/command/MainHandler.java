package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import service.DashboardService;

public class MainHandler implements CommandHandler{

	DashboardService DashboardService = new DashboardService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
				
		int totalMemberCount = DashboardService.totalMembercount();
		int totalRoomCount = DashboardService.totalRoomcount();
		
		req.setAttribute("totalMembercount", totalMemberCount);
		req.setAttribute("totalRoomCount", totalRoomCount);
		
		return "/backend/admin.jsp";
	}

}