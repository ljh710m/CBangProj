package com.cbang.frontend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbang.frontend.service.DeclarationService;

@Controller
public class declarationController {
	
	@Resource(name="declarationService")
	private DeclarationService service;
	
	@ResponseBody
	@RequestMapping("/ROOM/declaration.do")
	public String updateRoom(@RequestParam Map<String, String> map, Model model) throws Exception {
		String type = map.get("type");
		String add_info = map.get("add_info");
		String phone = map.get("phone");
		String room_no = map.get("room_no");
		
		Map<String, String> updateMap = new HashMap<String, String>();
		if(type != null) {//둘중 하나
			updateMap.put("type", type);
			updateMap.put("room_no", room_no);
			updateMap.put("add_info", add_info);
			updateMap.put("phone", phone);
			service.update(updateMap);
			service.insert(updateMap);
		}
		
		return "Y";
	}

}
