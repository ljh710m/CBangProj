package com.cbang.frontend.controller;

import java.util.Random;

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
	    String authNumber = authNumber(5);
	    String content = 
	    		"<div style=\"width: 500px; height: 200px; margin: 50px; border: 1px solid rgba(0,0,0,.125);\">\r\n" + 
	    		"	<div style=\"position: relative; display: flex; flex-direction: column;background-color: #fff;background-clip: border-box;border: 1px solid rgba(0,0,0.125);\">\r\n" + 
	    		"		<div style=\"padding: .75rem 1.25rem; margin-top: 0; background-color: rgba(0,0,0,.03); border-bottom: 1px solid rgba(0,0,0,.125)\">\r\n" + 
	    		"			<strong style=\"margin-bottom: .75rem; font-weight: bolder;\">이메일 인증</strong>\r\n" + 
	    		"		</div>\r\n" + 
	    		"		<div style=\"flex: 1 1 auto; padding: 1.25rem;\">\r\n" + 
	    		"			<p>안녕하세요 N방입니다.</p>\r\n" + 
	    		"			<p>N방 서비스 이용을 위해 이메일 주소 인증을 요청하셨습니다.</p>\r\n" + 
	    		"			<br>\r\n" + 
	    		"			<p>인증 번호 :</p>\r\n" + 
	    		"			<p style=\"display: inline; font-weight: bold;\">"+authNumber+"</p>\r\n" + 
	    		"	    </div>\r\n" + 
	    		"	</div>\r\n" +
	    		"</div>";
	   
	    try {
	    	MimeMessage message = gmailSender.createMimeMessage();
	    	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	    	messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	    	messageHelper.setTo(tomail);     // 받는사람 이메일
	    	messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	    	messageHelper.setText(content,true);  // 메일 내용,text/html여부
	    		     
	    	gmailSender.send(message);
	    } catch(Exception e){e.printStackTrace();}
	   
	    return authNumber;
	}
	//인증번호 생성
	public String authNumber(int loopcount) {
		String str="";
		int d = 0;
		for(int i=1; i<=loopcount; i++) {
			Random r = new Random();
			d = r.nextInt(9);
			str = str + Integer.toString(d);
		}
		return str;
	}

}
