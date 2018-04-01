package com.cbang.frontend.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.RoomOptionListDto;
import model.RoomTypesDto;
import service.RoomOptionListService;
import service.RoomTypesService;

@Controller
public class RoomFormController {
	
	private RoomTypesService roomTypesService = new RoomTypesService();
	private RoomOptionListService roomOptionListService = new RoomOptionListService();
		
	@RequestMapping("/Form/RegisterRoom.do")
	public String registerRoomForm(Model model) throws Exception{
		
		List<RoomTypesDto> roomTypesList = roomTypesService.roomTypesList(1, roomTypesService.getTotalRowCount());
		List<RoomOptionListDto> roomOptionList = roomOptionListService.roomOptionList(1, roomOptionListService.getTotalRowCount());
				
		model.addAttribute("roomTypesList",roomTypesList);
		model.addAttribute("roomOptionList",roomOptionList);
		
		return "forward:/frontend/manage/NewRoom.jsp";
	}	
}
