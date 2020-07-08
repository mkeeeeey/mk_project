package funfun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.service.Sw_NoticeService;
import funfun.vo.Notice;
import funfun.vo.Paging;

@Controller
@RequestMapping("/notice.do")
public class Sw_NoticeCtrl {
	// http://localhost:5080/funfun/notice.do?method=list
	// http://localhost:5080/funfun/notice.do?method=admList
	// http://localhost:5080/funfun/notice.do?method=insForm
	// http://localhost:5080/funfun/notice.do?method=insert
	// http://localhost:5080/funfun/notice.do?method=detail
	// http://localhost:5080/funfun/notice.do?method=update
	// http://localhost:5080/funfun/notice.do?method=delete
	@Autowired(required=false)
	private Sw_NoticeService service;
	
	// http://localhost:5080/funfun/notice.do?method=list
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		d.addAttribute("toplist", service.toplist());
		return "WEB-INF\\views\\servicecenter\\sw_user_w_noticeList.jsp";
	}
	// http://localhost:5080/funfun/notice.do?method=admList
	@RequestMapping(params="method=admList")
	public String admList(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		d.addAttribute("toplist", service.toplist());
		return "WEB-INF\\views\\servicecenter\\sw_admin_w_noticeList.jsp";
	}
	
	// http://localhost:5080/funfun/notice.do?method=ajaxlist
	@RequestMapping(params="method=ajaxlist")
	public String ajaxlist(@ModelAttribute("paging") Paging sch, Model d) {
		d.addAttribute("list",service.list(sch));
		//d.addAttribute("toplist", service.toplist());
		return "pageJsonReport";
	}
	// http://localhost:5080/funfun/notice.do?method=ajaxtoplist
	@RequestMapping(params="method=ajaxtoplist")
	public String ajaxtoplist(Model d) {
		d.addAttribute("toplist", service.toplist());
		return "pageJsonReport";
	}
	
	// http://localhost:5080/funfun/notice.do?method=insForm
	@RequestMapping(params="method=insForm")
	public String insForm() {
		
		return "WEB-INF\\views\\servicecenter\\sw_admin_w_noticeInsert.jsp";
	}
	// http://localhost:5080/funfun/notice.do?method=insert
	@RequestMapping(params="method=insert")
	public String insert(Notice ins) {
		service.insert(ins);
		System.out.println("noti 등록완료");
		
		return "redirect:/notice.do?method=admList";
	}

	
	// http://localhost:5080/funfun/notice.do?method=detail
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("noti_code") int noti_code, Model d) {
		d.addAttribute("notice", service.detail(noti_code));
		return "WEB-INF\\views\\servicecenter\\sw_admin_w_noticeDetail.jsp";
	}
	// http://localhost:5080/funfun/notice.do?method=update
	@RequestMapping(params="method=update")
	public String update(Notice upt) {
		service.update(upt);
		System.out.println("noti 수정완료");
		return "forward:/notice.do?method=admList";
	}
	// http://localhost:5080/funfun/notice.do?method=delete
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("noti_code") int noti_code) {
		service.delete(noti_code);
		System.out.println("noti 삭제완료");
		return "redirect:/notice.do?method=admList";
	}
	
}
