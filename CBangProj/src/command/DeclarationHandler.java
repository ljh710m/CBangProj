package command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeclarationDto;
import model.MembershipDto;
import model.PhotoDto;
import mvc.command.CommandHandler;
import service.DeclarationService;
import util.DeclarationPagingUtil;
import util.MembershipPagingUtil;

public class DeclarationHandler implements CommandHandler {

	private DeclarationService service = new DeclarationService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		selectFault(req, resp);
		sendList(req);
		return "/backend/Declaration.jsp";
	}
	
	private void selectFault(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<DeclarationDto> members = service.selectList(1, 5);
		DeclarationDto dto = new DeclarationDto(); 
		for(int i = 0; i < members.size(); i++) {
			String photoName = photo(members.get(i).getRoom_no());
			members.get(i).setPhoto(photoName);
		}
		req.setAttribute("members", members);
	}
	
	private String photo(String room_no) throws Exception {
		String fileName = service.selectPhoto(room_no);
		return fileName;
	}
	
	private void sendList(HttpServletRequest req) {
		// 페이징을 위한 로직 시작]
		// 전체 레코드 수
		int totalRecordCount = service.getTotalRowCount();
		int pageSize = 5;
		int blockPage = 5;
		int nowPage = 1;

		String page = req.getParameter("nowPage");
		if(page != null)
			nowPage = Integer.parseInt(page);
		
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		if(nowPage > totalPage) nowPage = totalPage;
		
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;		
		//페이징을 위한 로직 끝]
		
		List<DeclarationDto> list = service.selectList(start, end);
		String pagingText = DeclarationPagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, null);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalRecordCount", totalRecordCount);
		map.put("pageSize", pageSize);
		map.put("blockPage", blockPage);
		map.put("nowPage", nowPage);
		
		req.setAttribute("list", list);
		req.setAttribute("paging", pagingText);
		req.setAttribute("map", map);
	}

}
