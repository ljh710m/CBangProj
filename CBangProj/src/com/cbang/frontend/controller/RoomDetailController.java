package com.cbang.frontend.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cbang.frontend.service.RoomService;

import model.OfficeDto;
import model.PhotoDto;
import model.RoomDetailDto;
import model.RoomOptionCheckDto;
import model.TradeTypeDto;

@Controller
public class RoomDetailController {
	
	@Resource(name="roomService")
	private RoomService service;
	
	@RequestMapping("/Room/Detail.do")
	public String detailRoom(@RequestParam(value="roomNo", required=true) String roomNo, Model model) {
		
		RoomDetailDto roomDetail = service.roomDetail(roomNo);		
		List<RoomOptionCheckDto> roomOption = service.roomOption(roomNo);
		List<PhotoDto> roomPhotoList = service.roomPhotoList(roomNo);
		List<TradeTypeDto> roomTradeType = service.roomTradeType(roomNo);
		
		model.addAttribute("roomDetail",roomDetail);
		model.addAttribute("roomOption", roomOption);
		model.addAttribute("roomPhotoList", roomPhotoList);
		model.addAttribute("roomTradeType", roomTradeType);
		if(roomDetail.getTrade_type().equals("중개")) {
			OfficeDto officeInfo = service.officeInfo(roomDetail.getOffice_no());
			model.addAttribute("officeInfo", officeInfo);
		}
			
		return "forward:/frontend/room/detail.jsp";
	}
}