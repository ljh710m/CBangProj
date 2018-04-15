package com.cbang.frontend.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbang.frontend.service.RoomManageService;
import com.cbang.frontend.service.RoomService;

import model.OfficeDto;
import model.PhotoDto;
import model.RoomDetailDto;
import model.RoomManageDto;
import model.RoomOptionCheckDto;
import model.RoomOptionListDto;
import model.RoomTypesDto;
import model.TradeTypeDto;
import service.RoomOptionListService;
import service.RoomTypesService;
import util.PagingUtil;

@Controller
public class RoomManagerController {
	
	@Resource(name="roomManageService")
	RoomManageService roomManageService;
	
	@Resource(name="roomService")
	private RoomService roomService;
	
	private RoomTypesService roomTypesService = new RoomTypesService();
		
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
		
	@RequestMapping("/Manage/RoomEdit.do")
	public String editRoom(
			@RequestParam(value="room_no", required=true) String room_no,
			Model model
			) {
		
		List<RoomTypesDto> roomTypesList = roomTypesService.roomTypesList(1, roomTypesService.getTotalRowCount());
				
		RoomDetailDto roomDetail = roomService.roomDetail(room_no);
		
		if(roomDetail.getRent_type().equals("전세") && roomDetail.getDeposit1().indexOf("억") != -1) {
			String[] deposit = roomDetail.getDeposit1().split("억");
			int a = Integer.parseInt(deposit[0]) * 10000;
			int b = 0;
			if(deposit.length != 1) {
				b = Integer.parseInt(deposit[1]);				
			}
						
			roomDetail.setDeposit1(String.valueOf(a+b));			
		}
		
		List<RoomOptionCheckDto> roomOption = roomService.roomOption(room_no);
		List<PhotoDto> roomPhotoList = roomService.roomPhotoList(room_no);
		List<TradeTypeDto> roomTradeType = roomService.roomTradeType(room_no);	
		
		model.addAttribute("roomTypesList",roomTypesList);
		
		model.addAttribute("roomDetail",roomDetail);
		model.addAttribute("roomOption", roomOption);
		model.addAttribute("roomPhotoList", roomPhotoList);
		model.addAttribute("roomTradeType", roomTradeType);		
		
		return "forward:/frontend/manage/editRoom.jsp";
	}	
	
	@ResponseBody
	@RequestMapping("/Manage/RoomComplete.do")	
	public String completeRoom(@RequestParam Map map) {
		roomManageService.roomComplete(map);
		
		return "Y";		
	}
	
	@ResponseBody
	@RequestMapping("/Manage/RoomDelete.do")
	public String deleteRoom(@RequestParam Map map) {
		roomManageService.roomDelete(map);		
		
		return "Y";
	}
	
	@RequestMapping("/Manager/RoomContact.do")
	public String contactRoom(
			@RequestParam Map map,
			@RequestParam(required=false,defaultValue="1") int nowPage,
			HttpServletRequest req,
			Model model) throws Exception{
		String member_no = req.getSession().getAttribute("member_no").toString();
		
		//페이징을 위한 로직 시작]
		int pageSize = 10;
		int blockPage = 10;
		
		//전체 레코드 수
		int totalRecordCount = roomManageService.getTotalContactCount(member_no);
		
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;
		
		map.put("start", start);
		map.put("end", end);
		//페이징을 위한 로직 끝]
		map.put("member_no", member_no);
						
		List<RoomManageDto> list = roomManageService.selectContactList(map);
		String pagingString = PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/Manager/RoomContact.do?");
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		
		return "forward:/frontend/manage/contactRoom.jsp";
	}
	
}
