package funfun.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import funfun.service.MK_FundingService;
import funfun.service.MainService;
import funfun.service.sh_myPageService;
import funfun.vo.AccountInfo;
import funfun.vo.Favor;
import funfun.vo.FavorCodeList;
import funfun.vo.MemberInfo;
import funfun.vo.MemberLogin;
import funfun.vo.MyFundingInfo;
import funfun.vo.MyOrderInfo;
import funfun.vo.Project;

@Controller
public class AndroidLoginCtrl {
	
	@Autowired
	MainService service;
	
	@Autowired
	sh_myPageService myPageService;
	
	@Autowired
	MK_FundingService fundingService;
	
	//로그인에 사용
	@RequestMapping("/androidlogin.do")
	@ResponseBody
	public String verificationId(MemberLogin m) {
		
		System.out.println("안드로이드 로그인 아이디 비밀번호 검증...");
		int result;
		String mem_email;
		
		result=service.verifyId(m);
		mem_email=m.getMem_email();
		String str="{\"result\":"+result+", \"mem_email\":\""+mem_email+"\"}";
		
		return str;
	}
	
	//가입여부 확인
	@RequestMapping(value="/isSignup.do")
	public ResponseEntity isSignup(MemberLogin m) {
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		boolean serviceResult=service.signupIdCheck(m.getMem_email());
		String result="{\"result\":"+serviceResult+"}";
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	//이메일 입력하면 이름 리턴
	@RequestMapping(value="/getName.do")
	public ResponseEntity getNameByEmail(@RequestParam String email) {
		System.out.println(email);
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    MemberInfo m=service.getMemberInfo(email);
	    Gson gson=new Gson();
	    String result=gson.toJson(m);
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	//관심프로젝트 리스트 가져오기
	@RequestMapping(value="/getFavorList.do")
	public ResponseEntity getFavorListByEmail(@RequestParam String email) {
		HttpHeaders responseHeaders = new HttpHeaders();
		System.out.println(email);
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    FavorCodeList favorCodeList=service.getFavorCodeListByEmail(email);
	    // 가져온 ArrayList로 실제 데이터로 쓸 JSON 만들기
	    ArrayList<Favor> favorList=new ArrayList<Favor>();
	    for(Integer i:favorCodeList.getList()) {
	    	Favor tmp=service.getFavorByCode(i);
	    	tmp.setProCode(i+"");
	    	favorList.add(tmp);
	    }
		
	    Gson gson= new Gson();
	    String result="{\"favorList\":"+gson.toJson(favorList)+"}";
	    
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	//예치금 정보 가져오기
	@RequestMapping(value="/getAccountInfo.do")
	public ResponseEntity getAccountInfo(@RequestParam String email) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		AccountInfo info=service.getAccountInfo(email);
		Gson gson = new Gson();
		String result=gson.toJson(info);
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	//펀딩리스트 정보 가져오기
	@RequestMapping(value="/getMyFundingList.do")
	public ResponseEntity getMyFundingList(@RequestParam String email) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		ArrayList<MyFundingInfo> list=service.getMyFundingList(email);
		Gson gson = new Gson();
		String result=gson.toJson(list);
		result="{\"list\":"+result+"}";
		
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	//주문리스트 정보 가져오기
	@RequestMapping(value="/getMyOrderList.do")
	public ResponseEntity getMyOrderList(@RequestParam String email) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		ArrayList<MyOrderInfo> list = service.getMyOrderList(email);
		Gson gson = new Gson();
		String result=gson.toJson(list);
		result="{\"list\":"+result+"}";
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/deleteMyFavor.do")
	public ResponseEntity deleteMyFavor(@RequestParam String email, @RequestParam String code) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		HashMap<String,String> hash = new HashMap<>();
		hash.put("pc", code);
		hash.put("memEmail", email);
		myPageService.deleteFavor(hash);
		
		String result="{\"result\":"+true+"}";
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/favorChk.do")
	public String ckfavor(@ModelAttribute("project") Project proj, Model d, @RequestParam String user) {
		System.out.println("관심프로젝트등록확인");
		int mem_code=service.getMemberInfo(user).getMem_code();
		System.out.println(mem_code);
		proj.setMem_code(mem_code);
		d.addAttribute("ckfavor", fundingService.ckfavor(proj));
		//등록
		if(fundingService.ckfavor(proj)) {
			System.out.println("관심등록!");
			fundingService.insFavor(proj);
		}
		return "pageJsonReport";
	}
	
}
