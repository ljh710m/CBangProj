package com.cbang.frontend.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbang.frontend.service.SearchService;

import model.SearchDto;

@Controller
public class SearchController {	
	//서비스 주입]
	@Resource(name="searchService")
	private SearchService searchService;
	
	@RequestMapping(value="/Search/Map.do")
	public String initMap(Model model) {				
				
		model.addAttribute("lists", searchService.listsMap());
				
		return "forward:/frontend/search/map.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/Search/MapSearch.do", produces = "text/html; charset=utf8")
	public String searchMap(@RequestParam Map map, HttpSession session) {
		JSONArray listArray = new JSONArray();
		JSONObject optionInfo = null;
		
		List<SearchDto> list = searchService.searchRoom(map, session);
		for(int i=0; i<list.size(); i++) {
			optionInfo = new JSONObject();
			optionInfo.put("room_no", list.get(i).getRoom_no());
			optionInfo.put("rent_type", list.get(i).getRent_type());
			optionInfo.put("deposit1", list.get(i).getDeposit1());
			optionInfo.put("deposit2", list.get(i).getDeposit2());
			optionInfo.put("month_price", list.get(i).getMonth_price());
			optionInfo.put("trade_type", list.get(i).getTrade_type());
			optionInfo.put("room_type", list.get(i).getRoom_type());
			optionInfo.put("floor", list.get(i).getFloor());
			optionInfo.put("area", Math.round((Double.parseDouble(list.get(i).getArea())*3.3058)*10)/10.0);			
			optionInfo.put("parking", list.get(i).isParking());
			optionInfo.put("pat", list.get(i).isPat());
			optionInfo.put("short_term", list.get(i).isShort_term());
			optionInfo.put("common_charge", list.get(i).getCommon_charge());
			optionInfo.put("room_title", list.get(i).getRoom_title());
			optionInfo.put("stored_file_name", list.get(i).getStored_file_name());
			optionInfo.put("lat", list.get(i).getLat());
			optionInfo.put("lng", list.get(i).getLng());
			optionInfo.put("favorite", list.get(i).isFavorite());
			listArray.add(optionInfo);
		}
		
		return listArray.toJSONString();		
	}
}
