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

import com.cbang.frontend.service.PLoginService;

import command.UploadCommand;
import model.MemberDto;
import model.MembershipDto;
import util.FileUpDownUtils;

@SessionAttributes({"memer_no","name"})
@Controller
public class PLoginController {

	@Resource(name="pLoginService")
	private PLoginService service;
	
	@RequestMapping("/ACCOUNT/PLogin.do")
	public String join(@RequestParam Map map, MembershipDto dto, UploadCommand command, HttpSession session) throws Exception{
		String permit_no1 = map.get("permit_no1").toString();
		String permit_no2 = map.get("permit_no2").toString();
		String permit_no3 = map.get("permit_no3").toString();
		String permit_no = permit_no1+"-"+permit_no2+"-"+permit_no3;
		dto.setPermit_no(permit_no);
		
		String si_do = map.get("si-do").toString();
		String goo_goon = map.get("goo-goon").toString();
		String office_address = map.get("office_address").toString();
		String address = si_do+" "+goo_goon+" "+office_address;
		dto.setAddress(address);
		
		String startNo = map.get("phone").toString();
		String middleNo = map.get("mphone").toString();
		String lastNo = map.get("lphone").toString();
		String phone = startNo+"-"+middleNo+"-"+lastNo;
		dto.setPhone(phone);
		
		String startOfficeNo = map.get("office-phone").toString();
		String middleOfficeNo = map.get("office-mphone").toString();
		String lastOfficeNo = map.get("office-lphone").toString();
		String office_phone = startOfficeNo+"-"+middleOfficeNo+"-"+lastOfficeNo;
		dto.setOffice_phone(office_phone);
		
		String startEmail = map.get("email").toString();
		String endEmail = map.get("select-email").toString();
		String office_email = startEmail+"@"+endEmail;
		dto.setOffice_email(office_email);
		
		/*MultipartFile upload = command.getUpload();
		String path = session.getServletContext().getRealPath("/Upload");
		
		String newFileName = FileUpDownUtils.getNewFileName(path, upload.getOriginalFilename());
		File file = new File(path+File.separator+newFileName);
		upload.transferTo(file);
		model.addAttribute("originalName", upload.getOriginalFilename());
		
		model.addAttribute("size", (int)Math.ceil(upload.getSize()/1024.0));
		model.addAttribute("type", upload.getContentType());
		
		model.addAttribute("real", newFileName);
		dto.setProfile_photo(newFileName);*/
		service.insert(dto); 
		service.pInsert(dto);
		
		return "redirect:index.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/mathPassword.do")
	public String matchPass(@RequestParam Map map, Model model) throws Exception {
		JSONObject allform = new JSONObject();
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("/ACCOUNT/certification.do")
	public String isCertification(String permit_no) throws Exception {
		String permitNo = service.isPermit_no(permit_no);
		if(permitNo == null)
			return "true";
		else
			return "true";
	}
	
}
