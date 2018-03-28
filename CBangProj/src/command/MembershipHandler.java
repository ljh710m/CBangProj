package command;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminPrivilegeDto;
import model.MembershipDto;
import mvc.command.CommandHandler;
import service.MembershipService;
import util.MembershipPagingUtil;
import util.SimplePagingUtil;

public class MembershipHandler implements CommandHandler{
	
	private MembershipService service = new MembershipService();
	
	@Override  
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String office_no = req.getParameter("memberIdx");
		List<MembershipDto> memberOne = service.selectList(0, 0, office_no);
		
		/*for(int i = 0; i < memberOne.size(); i++) {
			System.out.println(memberOne.get(i).getOffice_no());
		}*/
		req.setAttribute("memberOne", memberOne); 

		sendList(req);
		return "/backend/membership.jsp";
	}
	
	private void sendList(HttpServletRequest req) {
		//페이징을 위한 로직 시작]		
		//전체 레코드 수
		int totalRecordCount = service.getTotalRowCount();
		int pageSize = 5;
		int blockPage = 5;
		int nowPage = 1;
		/*if(req.getParameter("mode") != null)*/ 
		nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		if(nowPage > totalPage) nowPage = totalPage;
		
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;		
		//페이징을 위한 로직 끝]
		
		List<MembershipDto> list = service.selectList(start, end, null);
		String pagingText = MembershipPagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, null);
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
