package funfun.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.service.sh_myPageService;
import funfun.vo.MemberInfo;

@Controller
public class sh_myPageCtrl {
	// http://localhost:1254/funfun/mypage.do
	@Autowired(required=false)
	private sh_myPageService service;
	
	@RequestMapping("/mypage.do")
	public String list(HttpServletRequest request, Model d) {
		
		 HttpSession session = request.getSession();
		  
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
			 d.addAttribute("flist", service.list(memberinfo.getMem_email()));
			 d.addAttribute("plist", service.plist(memberinfo.getMem_email()));
			 d.addAttribute("tlist", service.tlist(memberinfo.getMem_email()));
			 if(service.memState(memberinfo.getMem_email())==null) {
				 d.addAttribute("memState", "서포터회원");
			 }else {
				 d.addAttribute("memState", "메이커회원");
			 }
			 d.addAttribute("fundCnt", service.fundCnt(memberinfo.getMem_email()));
			 d.addAttribute("orderCnt", service.orderCnt(memberinfo.getMem_email()));
			 d.addAttribute("meminfo", service.mypageinfo(memberinfo.getMem_email()));			 
		 }
		 
		 
		 return "WEB-INF\\views\\myPage\\sh_user_w_myPage.jsp";
	}
	
		@RequestMapping("/changeAdr.do")
		public String changeAdr(@RequestParam("oc") String oc,@RequestParam("newAdr") String newAdr, @RequestParam("newPostNum") String newPostNum) {
			HashMap<String,String> hm = new HashMap<>();
			hm.put("oc", oc);
			hm.put("newAdr", newAdr);
			hm.put("newPostNum", newPostNum);
			service.changeAdr(hm);
			return "forward:/mypage.do";
		}
		
		@RequestMapping("/changeFundingAdr.do")
		public String changeFundingAdr(@RequestParam("fc") String fc,@RequestParam("newAdr2") String newAdr2, @RequestParam("newPostNum2") String newPostNum2) {
			System.out.println("컨트롤러 접근");
			System.out.println(fc);
			System.out.println(newAdr2);
			HashMap<String,String> hm2 = new HashMap<>();
			hm2.put("fc", fc);
			hm2.put("newAdr2", newAdr2);
			hm2.put("newPostNum2", newPostNum2);
			service.changeFundingAdr(hm2);
			return "redirect:/mypage.do";
		}
		
		@RequestMapping("/cancleOrder.do")
		public String cancelOrder(HttpServletRequest request,@RequestParam("ocCancle") String oc,@RequestParam("orderPrice") String orderPrice,@RequestParam("orderCnt") String orderCnt) {
			System.out.println("orderCode : "+oc);
			HttpSession session = request.getSession();
			  
			 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
			 if(memberinfo==null) {
				 
			 }else {
				 	HashMap<String,String> hmBalO = new HashMap<>();
				 	System.out.println("orderPrice"+orderPrice);
					hmBalO.put("orderPrice",orderPrice);
					hmBalO.put("memEmail",memberinfo.getMem_email());
					service.cancleOrderBal(hmBalO);
					
					HashMap<String,String> hmBalTbO = new HashMap<>();
					hmBalTbO.put("orderPrice",orderPrice);
					hmBalTbO.put("memEmail",memberinfo.getMem_email());
					hmBalTbO.put("orderCode",oc);
					service.cancleOrderBalTb(hmBalTbO);
					
					service.cancleOrder(oc);
			 }
			return "redirect:/mypage.do";
		}
		
		@RequestMapping("/cancleFunding.do")
		public String cancelFunding(HttpServletRequest request,@RequestParam("fcCancle") String fc,@RequestParam("fundPrice") String fundPrice,@RequestParam("fundCnt") String fundCnt) {
			
			 HttpSession session = request.getSession();
			  
			 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
			 if(memberinfo==null) {
				 
			 }else {
				HashMap<String,String> hmBal = new HashMap<>();
				hmBal.put("fundPrice",fundPrice);
				hmBal.put("memEmail",memberinfo.getMem_email());
				service.cancleFundingBal(hmBal);
				
				HashMap<String,String> hmBalTb = new HashMap<>();
				hmBalTb.put("fundPrice",fundPrice);
				hmBalTb.put("memEmail",memberinfo.getMem_email());
				hmBalTb.put("fundingCode",fc);
				service.cancleFundingBalTb(hmBalTb);
				
				HashMap<String,String> hm3 = new HashMap<>();
				hm3.put("fc",fc);
				hm3.put("fundCnt",fundCnt);				
				service.cancleFunding(hm3);
			 }

			return "redirect:/mypage.do";
		}
		
		@RequestMapping("/deleteFavor.do")
		public String deleteFavor(@RequestParam("pc") String pc, HttpServletRequest request) {
			System.out.println(pc);
				HttpSession session = request.getSession();
				  
				MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
				if(memberinfo==null) {
					 
				}else {
					HashMap<String,String> hmDF = new HashMap<>();
					hmDF.put("pc", pc);
					hmDF.put("memEmail", memberinfo.getMem_email());
					service.deleteFavor(hmDF);
				}	
			
			return "redirect:/mypage.do";
		}
		
}
