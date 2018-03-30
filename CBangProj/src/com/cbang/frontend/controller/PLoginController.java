package com.cbang.frontend.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cbang.frontend.service.PLoginService;

import model.MembershipDto;

@SessionAttributes({"memer_no","name"})
@Controller
public class PLoginController {

	@Resource(name="pLoginService")
	private PLoginService service;
	
	@RequestMapping("/ACCOUNT/PLogin.do")
	public String join(MembershipDto dto) throws Exception{
		service.insert(dto);
		service.pInsert(dto);
		
		return "redirect:index.jsp";
	}
	
	
	
	
	
}
