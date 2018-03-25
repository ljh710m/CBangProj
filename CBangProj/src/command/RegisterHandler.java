package command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import service.DuplicatedException;
import service.RegisterRequest;
import service.RegisterService;

public class RegisterHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/backend/register.jsp";
	private RegisterService registerService = new RegisterService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, resp);
		}
		else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, resp);
		}
		else {
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;			
		}		
	}
	
	private String processForm(HttpServletRequest req,HttpServletResponse resp) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req,HttpServletResponse resp) {
		RegisterRequest regReq = new RegisterRequest();
		regReq.setId(req.getParameter("id"));
		regReq.setPassword((req.getParameter("password1")));
		regReq.setConfirmPassword(req.getParameter("password2"));
		regReq.setName(req.getParameter("name"));		
		regReq.setEmail(req.getParameter("email"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		regReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			registerService.register(regReq);			
			return "/backend/login.jsp";
		} catch(DuplicatedException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		} 
	}

}