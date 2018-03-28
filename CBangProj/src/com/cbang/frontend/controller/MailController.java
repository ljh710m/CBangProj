package com.cbang.frontend.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {
	@Autowired
	private JavaMailSender gmailSender;
	
	//mailSending 코드
	@ResponseBody
	@RequestMapping(value="/Mail/GmailSending.do")
	public String mailSending(HttpServletRequest request) {   
	    String setfrom = "ljh710m2@gmail.com";
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일	    
	    String title   = "N방 이메일 인증번호";					 // 제목
	    //String content = request.getParameter("content");    // 내용
	    String content = "메일 확인";
	   
	    try {
	    	MimeMessage message = gmailSender.createMimeMessage();
	    	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	    	messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	    	messageHelper.setTo(tomail);     // 받는사람 이메일
	    	messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	    	messageHelper.setText(content);  // 메일 내용
	     
	    	gmailSender.send(message);
	    } catch(Exception e){e.printStackTrace();}
	   
	    return "Y";
	} 

}
