package com.cbang.frontend.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class NewRoomController {
	
	@ResponseBody
	@RequestMapping("/Manage/RegisterRoom.do")
	public String registerRoom(MultipartHttpServletRequest req) throws Exception{				
		//@RequestParam("photo") MultipartFile[] file		
		
		Iterator it =  req.getFileNames();
		System.out.println(it);
		if(it.hasNext()) {			
			System.out.println("데이터 있음");
		}
		else {
			System.out.println("데이터 없음");
		}
		
		
		//return "redirect:/index.jsp";
		return "Y";
	}
	
}
