package funfun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import funfun.service.KB_StoreService;
import funfun.service.KB_adminService;
import funfun.service.MK_FundingService;
import funfun.service.Sw_AdminService;
import funfun.vo.Admin;
import funfun.vo.Paging;
import funfun.vo.Project;
import funfun.vo.Report;
import funfun.vo.RewardStore;

@Controller
public class AdminMainCtrl {
	@Autowired(required=false)
	KB_StoreService kb_service;
	@Autowired(required=false)
	KB_adminService kb_admin_service;
	@Autowired(required=false)
	MK_FundingService mk_service;
	@Autowired(required=false)
	Sw_AdminService sw_service;
	
	
	@RequestMapping(value="/admin-main.do")
	public String enterMain(Admin admin,HttpServletRequest req) {
		// 로그인 버튼 이후 코드와 비밀번호를 가지고 이곳으로 이동.
		// 로그인 성공 여부를 확인
		if(sw_service.verifyAdmId(admin) == 1) {
			// 성공시 session에 admin 정보 저장, user정보 삭제
			HttpSession session = req.getSession();
			session.removeAttribute("user");
			session.setAttribute("manager", sw_service.detail(admin.getAdmin_code()));
			
			System.out.println("관리자 로그인 성공");
			return "WEB-INF\\views\\admin\\adminMain.jsp";
		}else {
			// 실패시 다시 로그인페이지로 이동
			System.out.println("로그인 실패");
			return "WEB-INF\\views\\admin\\adminLogin.jsp";
		}
	}
	
	@RequestMapping(value="/admin.do")
	public String enterAminLogin() {
		return "WEB-INF\\views\\admin\\adminLogin.jsp";
	}
	
	@RequestMapping("/admin-logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("manager");
		session.invalidate();
		
		return "redirect:/admin.do";
	}
	
	
	
	
	@RequestMapping(value="/admin-management.do")
	public String enterAdminManagement(Paging sch, Model d) {
		d.addAttribute("list", sw_service.list(sch));
		return "WEB-INF\\views\\admin\\adminManagement.jsp";
	}
	
	@RequestMapping(value="/admin-management-insert.do")
	public String insertAdminManagement(Admin ins) {
		ins.setAdmin_pw("zzzz"+ins.getAdmin_code());
		sw_service.insert(ins);
		return "redirect:/admin-management.do";
	}
	@RequestMapping(value="/admin-management-update.do")
	public String updateAdminManagement(Admin upt) {
		sw_service.update(upt);
		return "redirect:/admin-management.do";
	}
	@RequestMapping(value="/admin-management-delete.do")
	public String deleteAdminManagement(Admin del) {
		sw_service.delete(del.getAdmin_code());
		return "redirect:/admin-management.do";
	}
	
	
	
	
	
	
	@RequestMapping(value="/project-management.do")
	public String enterProjectManagement(Paging sch, Model d) {
		d.addAttribute("plist", kb_admin_service.projectList(sch));
		return "WEB-INF\\views\\admin\\projectManagement.jsp";
	}
	
	@RequestMapping(value="/project-report-management.do")
	public String enterProjectReportManagement(Paging sch, Model d) {
		d.addAttribute("report", mk_service.reportList(sch));
		return "WEB-INF\\views\\admin\\projectReportManagement.jsp";
	}
	@RequestMapping(value="/project-report.do")
	public String enterProjectReportManagement(int report_code, Model d) {
		d.addAttribute("detail", mk_service.report(report_code));
		return "pageJsonReport";
	}
	@RequestMapping(value="/project-report-update.do")
	public String updateProjectReport(Report upt) {
		mk_service.uptReport(upt);
		return "redirect:/project-report-management.do";
	}
	
	@RequestMapping(value="/customer-service-management.do")
	public String enterCustomerService() {
		return "redirect:/notice.do?method=admList";
	}
	
	@RequestMapping(value="/maker-management.do")
	public String enterMakerManagement() {
		return "redirect:/AdminMaker.do?method=list";
	}
	
	@RequestMapping(value="/reward-store-management.do")
	public String enterRewardStoreManagement(Paging sch, Model d) {
		
		d.addAttribute("slist", kb_service.adminList(sch));
		return "WEB-INF\\views\\admin\\rewardStoreManagement.jsp";
	}
	
	@RequestMapping(value="/member-management.do")
	public String enterMemberManagement() {
		// 회원목록 조회
		// 회원상세 내용
		// 회원상태(정상,제제,제명) 관리
		return "redirect:/AdminMember.do?method=list";
	}
	
	@RequestMapping(value="/store-update-curr.do")
	public String stocurrUpt(RewardStore rs) {
		kb_service.UptCurr(rs);
		return "redirect:/reward-store-management.do";
	}
	
	@RequestMapping(value="/project-detail.do")
	public String proDetail(int pro_code, Model d) {
		d.addAttribute("detail", kb_admin_service.proDetail(pro_code));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(value="project-update-curr.do")
	public String proCurrUpt(Project pro) {
		kb_admin_service.UptCurr(pro);
		
		return "redirect:/project-management.do";
	}
}
