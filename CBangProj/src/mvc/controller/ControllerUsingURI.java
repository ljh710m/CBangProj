package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

public class ControllerUsingURI extends HttpServlet{
	
	//<커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<String, CommandHandler>();
	
	@Override
	public void init() throws ServletException{
		//configFIle 초기화 파라미터의 값을 읽어온다.
		String configFile = getInitParameter("configFile");
		//Properties는 (이름,값) 목록을 갖는 클래스
		Properties prop = new Properties();
		//설정 파일 경로를 구한다.
		String configFilePath = getServletContext().getRealPath(configFile);		
		//설정 파일로부터 매핑 정보를 읽어와 Properties 객체에 저장
		try (FileReader fis = new FileReader(configFilePath)){
			prop.load(fis);
		} catch(IOException e) {
			throw new ServletException(e);			
		}
		//Properties에 저장된 각 프로퍼티의 키에 대해 다음 작업을 반복
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			//1.프로퍼티 이름을 커맨드 이름으로 사용
			String command = (String)keyIter.next();
			//2.커맨드 이름에 해당하는 핸들러 클래스 이름을 Properties에서 구한다.
			String handlerClassName = prop.getProperty(command);			
			try {
				//3.핸들러 클래스 이름을 이용해서 Class 객체를 구한다.
				Class<?> handlerClass = Class.forName(handlerClassName);
				//4.Class로부터 핸들러 객체를 생성. 즉, 2번 과정에서 구한 이름에 해당하는 클래스의 객체를 생성
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				//5.commandHandlerMap에 (커맨드, 핸들러 객체) 매핑 정보를 저장
				commandHandlerMap.put(command, handlerInstance);				
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);				
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		process(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);		
	}
	
	private void process(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		//요청 URI를 명령어로 사용하기 위해 명령어를 구한다.
		String command = request.getRequestURI();		
		if(command.indexOf(request.getContextPath())==0) {
			command = command.substring(request.getContextPath().length());
		}
		//commandHandlerMap에서 요청을 처리할 핸들러 객체를 구한다.
		CommandHandler handler = commandHandlerMap.get(command);		
		//명령어에 해당하는 핸들러 객체가 존재하지 않을 경우 NullHandler를 사용한다.
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			//구한 핸들러 객체의 process()메서드를 호출해서 요청을 처리하고, 결과로 보여줄 뷰 페이지 경로를 전달받는다.
			viewPage = handler.process(request, response);
		} catch (Throwable e) {		
			throw new ServletException(e);
		}
		//viwPage가 null이 아닐 경우, 핸들러 인스턴스가 리턴한 뷰 페이지로 이동
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}