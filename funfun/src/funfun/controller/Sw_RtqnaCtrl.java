package funfun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.service.Sw_RtqnaService;
import funfun.vo.MemberInfo;
import funfun.vo.Paging;
import funfun.vo.Rtqna;

@Controller
@RequestMapping("/rtqna.do")
public class Sw_RtqnaCtrl {
	// http://localhost:5080/funfun/rtqna.do?method=ajaxlist
	// http://localhost:5080/funfun/rtqna.do?method=admList
	// http://localhost:5080/funfun/rtqna.do?method=insert
	// http://localhost:5080/funfun/rtqna.do?method=detail
	// http://localhost:5080/funfun/rtqna.do?method=update
	// WEB-INF\\views\\servicecenter\\NewFile.jsp
	
	@Autowired(required=false)
	private Sw_RtqnaService service;
	
	
	// http://localhost:5080/funfun/rtqna.do?method=ajaxlist?curPage=1&pageSize=5
	@RequestMapping(params="method=ajaxlist")
	public String ajaxlist(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		return "pageJsonReport";
	}
	
	// http://localhost:5080/funfun/rtqna.do?method=admList
	@RequestMapping(params="method=admList")
	public String admList(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		
		return "WEB-INF\\views\\servicecenter\\sw_admin_w_rtqnaList.jsp";
	}
	
	
	
	
	// http://localhost:5080/funfun/rtqna.do?method=insert
	@RequestMapping(params="method=insert")
	public String insert(Rtqna ins) {
		service.insert(ins);
		if(ins.getRtqna_writer() >= 11000000) {
			// 회원이 글 입력시 확인 ==> 문의중으로 수정
			service.uptSt1(ins.getMem_code());
		}else {
			// 관리자가 글 입력시 문의중 ==> 미확인 으로 수정
			service.uptSt2(ins.getMem_code());
		}
		return "WEB-INF\\views\\servicecenter\\sw_chatting.jsp";
	}

	
		
	// http://localhost:5080/funfun/rtqna.do?method=ajaxdetail&mem_code=11000000
	@RequestMapping(params="method=ajaxdetail")
	public String ajaxdetail(@RequestParam("mem_code") int mem_code, Model d) {
		d.addAttribute("list", service.detail(mem_code));
		return "pageJsonReport";
	}
	
	
	// http://localhost:5080/funfun/rtqna.do?method=chatting
	@RequestMapping(params="method=chatting")
	public String chatting(@RequestParam("mem_code") int mem_code, Model d, HttpServletRequest req) {
		// 채팅방이 없으면 생성
		if(service.ckrtqna(mem_code) == 0) {
			service.insertrtqna(mem_code);
			Rtqna ins = new Rtqna();
			ins.setRtqna_code(service.rtqna_code(mem_code));
			ins.setRtqna_writer(1001);
			ins.setRtqna_detail("펀펀에 오신 것을 환영합니다.");
			service.insert(ins);
		}
		
		HttpSession session = req.getSession();
		MemberInfo user = new MemberInfo();
		if(session.getAttribute("user")!= null) user = (MemberInfo)session.getAttribute("user");
		if( user.getMem_code() == mem_code) {
			// 회원인 경우 채팅방 입장시
			// 미확인일 경우에만  ==> 확인으로 수정
			service.uptSt3(mem_code);
		}
		d.addAttribute("rtqna", service.chatdetail(mem_code));
		return "WEB-INF\\views\\servicecenter\\sw_chatting.jsp";
	}
	
	
}
