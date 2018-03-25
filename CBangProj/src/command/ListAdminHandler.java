package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import service.AdminPage;
import service.ListAdminService;

public class ListAdminHandler implements CommandHandler{
	
	private ListAdminService listService = new ListAdminService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		AdminPage adminPage = listService.getAdminPage();
		req.setAttribute("adminPage", adminPage);		
		
		return "/backend/listAdmin.jsp";
	}

}
