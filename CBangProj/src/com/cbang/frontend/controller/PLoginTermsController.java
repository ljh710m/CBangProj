package com.cbang.frontend.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbang.frontend.service.MemberService;
import com.cbang.frontend.service.PLoginService;

import model.JoinPathDto;
import service.JoinPathService;

@Controller
public class PLoginTermsController {

	JoinPathService service = new JoinPathService();
	
	@RequestMapping("/ACCOUNT/PLoginTerms.do")
	public String path_code(Model model) throws Exception {
		List<JoinPathDto> pathDto = service.joinPathList(1, service.getTotalRowCount());
		model.addAttribute("path_code",pathDto);
		return "forward:/frontend/account/PLogin.jsp";
	}
	
}
