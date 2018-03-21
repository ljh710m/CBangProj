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
		
		String path="";
		File dir = new File(path);
		
		Iterator<String> files =  req.getFileNames();
		if(files.hasNext()) {
			String uploadFile = files.next();
			List<MultipartFile> mFileList = req.getFiles(uploadFile);
						
			for(int i=0; i<mFileList.size();i++) {
				System.out.println(mFileList.get(i).getOriginalFilename());
								
			}
			
		}	
		
		//return "redirect:/index.jsp";
		return "Y";
	}
	
}
