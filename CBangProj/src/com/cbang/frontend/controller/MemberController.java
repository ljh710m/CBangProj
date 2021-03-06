package com.cbang.frontend.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cbang.frontend.service.MemberService;

import model.MemberDto;

@SessionAttributes({"member_no","name","trade_type"})
@Controller
public class MemberController {
	//서비스 주입]
	@Resource(name="memberService")
	private MemberService service;
	
	//회원가입 처리]
	@ResponseBody
	@RequestMapping("/Account/Join.do")
	public String join(MemberDto dto) throws Exception{		
		int result = service.insert(dto);
		
		return Integer.toString(result);
	}
	
	//로그인 처리]
	@ResponseBody
	@RequestMapping("/Account/Login.do")
	public String login(@RequestParam Map map, Model model) throws Exception{		
		JSONObject errorInfo = new JSONObject();
		MemberDto dto = service.login(map);
		if(dto == null) {
			errorInfo.put("notExistEmail", true);
		}
		else if(!dto.matchPassword(map.get("password").toString())) {
			errorInfo.put("pwdNotMatch", true);			
		}
		else {			
			model.addAttribute("member_no",	dto.getMember_no());
			model.addAttribute("name", dto.getName());
			if(dto.getOffice_no()==null) {
				model.addAttribute("trade_type","직거래");
			}
			else {
				model.addAttribute("trade_type","중개");
			}
		}
		
		return errorInfo.toJSONString();
	}
	
	//로그아웃 처리]
	@RequestMapping("/Account/Logout.do")
	public String logout(SessionStatus status,HttpServletRequest req) throws Exception{
		/* 로그 아웃처리-세션영역에 속성 삭제]
		 * Session 에 등록된 SimpleForm 은 SessionStatus.setComplete()을 실행하기 전까지는
		 * Session에서 내부의 데이터를 유지하게 된다. SessionStatus.setComplete()을 실행하면
		 * Controller에서 선언해둔 SessionAttribute에 등록된 form이 초기화된다. 
		 */	
		status.setComplete();
		
		return "redirect:/index.jsp";
	}
}
