package funfun.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.service.sh_secessionService;
import funfun.vo.MemberInfo;
import funfun.vo.sesessionMail;

@Controller
public class sh_secessionCtrl {
	@Autowired(required=false)
	private sh_secessionService service;

	@RequestMapping("/secession.do")
	public String mlist(HttpServletRequest request, Model d) {
		 
		 HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
			 d.addAttribute("memEmail",memberinfo.getMem_email());
		 }
		 
		return "WEB-INF\\views\\myPage\\sh_user_w_secession.jsp";
	}
	@RequestMapping("/secession.do/finalPrc.do")
	public String finalPrc(HttpServletRequest request, @RequestParam("memEmail") String memEmail, Model d) {
		 
		 HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
			 service.finalPrc(memEmail);
			 session.invalidate();
		 }
		 
		return "redirect:/main.do";
	}
	// 인증 메일 발송
	@RequestMapping("/sendEmail.do")
	public String send(HttpServletRequest request,Model d) throws MessagingException {
		HttpSession session = request.getSession(); 
		MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		if(memberinfo==null) {
			 
		}else {
			 sesessionMail send = new sesessionMail();
			 send.setSubject("회원 탈퇴 인증 메일");
			 send.setReceiver(memberinfo.getMem_email());
			 
			 int no = (int)(Math.random()*10000+1000);
			 String ranNum = Integer.toString(no);
			 
			 send.setNo("ranNum");
			 
			 long time = System.currentTimeMillis(); 
			 SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			 String str = dayTime.format(new Date(time));
			 send.setRegdate(str);
			 
			 send.setContent("아래의 인증 번호를 입력한후 회원 탈퇴 버튼 클릭시 탈퇴가 완료 됩니다\r\n" + 
			 		"	인증 번호 : "+ranNum);

			 service.sendMail(send);
			 d.addAttribute("no",ranNum);
		}
		
		return "pageJsonReport";
	}
}
