package com.cbang.frontend.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.RoomTypesDto;
import service.RoomTypesService;

@Controller
public class RoomFormController {
	
	private RoomTypesService roomTypesService = new RoomTypesService();  
		
	@RequestMapping("/Form/RegisterRoom.do")
	public String registerRoomForm(Model model) throws Exception{
		
		List<RoomTypesDto> roomTypesList = roomTypesService.roomTypesList(1, roomTypesService.getTotalRowCount());
		
		model.addAttribute("roomTypesList",roomTypesList);		
		
		return "forward:/frontend/manage/NewRoom.jsp";
	}	
}
