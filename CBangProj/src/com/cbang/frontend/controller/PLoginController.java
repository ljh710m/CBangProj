package com.cbang.frontend.controller;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.cbang.frontend.dao.MemberDao;
import com.cbang.frontend.service.PLoginService;

import model.MemberDto;
import model.MembershipDto;

@SessionAttributes({"memer_no","name"})
@Controller
public class PLoginController {

	@Resource(name="pLoginService")
	private PLoginService service;
	
	@RequestMapping("/ACCOUNT/Join.do")
	public String join(@RequestParam Map map, MembershipDto dto) throws Exception{
		
		service.insert(dto); 
		service.pInsert(dto);
		
		return "/index.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/upload.do")
	public String upload(/*UploadCommand command, */HttpSession session) throws Exception {
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/match.do")
	public String match(@RequestParam Map map, Model model) throws Exception {
		JSONObject match = new JSONObject();
		String mode = map.get("mode").toString();
		if(mode.equals("permit")) {
			String permit_no = map.get("permit_no").toString();
			String totalPermit = service.isPermit_no(permit_no);
			if(totalPermit != null) {
				if(totalPermit.equals(permit_no))
					match.put("permitNotMatch", true);
				else
					match.put("permitNotMatch", false);
			}
		}
		else if(mode.equals("pass")) {
			String pass1 = map.get("password1").toString();
			String pass2 = map.get("password2").toString();
			if(pass1.length() != 0 && pass1.length() != 0) {
				if(pass1.equals(pass2))
					match.put("pwdNotMatch", true);
				else
					match.put("pwdNotMatch", false);
			}
		}
			
		return match.toJSONString();
	}
	
}
