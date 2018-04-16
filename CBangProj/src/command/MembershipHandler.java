package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.ResponseBody;

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
		if(req.getParameter("mode") != null) {
			String mode = req.getParameter("mode");
			if(mode.equals("detail")) {
				selectOne(req,resp);
				return null;
			}
			else if (mode.equals("rock")) {
				String name = req.getParameter("name");
				String editName = name + "(rock)";
				String office_no = req.getParameter("office_no");
				service.updateName(name, editName, office_no);
				JSONObject rock = new JSONObject();
				rock.put("name", name);
				rock.put("editName", "editName");
				resp.setCharacterEncoding("UTP-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();

				out.print(rock.toJSONString());
				out.flush();
				return null;

			}
		}
		else
			sendList(req);
		return "/backend/membership.jsp";		
	}
	
	private String selectOne(HttpServletRequest req, HttpServletResponse resp) {
		String office_no = req.getParameter("office_no");
		List<MembershipDto> member = service.selectList(0, 1, office_no);
		JSONObject modalInfo = new JSONObject();
		
		modalInfo.put("profile_photo", member.get(0).getProfile_photo());
		modalInfo.put("office_no", member.get(0).getOffice_no());
		modalInfo.put("name", member.get(0).getName());
		modalInfo.put("phone", member.get(0).getPhone()); 
		modalInfo.put("email", member.get(0).getEmail());
		modalInfo.put("permit_no", member.get(0).getPermit_no());
		modalInfo.put("address", member.get(0).getAddress());
		modalInfo.put("office_name", member.get(0).getOffice_name());
		modalInfo.put("office_phone", member.get(0).getOffice_phone());
		modalInfo.put("job", member.get(0).getJob());
		modalInfo.put("represent", member.get(0).getRepresent());
		modalInfo.put("join_date", member.get(0).getJoin_date().toString());
		modalInfo.put("path_code", member.get(0).getPath_code());
		modalInfo.put("path_type", member.get(0).getPath_type());
		
		try {
			resp.setCharacterEncoding("UTP-8");
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			
			out.print(modalInfo.toJSONString());
			out.flush();
			
		} catch (IOException e) {
			System.out.println("selectOne()에러");
		}
		return modalInfo.toJSONString();
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
