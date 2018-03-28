package command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JoinPathDto;
import mvc.command.CommandHandler;
import service.JoinPathService;
import util.SimplePagingUtil;

public class JoinPathHandler implements CommandHandler {
	
	private JoinPathService service = new JoinPathService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String mode = req.getParameter("mode");
		
		if(mode != null) {
			if(mode.equals("regit")) {//등록
				service.insert(req.getParameter("join_type"));		
			}
			else if(mode.equals("edit")){//수정
				service.update(req.getParameter("join_type"), req.getParameter("join_code"));			
			}
			else if(mode.equals("delete")) {//삭제
				service.delete(req.getParameter("join_code"));
			}
		}
		
		sendList(req);
		
		return "/backend/joinPath.jsp";		
	}
	
	private void sendList(HttpServletRequest req) {
		//페이징을 위한 로직 시작]		
		//전체 레코드 수
		int totalRecordCount = service.getTotalRowCount();
		int pageSize = 5;
		int blockPage = 5;
		int nowPage = 1;
		if(req.getParameter("mode") != null) nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		if(nowPage > totalPage) nowPage = totalPage;
		
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;		
		//페이징을 위한 로직 끝]
		
		List<JoinPathDto> list = service.joinPathList(start, end);
		String pagingText = SimplePagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, null);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalRecordCount", totalRecordCount);
		map.put("pageSize", pageSize);
		map.put("blockPage", blockPage);
		map.put("nowPage", nowPage);
		
		req.setAttribute("joinPathList", list);
		req.setAttribute("paging", pagingText);
		req.setAttribute("map", map);
	}
}
