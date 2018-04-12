package com.cbang.frontend.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbang.frontend.service.RoomManageService;

import model.RoomManageDto;
import util.PagingUtil;

@Controller
public class RoomManagerController {
	
	@Resource(name="roomManageService")
	RoomManageService roomManageService;
	
	@RequestMapping("/Manager/ManagerRoom.do")
	public String manageRoom(
			@RequestParam Map map,
			Model model,
			HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		String member_no = req.getSession().getAttribute("member_no").toString();
		
		//페이징을 위한 로직 시작]
		int pageSize = 10;
		int blockPage = 10;
		
		//전체 레코드 수
		int totalRecordCount = roomManageService.getTotalRowCount(member_no);
		
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;
		
		map.put("start", start);
		map.put("end", end);
		//페이징을 위한 로직 끝]
		map.put("member_no", member_no);
						
		List<RoomManageDto> list = roomManageService.selectList(map);
		String pagingString = PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/Manager/ManagerRoom.do?");
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		
		return "forward:/frontend/manage/modify.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/Manage/RoomMemo.do")	
	public String modifyMemo(@RequestParam Map map) {
		roomManageService.modifyMemo(map);		
		
		return "Y";		
	}
	
	@ResponseBody
	@RequestMapping("/Manage/RoomComplete.do")	
	public String completeRoom(@RequestParam Map map) {
		roomManageService.roomComplete(map);
		
		return "Y";		
	}
	
	
	
}
