package funfun.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.service.Sw_AdminMakerService;
import funfun.vo.AdminMaker;
import funfun.vo.AdminMember;
import funfun.vo.Paging;

@Controller
@RequestMapping("/AdminMaker.do")
public class Sw_AdminMakerCtrl {
	@Autowired(required=false)
	private Sw_AdminMakerService service;
	
	// http://localhost:5080/funfun/AdminMaker.do?method=list
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		return "WEB-INF\\views\\admin\\makerManagement.jsp";
	}
	
	// http://localhost:5080/funfun/AdminMaker.do?method=detail
	@RequestMapping(params="method=detail")
	public String detail(@ModelAttribute("AdminMaker") AdminMaker AdminMaker, Model d) {
		d.addAttribute("AdminMaker", service.detail(AdminMaker.getMaker_code()));
		return "WEB-INF\\views\\admin\\makerManagement_Detail.jsp";
	}

	@RequestMapping(params="method=update")
	public String update(AdminMaker upt) {
		//service.update(upt);
		if(upt.getMaker_opt() != "") {
			Date date = Date .valueOf(upt.getMaker_opt());
			upt.setMaker_curr(date);
			System.out.println("maker_curr"+date);
			service.update(upt);
		}else {
			service.update2(upt);
		}
		
		System.out.println("AdminMaker 수정완료");
		return "redirect:/AdminMaker.do?method=list";
	}
	
}
