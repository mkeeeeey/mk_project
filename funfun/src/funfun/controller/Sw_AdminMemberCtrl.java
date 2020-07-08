package funfun.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import funfun.service.Sw_AdminMemberService;
import funfun.service.sh_myPageService;
import funfun.vo.AdminMember;
import funfun.vo.Paging;

@Controller
@RequestMapping("/AdminMember.do")
public class Sw_AdminMemberCtrl {
	@Autowired(required=false)
	private Sw_AdminMemberService service;
	
	@Autowired(required=false)
	private sh_myPageService service2;
	
	
	
	// http://localhost:5080/funfun/AdminMember.do?method=list
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		return "WEB-INF\\views\\admin\\memberManagement.jsp";
	}
	// http://localhost:5080/funfun/AdminMember.do?method=ajaxlist&curPage=1&pageSize=5
	@RequestMapping(params="method=ajaxlist")
	public String ajaxlist(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		return "pageJsonReport";
	}
	
	// http://localhost:5080/funfun/AdminMember.do?method=detail
	@RequestMapping(params="method=detail")
	public String detail(@ModelAttribute("AdminMember") AdminMember AdminMember, Model d) {
		d.addAttribute("AdminMember", service.detail(AdminMember.getMem_code()));
		
		d.addAttribute("plist", service2.plist(service.detail(AdminMember.getMem_code()).getMem_email()));
		d.addAttribute("tlist", service2.tlist(service.detail(AdminMember.getMem_code()).getMem_email()));
		return "WEB-INF\\views\\admin\\memberManagement_Detail.jsp";
	}

	@RequestMapping(params="method=update")
	public String update(AdminMember upt) {
		
		if(upt.getMem_opt() != "") {
			Date date = Date .valueOf(upt.getMem_opt());
			upt.setMem_curr(date);
			service.update(upt);
		}else {
			service.update2(upt);
		}
		
		System.out.println("AdminMember 수정완료");
		return "redirect:/AdminMember.do?method=list";
	}
	
	
	
	@RequestMapping(params="method=excel")
	public String excel(Model d) {
		Paging sch = new Paging();
		sch.setPageSize(service.AdminMemberCnt());
		System.out.println("데이터 크기:"+service.list(sch).size());
		d.addAttribute("memlist", service.list(sch));
		//return "pageJsonReport"; // json 호출
		return "excelViewer"; // View 호출
	}
}
