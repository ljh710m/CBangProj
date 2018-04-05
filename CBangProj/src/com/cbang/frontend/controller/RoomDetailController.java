package com.cbang.frontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RoomDetailController {
	
	@RequestMapping("/Room/Detail.do")
	public String detailRoom(@RequestParam(value="roomNo", required=true) String roomNo, Model model) {
		
		
		return "forward:/frontend/room/detail.jsp";
	}
}
