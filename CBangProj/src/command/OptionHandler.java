package command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuildingOptionListDto;
import model.RoomTypesDto;
import mvc.command.CommandHandler;
import service.BuildingOptionListService;
import service.RoomTypesService;
import util.SimplePagingUtil;

public class OptionHandler implements CommandHandler{
	
	private BuildingOptionListService buildingOptionservice = new BuildingOptionListService();
	private RoomTypesService roomTypesService = new RoomTypesService();
	private int pageSize =5; //페이지당 나타낼 옵션 수 
	private int blockPage = 5; //한 화면에 나타낼 페이징 수
	private int nowPage = 1; //현재 페이지
		
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//건물 옵션
		buildingOption(req);
		//방 종류
		roomType(req);
						
		return "/backend/OptionManage.jsp";
	}
	
	private void buildingOption(HttpServletRequest req) {		
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount = buildingOptionservice.getTotalRowCount();
		//전체 페이지수
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;
		//페이징을 위한 로직 끝]
		List<BuildingOptionListDto> list = buildingOptionservice.buildingOptionList(start,end);
		String pagingText = SimplePagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, null);
		Map<String, Integer> buildingMap = new HashMap<String, Integer>();
		buildingMap.put("totalRecordCount", totalRecordCount);
		buildingMap.put("pageSize", pageSize);
		buildingMap.put("blockPage", blockPage);
		buildingMap.put("nowPage", nowPage);
		
		req.setAttribute("buildingOptionList", list);
		req.setAttribute("buildingPaging", pagingText);
		req.setAttribute("buildingMap", buildingMap);
	}
	
	private void roomType(HttpServletRequest req) {
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount = roomTypesService.getTotalRowCount();
		//전체 페이지수
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;
		//페이징을 위한 로직 끝]
		List<RoomTypesDto> list = roomTypesService.roomTypesList(start, end);
		String pagingText = SimplePagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, null);
		Map<String, Integer> roomMap = new HashMap<String, Integer>();
		roomMap.put("totalRecordCount", totalRecordCount);
		roomMap.put("pageSize", pageSize);
		roomMap.put("blockPage", blockPage);
		roomMap.put("nowPage", nowPage);
		
		req.setAttribute("roomTypesList", list);
		req.setAttribute("roomPaging", pagingText);
		req.setAttribute("roomMap", roomMap);		
	}

}
