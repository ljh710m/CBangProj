package com.cbang.frontend.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cbang.frontend.service.RoomService;

import model.DetailDto;
import model.LocationsDto;
import model.RoomDto;

@Controller
public class RoomRegisterController {
	//서비스 주입]
	@Resource(name="roomService")
	private RoomService service;
	
	@ResponseBody
	@RequestMapping("/Manage/RegisterRoom.do")
	public String registerRoom(
			MultipartHttpServletRequest req,
			LocationsDto locationsDto,
			RoomDto roomDto,
			DetailDto detailDto,
			HttpSession session
			) throws Exception{
		//@RequestParam("photo") MultipartFile[] file
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String, String>> tradeList = new ArrayList<Map<String, String>>();
		Map<String, String> tradeMap;
		
		roomDto.setMember_no(session.getAttribute("member_no").toString());
		roomDto.setTrade_type(session.getAttribute("trade_type").toString());
		
		List<String> deposit2 = new ArrayList<>();
		List<String> month_price = new ArrayList<>();		
		if(req.getParameter("deposit2").length() !=0) {			
			Collections.addAll(deposit2,req.getParameter("deposit2").split(","));
			Collections.addAll(month_price,req.getParameter("month_price").split(","));			
		}
		
		if(roomDto.getRent_type().equals("월세")) {
			if(roomDto.getDeposit1() != "") {
				tradeMap = new HashMap<String, String>();
				tradeMap.put("deposit1",roomDto.getDeposit1());
				tradeMap.put("deposit2","");
				tradeMap.put("month_price","");
				tradeList.add(tradeMap);
			}
			roomDto.setDeposit1("");
			
			roomDto.setDeposit2(deposit2.get(0));
			roomDto.setMonth_price(month_price.get(0));			
			if(deposit2.size() !=0) {
				deposit2.remove(0);
				month_price.remove(0);				
			}			
		}
		else {
			roomDto.setDeposit2("");
			roomDto.setMonth_price("");			
		}		
		if(deposit2.size() != 0) {
			for(int i=0; i<deposit2.size();i++) {
				tradeMap =  new HashMap<String, String>();
				tradeMap.put("deposit1", "");
				tradeMap.put("deposit2", deposit2.get(i));
				tradeMap.put("month_price", month_price.get(i));
				tradeList.add(tradeMap);
			}
			map.put("tradeList", tradeList);
		}

		List<String> building_option = new ArrayList<String>();
		if(req.getParameter("parking").length() != 0) building_option.add(req.getParameter("parking"));		
		if(req.getParameter("pat").length() != 0) building_option.add(req.getParameter("pat"));
		if(req.getParameter("short_term").length() != 0) building_option.add(req.getParameter("short_term"));
		
		map.put("deposit2", deposit2);
		map.put("month_price", month_price);
		if(building_option.size() != 0) map.put("building_option", building_option);
		if(req.getParameter("room_option").length() != 0) map.put("room_option", req.getParameter("room_option").split(","));		
		
		service.insert(locationsDto,roomDto,detailDto,map,req);
		
		//return "redirect:/index.jsp";
		return "Y";
	}
	
}
