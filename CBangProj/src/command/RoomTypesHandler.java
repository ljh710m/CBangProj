package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.RoomTypesDto;
import mvc.command.CommandHandler;
import service.RoomTypesService;
import util.SimplePagingUtil;

public class RoomTypesHandler implements CommandHandler{
	
	private RoomTypesService service = new RoomTypesService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String mode = req.getParameter("mode");
		if(mode.equals("regit")) {//등록
			register(req,resp);						
		}
		else if(mode.equals("edit")){//수정
			edit(req,resp);			
		}
		else if(mode.equals("delete")) {//삭제
			delete(req,resp);			
		}		
		
		sendList(req,resp);
		
		return null;
	}
	
	private void register(HttpServletRequest req, HttpServletResponse resp) {
		service.insert(req.getParameter("room_type"));		
	}
	
	private void edit(HttpServletRequest req, HttpServletResponse resp) {		
		service.update(req.getParameter("room_type"), req.getParameter("rm_type_code"));		
	}
	
	private void delete(HttpServletRequest req, HttpServletResponse resp) {
		service.delete(req.getParameter("rm_type_code"));
	}	
	
	//건물 옵션 리스트 전송하는 메소드
	private void sendList(HttpServletRequest req, HttpServletResponse resp) {
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount = service.getTotalRowCount();
		int pageSize = 5;
		int blockPage = 5;
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		if(nowPage > totalPage) nowPage = totalPage;
		
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;		
		//페이징을 위한 로직 끝]
		
		JSONObject jsonObject = new JSONObject();
		JSONArray listArray = new JSONArray();
		JSONObject optionInfo = null;
		
		List totalList = null;
		List<RoomTypesDto> list = service.roomTypesList(start,end);
		
		for(int i=0; i<list.size(); i++) {
			optionInfo = new JSONObject();
			optionInfo.put("option_code", list.get(i).getRm_type_code());
			optionInfo.put("name", list.get(i).getRoom_type());
			listArray.add(optionInfo);
		}
				
		jsonObject.put("list", listArray);
		jsonObject.put("pagingText", SimplePagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, null));
		jsonObject.put("totalRecordCount", totalRecordCount);
		jsonObject.put("nowPage", nowPage);
		jsonObject.put("pageSize", pageSize);		
		
		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
						
			out.print(jsonObject.toJSONString());
			out.flush();
									
		} catch (IOException e) {}		
	}

}
