package com.cbang.frontend.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbang.frontend.service.RoomService;

import model.OfficeDto;
import model.PhotoDto;
import model.RoomDetailDto;
import model.RoomOptionCheckDto;
import model.TradeTypeDto;
import util.CookieUtils;

@Controller
public class RoomDetailController {
	
	@Resource(name="roomService")
	private RoomService service;
	
	@RequestMapping("/Room/Detail.do")
	public String detailRoom(
			@RequestParam(value="roomNo", required=true) String roomNo,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session,
			Model model) {
				
		CookieUtils cookieUtils = new CookieUtils();
		try {
			cookieUtils.setCookie("visited", roomNo, 0, req, resp);
		} catch (UnsupportedEncodingException e) {e.printStackTrace();}
		
		RoomDetailDto roomDetail = service.roomDetail(roomNo);		
		List<RoomOptionCheckDto> roomOption = service.roomOption(roomNo);
		List<PhotoDto> roomPhotoList = service.roomPhotoList(roomNo);
		List<TradeTypeDto> roomTradeType = service.roomTradeType(roomNo);
		if(session.getAttribute("member_no")!=null) {
			roomDetail.setFavorite(service.roomFavoriteOne(session.getAttribute("member_no").toString(), roomNo));
		}
		
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
	
	@ResponseBody
	@RequestMapping("/Room/Favorite.do")
	public String favoriteRoom(@RequestParam Map map) {
		if(map.get("mode").equals("insert")) {			
			service.roomFavorite(map);
		}
		else {
			service.roomFavoriteCancle(map);			
		}
		
		return "Y";
	}
	
	@ResponseBody
	@RequestMapping("/Room/Contact.do")
	public String contactRoom(@RequestParam Map map) {
		service.roomContact(map);	
				
		return "Y";
	}	
}