package funfun.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import funfun.service.MK_FundingService;
import funfun.util.Uploader;
import funfun.vo.Funding;
import funfun.vo.Project;
import funfun.vo.ProjectQna;
import funfun.vo.ProjectSch;
import funfun.vo.Report;

@Controller
@RequestMapping("/funding.do")
public class MK_FundingCtrl {
	@Autowired(required=false)
	private MK_FundingService service;
	// http://localhost:5080/funfun/funding.do?method=list
	@RequestMapping(params="method=list")
	public String projectList(@ModelAttribute("projSch") ProjectSch sch, Model d) {
		System.out.println("카테고리1"+sch.getCate_title());
		
		d.addAttribute("plist", service.projectList(sch));
		d.addAttribute("style", sch.getProday());
		String category = sch.getCate_title();
		if(category == null) category =  "";
		switch(category) {
			case "교육" :
				d.addAttribute("category","교육·키즈");
				break;
			case "패션" :
				d.addAttribute("category","패션·잡화·뷰티");
				break;
			case  "홈리빙":
				d.addAttribute("category","홈리빙·디자인소품");
				break;
			case "공연" :
				d.addAttribute("category","공연·컬쳐");
				break;
			case "스포츠":
				d.addAttribute("category","스포츠·모빌리티");
				break;
			case "출판":
				d.addAttribute("category","출판");
				break;
			case "반려동물":
				d.addAttribute("category","반려동물");
				break;
			case "테크":
				d.addAttribute("category","테크·가전");
				break;
			default:
				d.addAttribute("category", "전체보기");
				break;
		}
		System.out.println("카테고리"+sch.getCate_title());
		System.out.println("검색"+sch.getProjectsch());
		System.out.println("분류:"+sch.getProday());
		System.out.println("현재페이지:"+sch.getPageCount());
		return "WEB-INF\\views\\funding\\mk_user_w_projectList.jsp";
	}
	// 프로젝트 목록 for json
	// http://localhost:5080/funfun/funding.do?method=ajaxList
	@RequestMapping(params="method=ajaxList")
	public String ajaxList(ProjectSch sch, Model d) {
		// view를 json형 뷰로 선언
		d.addAttribute("plist", service.projectList(sch));
		// 모델에 있는 plist로 된 ArrayList 객체를 json형식으로 변경
		return "pageJsonReport";
	}
	// 프로젝트 상세보기
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("pro_code") int pro_code, Model d) {
		d.addAttribute("project", service.detail(pro_code)); // 프로젝트 상세정보
		d.addAttribute("opt", service.proOptList(pro_code)); // 프로젝트 옵션
		d.addAttribute("qna", service.inquiryList(pro_code)); // 프로젝트 문의
		return "WEB-INF\\views\\funding\\mk_user_w_projectDetail.jsp";
	}
	// 프로젝트 상세보기 for json
	// http://localhost:5080/funfun/funding.do?method=ajaxDetail&pro_code=21000002
	@RequestMapping(params="method=ajaxDetail")
	public String ajaxDetail(@RequestParam("pro_code") int pro_code, Model d) {
		// view를 json형 뷰로 선언
		d.addAttribute("project", service.detail(pro_code));
		d.addAttribute("opt", service.proOptList(pro_code));
		// 모델에 있는 plist로 된 ArrayList 객체를 json형식으로 변경
		return "pageJsonReport";
	}
	// 관심프로젝트 등록 확인
	@RequestMapping(params="method=ckfavor")
	public String ckfavor(@ModelAttribute("project") Project proj, Model d) {
		System.out.println("관심프로젝트등록확인");
		d.addAttribute("ckfavor", service.ckfavor(proj));
		return "pageJsonReport";
	}
	// 관심프로젝트 등록
	@RequestMapping(params="method=favor")
	public String insFavor(@ModelAttribute("project") Project proj) {
		System.out.println("회원 번호"+proj.getMem_code());
		System.out.println("프로젝트 번호"+proj.getPro_code());
		service.insFavor(proj);
		System.out.println("관심Controller");
		return "forward:/funding.do?method=detail";
	}
	// 신고하기
	@RequestMapping(params="method=report")
	public String report(@RequestParam("projectImg") MultipartFile[] projectImg, @ModelAttribute("report") Report report) {
		System.out.println("1 : "+report.getMem_code());
		System.out.println("2 : "+report.getPro_code());
		System.out.println("3 : "+report.getReport_detail());
		Uploader uploader = new Uploader();
		String pro_img = uploader.upload(projectImg[0]);
		report.setReport_img(pro_img);
		System.out.println("3 : "+report.getReport_img());
		service.insReport(report);
		return "redirect:/funding.do?method=detail&pro_code="+report.getPro_code();
	}
	// 문의하기
	@RequestMapping(params="method=inquiry")
	public String inquiry(@ModelAttribute("inquiry") ProjectQna qna) {
		System.out.println("회원 번호"+qna.getMem_code());
		System.out.println("프로젝트 번호"+qna.getPro_code());
		System.out.println("비밀글여부:"+qna.getQna_open());
		System.out.println("내용:"+qna.getQna_detail());
		service.inquiry(qna);
		return "redirect:/funding.do?method=detail&pro_code="+qna.getPro_code();
	}
	// 펀딩하기 - 옵션선택
	// http://localhost:5080/funfun/funding.do?method=option&pro_code=21000002
	@RequestMapping(params="method=option")
	public String option(@ModelAttribute("project") Project proj, Model d) {
		d.addAttribute("project", service.detail(proj.getPro_code()));
		d.addAttribute("opt", service.proOptList(proj.getPro_code()));
		return "WEB-INF\\views\\funding\\mk_user_w_fundingOpt.jsp";
	}
	// 펀딩 페이지
	@RequestMapping(params="method=fund")
	public String fund(@ModelAttribute("funding") Funding fund, @RequestParam("mem_code") int mem_code, Model d) {
		System.out.println("펀딩하기");
		System.out.println(fund.getOpt_code());
		d.addAttribute("option", service.option(fund.getOpt_code()));
		d.addAttribute("balance", service.balance(mem_code));
		return "WEB-INF\\views\\funding\\mk_user_w_funding.jsp";
	}
	// 펀딩하기 - 정보입력
	@RequestMapping(params="method=funding")
	public String funding(@ModelAttribute("funding") Funding fund) {
		System.out.println("선택옵션:"+fund.getOpt_code());
		service.funding(fund);
		System.out.println("펀딩금액"+fund.getFund_price());
		System.out.println("프로젝트 코드:"+fund.getPro_code());
		service.uptMoney(fund);
		service.useBalance(fund);
		service.uptBalance(fund);
		service.uptCnt(fund);
		return "forward:/funding.do?method=list";
	}

}
