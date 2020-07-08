package funfun.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import funfun.service.sh_myPageService;
import funfun.vo.MyPageInfo;
import funfun.vo.PartiFunding;
import funfun.vo.Favor;

@Controller
public class AndroidMypageCtrl {
	
	@Autowired(required=false)
	private sh_myPageService service;
	

	@RequestMapping(value="/androidMypage.do")
	public ResponseEntity mypageinfo(MyPageInfo m, Model d) {
		
		String email = "yuseohee27@gmail.com";	
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

	    String memState;
	    
	    if(service.memState(email)==null) {
	    	memState = "서포터 회원";
		 }else {
			 memState = "메이커 회원";
		 }
	    
		String result = "{\"memName\":\""+service.mypageinfo(email).getMemName()+"\","+
						"\"memState\":\""+memState+"\","+
						"\"fundCnt\":\""+service.fundCnt(email)+"\","+
						"\"orderCnt\":\""+service.orderCnt(email)+"\","+
						"\"memProfile\":\""+service.mypageinfo(email).getMemProfile()+
						"\"}";

			
		return new ResponseEntity(result, responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/androidMypageFavor.do")
	public String Favor(Model d, HttpServletRequest request) {
		String email = "yuseohee27@gmail.com";	
		
		Gson gson = new Gson();
		
		ArrayList<Favor> array=service.list(email);
		String jsonFavorList = gson.toJson(array);
		request.setAttribute("JSON", jsonFavorList);
		
		return "WEB-INF\\views\\myPage\\favorJson.jsp";
	}
	
	@RequestMapping(value="/androidMypageParti.do")
	public String Parti(Model d, HttpServletRequest request) {
		String email = "yuseohee27@gmail.com";	
		
		Gson gson = new Gson();
		
		ArrayList<PartiFunding> array=service.plist(email);
		String jsonPartiList = gson.toJson(array);
		request.setAttribute("JSON", jsonPartiList);
		
		return "WEB-INF\\views\\myPage\\partiJson.jsp";
	}
	
}

