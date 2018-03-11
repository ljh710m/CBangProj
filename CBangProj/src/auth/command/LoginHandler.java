package auth.command;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/backend/login.jsp";
	private LoginService loginService = new LoginService();

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
	
	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		//폼에서 전송한 id 파라미터와 password 파라미터 값을 구한다.
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		//에러 정보를 담을 맵 객체를 생성하고 errors 속성에 저장한다.
		Map<String , Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		//id나 password 값이 없을 경우 에러를 추가한다.
		if(id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if(password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);
		//에러가 존재하면 폼 뷰를 리턴한다.
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			//loginService.login()을 이용해서 인증을 수행한다. 로그인에 성공하면 User 객체를 리턴한다.
			User user = loginService.login(id, password);
			//User 객체를 세션의 authAdmin 속성에 저장한다.
			req.getSession().setAttribute("authAdmin", user);
			//admin.jsp로 리다이렉트한다.
			resp.sendRedirect(req.getContextPath() + "/backend/admin/admin.jsp");
			return null;
		} catch (LoginFailException e) {
			//로그인에 실패해서 LoginFailException이 발생하면 해당 에러를 추가하고, 폼을 위한 뷰를 리턴한다.
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	
	private String trim(String str) {
		return str == null? null : str.trim();
	}

}
