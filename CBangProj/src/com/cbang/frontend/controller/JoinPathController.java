package com.cbang.frontend.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.JoinPathDto;
import service.JoinPathService;

@Controller
public class JoinPathController {
	
	JoinPathService service = new JoinPathService();
		
	@ResponseBody
	@RequestMapping(value = "/Account/JoinPath.do", produces = "text/html; charset=utf8")
	public String sendJoinPath() throws Exception{		
		JSONArray listArray = new JSONArray();
		JSONObject optionInfo = null;
		
		List<JoinPathDto> list = service.joinPathList(1, service.getTotalRowCount());		
		
		for(int i=0; i<list.size(); i++) {
			optionInfo = new JSONObject();
			optionInfo.put("path_code", list.get(i).getPath_code());
			optionInfo.put("path_type", list.get(i).getPath_type());
			listArray.add(optionInfo);
		}		
		
		return listArray.toJSONString();		
	}
}
