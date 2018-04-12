package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JoinPathCountDto;
import mvc.command.CommandHandler;
import service.DashboardService;

public class MainHandler implements CommandHandler{

	DashboardService DashboardService = new DashboardService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
				
		int totalMemberCount = DashboardService.totalMembercount();
		int totalGeneralMemberCount = DashboardService.totalGeneralMemberCount();
		int totalRoomCount = DashboardService.totalRoomcount();
		int totalReportedRoomCount = DashboardService.totalReportedRoomcount();
		List<JoinPathCountDto> joinPathCount = DashboardService.joinPathCount();
		
		req.setAttribute("totalMembercount", totalMemberCount);
		req.setAttribute("totalGeneralMemberCount", totalGeneralMemberCount);
		req.setAttribute("totalRoomCount", totalRoomCount);
		req.setAttribute("totalReportedRoomCount", totalReportedRoomCount);
		req.setAttribute("joinPathCount", joinPathCount);
		
		return "/backend/admin.jsp";
	}

}