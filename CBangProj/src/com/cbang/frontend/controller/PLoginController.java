package com.cbang.frontend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cbang.frontend.dao.PLoginDao;
import com.cbang.frontend.service.PLoginService;

import model.MembershipDto;
import model.dao.MembershipDao;
import util.PLoginUpload;

@SessionAttributes({"memer_no","name"})
@Controller
public class PLoginController {

	@Resource(name="pLoginService")
	private PLoginService service;
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/Join.do")
	public String join(MembershipDto dto) throws Exception{
		service.insert(dto); 
		service.pInsert(dto);
		
		return "Y";
	}
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/upload.do")
	public String upload(@RequestParam Map map, MultipartHttpServletRequest req) throws Exception {
		String member_no = service.selectMember_no(map.get("office_no").toString());
		/*String profile_photo = dto.getProfile_photo();
		String office_photo = dto.getOffice_photo();
		String permit_photo = dto.getPermit_photo();*/

		Map photoMap = new HashMap<>();
		if(!req.getFile("profile_photo").isEmpty()) {
			String fileName = PLoginUpload.parseInsertFileInfo(req, "profile_photo", "/ProfileUpload", member_no);
			photoMap.put("profile_photo", fileName);
		}
		if(!req.getFile("office_photo").isEmpty()) {
			String fileName= PLoginUpload.parseInsertFileInfo(req, "office_photo", "/OfficeUpload", member_no);
			photoMap.put("office_photo", fileName);
		}
		if(!req.getFile("permit_photo").isEmpty()) {
			String fileName = PLoginUpload.parseInsertFileInfo(req, "permit_photo", "/PermitUpload", member_no);
			photoMap.put("permit_photo", fileName);
		}
		photoMap.put("member_no", member_no);
		photoMap.put("office_no", map.get("office_no").toString());
		service.updatePhoto(photoMap);
		service.updatePhoto2(photoMap);
		
		return "Y";
	}
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/match.do")
	public String match(@RequestParam Map map, Model model) throws Exception {
		JSONObject match = new JSONObject();
		String mode = map.get("mode").toString();
		if(mode.equals("permit")) {
			int permit_no = service.isPermit_no(map);
			if (permit_no == 1)
				match.put("permitNotMatch", true);
			else
				match.put("permitNotMatch", false);
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
