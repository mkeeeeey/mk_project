package funfun.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import funfun.service.MainService;
import funfun.vo.MainViewProject;
import funfun.vo.MemberInfo;
import funfun.vo.MemberLogin;
import funfun.vo.NotificationInfo;

@Controller
public class Main {
	
	@Autowired
	MainService service;
	
	
	// http://localhost:5080/funfun/main.do
	@RequestMapping("/main.do")
	public String moveMain(Model d) {
		System.out.println("메인화면 호출");
		return "WEB-INF\\views\\main/hj_main.jsp";
	}
	
	// http://localhost:5080/funfun/login.do
	@RequestMapping("/login.do")
	public String moveLogin() {
		
		return "WEB-INF\\views\\main\\hj_login.jsp";
	}
	
	// http://localhost:5080/funfun/signup.do
	@RequestMapping("/signup.do")
	public String moveSignUp() {
		
		return "WEB-INF\\views\\main\\hj_signup.jsp";
	}
	
	// http://localhost:5080/funfun/findaccount.do
	@RequestMapping("/findaccount.do")
	public String moveFindAccount() {
		return "WEB-INF\\views\\main\\hj_findAccount.jsp";
	}

	
	// http://localhost:5080/funfun/verification.do
	// 로그인 아이디비밀번호 정확한지 검증
	@RequestMapping("/verification.do")
	public String verificationId(MemberLogin m, Model d) {
		
		System.out.println("로그인 아이디 비밀번호 검증...");
		System.out.println("입력 Eamil:"+m.getMem_email());
		System.out.println("입력 Pass:"+m.getMem_pw());
		d.addAttribute("verification", service.verifyId(m));
		
		
		return "pageJsonReport";
	}
	
	//ȸ�����Խ� ���̵� �ߺ� üũ
	@RequestMapping("/signupIdCheck.do")
	public String signupIdCheck(@RequestParam("mem_email") String email, Model d) {
		d.addAttribute("verification", service.signupIdCheck(email));
		return "pageJsonReport";
	}
	
	@RequestMapping("/loginSuccess.do")
	public String loginSuccess(MemberLogin m, HttpServletRequest req, @RequestParam("redirectAddress") String redirectAddress) {
		HttpSession session = req.getSession();
		if(service.verifyId(m)==1) {
			//로그인 성공 시 이메일로 멤버(이름, 이메일, 멤버코드, 메이커코드, 관심카테고리 정보 가져옴)
			//메이커가 아닌 경우 메이커코드에 -1 set
			MemberInfo memberInfo = service.getMemberInfo(m.getMem_email());
			System.out.println("멤버코드:"+memberInfo.getMem_code());
			System.out.println("프로필:"+memberInfo.getMem_profile());
			System.out.println("메이커코드:"+memberInfo.getMaker_code());
			session.setAttribute("user", memberInfo);
			session.removeAttribute("manager");
			System.out.println("로그인성공");
			//회원가입하자마자 로그인하는 경우 로그인 페이지가 반복되는 경우
			if(redirectAddress.contains("signup.do")||redirectAddress.contains("login.do")||
					redirectAddress.contains("findaccount.do")) {
				return "redirect:/main.do";
			} else {
				return "redirect:"+redirectAddress;
			}
		} else {
			//로그인 실패시
			return "redirect:/login.do";
		}
		
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/insertMember.do")
	public String createMember(MemberInfo m) {
		service.insertMember(m);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping("/changePass.do")
	public String changePass(MemberInfo m, Model d) {
		
		d.addAttribute("result", service.changePass(m));
		return "pageJsonReport";
	}
	
	@RequestMapping("/getNotificationList.do")
	public ResponseEntity getNotificationList(@RequestParam("mem_code") int memCode) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		ArrayList<NotificationInfo> list = service.getNotificationList(memCode);
		Gson gson=new Gson();
		String result = gson.toJson(list);
		result = "{\"list\":"+result+"}";
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("/getFavorProjectListLeft7DaysOrLess.do")
	public ResponseEntity getFavorProjectListLeft7DaysOrLess(@RequestParam("mem_code") int memCode) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		ArrayList<NotificationInfo> list = service.getFavorProjectListLeft7DaysOrLess(memCode);
		Gson gson = new Gson();
		String result =gson.toJson(list);
		result="{\"list\":"+result+"}";
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("/getMainViewProject.do")
	public ResponseEntity getMainViewProject(@RequestParam("page") int page, @RequestParam("category") String category) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String cate;
		if("".equals(category)) {
			cate=null;
		} else {
			cate=category;
		}
		
		ArrayList<MainViewProject> list = service.getMainViewProject(page, cate);
		Gson gson = new Gson();
		String result =gson.toJson(list);
		result="{\"list\":"+result+"}";
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
}
