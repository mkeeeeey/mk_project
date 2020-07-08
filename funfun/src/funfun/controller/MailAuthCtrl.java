package funfun.controller;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import funfun.service.MailAuthService;


@Controller
public class MailAuthCtrl {
	
	@Autowired(required=false)
	private MailAuthService service;
	
	// 메일발송
	// http://localhost:5080/springweb1/mail.do?method=send
	@RequestMapping(value="/Mail.do", method=RequestMethod.POST)
	@ResponseBody
	public String send(@RequestParam String email) throws MessagingException {
		System.out.println("메일발송 컨트롤러 실행");
		service.sendMail(email);
		
		String msg="{\"result\":true}";
		return msg;
	}
	
	@RequestMapping("/getMailCode.do")
	@ResponseBody
	public String getMailcode(@RequestParam String email) throws MessagingException{
		int code = service.getAuthData(email);
		String JSON="{\"code\":"+code+"}";
		return JSON;
	}
	
	@RequestMapping("/expireMailCode.do")
	@ResponseBody
	public String expireMailCode(@RequestParam int code) throws MessagingException{
		service.expireMailCode(code);
		return "";
	}
}