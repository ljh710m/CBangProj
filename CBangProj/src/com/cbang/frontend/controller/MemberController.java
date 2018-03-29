package com.cbang.frontend.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbang.frontend.service.MemberService;

import model.MemberDto;

@Controller
public class MemberController {
	//서비스 주입]
	@Resource(name="memberService")
	private MemberService service;
	
	@ResponseBody
	@RequestMapping("/Account/Join.do")
	public String join(MemberDto dto) throws Exception{		
		int result = service.insert(dto);
		
		return Integer.toString(result);
	}

}
