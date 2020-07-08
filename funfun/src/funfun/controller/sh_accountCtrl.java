package funfun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.service.sh_accountService;
import funfun.vo.Deposit;
import funfun.vo.MemberInfo;
import funfun.vo.Paging_sh;
import funfun.vo.UserProfile;
import funfun.vo.Withdrawl;

@Controller
public class sh_accountCtrl {
	@Autowired(required=false)
	private sh_accountService service;
	
	@RequestMapping("/myaccount.do")
	public String blist(@ModelAttribute("psh") Paging_sh psh, HttpServletRequest request, Model d) {
		 HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
				 psh.setMemEmail(memberinfo.getMem_email());
				 d.addAttribute("blist",service.blist(psh));
				 d.addAttribute("clist",service.clist(memberinfo.getMem_email()));
				 d.addAttribute("rdlist",service.rdlist(psh));
				 d.addAttribute("wilist",service.wilist(psh));
		 }
		 
		return "WEB-INF\\views\\myPage\\sh_user_w_charge.jsp";
	}
	
	@RequestMapping("/depositList.do")
	public String ajaxlistDeposit(@ModelAttribute("psh") Paging_sh psh, HttpServletRequest request, Model d) {

		HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
			psh.setMemEmail(memberinfo.getMem_email());
			d.addAttribute("rdlist",service.rdlist(psh));
		 }	 
		return "pageJsonReport";
	}
	
	@RequestMapping("/withdrawlList.do")
	public String ajaxlist(@ModelAttribute("psh") Paging_sh psh, HttpServletRequest request, Model d) {

		HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
			psh.setMemEmail(memberinfo.getMem_email());
			d.addAttribute("wilist",service.wilist(psh));
		 }
		return "pageJsonReport";
	}
	@RequestMapping("/usingList.do")
	public String ajaxlistUsing(@ModelAttribute("psh") Paging_sh psh, HttpServletRequest request, Model d) {

		HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 if(memberinfo==null) {
			 
		 }else {
			psh.setMemEmail(memberinfo.getMem_email());
			d.addAttribute("blist",service.blist(psh));
		 }	 
		return "pageJsonReport";
	}
	@RequestMapping("/myaccount.do/chargeQuery.do")
	public String chargeQuery(@RequestParam("chargeQuery") String chargeQueryAmount, HttpServletRequest request, Model d) {
		 
		 HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 
		 if(memberinfo==null) {
			 
		 }else {
			UserProfile uf = new UserProfile();
			int chargeQueryAmountInt = Integer.parseInt(chargeQueryAmount);
			uf.setChargeQueryAmount(chargeQueryAmountInt);
			uf.setMemEmail(memberinfo.getMem_email());
			service.uptDepoBalanceTb(uf);
			service.chargeQuery(uf);	
			
			Deposit ds = new Deposit();
			ds.setMemEmail(memberinfo.getMem_email());
			ds.setChargeQueryAmount(chargeQueryAmountInt);
			service.insDeposit(ds);

		 }
		 
		return "redirect:/myaccount.do";
	}
	@RequestMapping("/myaccount.do/withdrawlQuery.do")
	public String minusBal(@RequestParam("minusBal") String minusBal, HttpServletRequest request, Model d) {
		 
		 HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 
		 if(memberinfo==null) {
			 
		 }else {
			UserProfile uf = new UserProfile();
			int minusBalInt = Integer.parseInt(minusBal);
			uf.setMinusBal(minusBalInt);
			uf.setMemEmail(memberinfo.getMem_email());
			service.uptWithBalanceTb(uf);
			service.minusBal(uf);
			
			Withdrawl wd = new Withdrawl();
			wd.setMemEmail(memberinfo.getMem_email());
			wd.setMinusBal(minusBalInt);
			service.insWithdrawl(wd);

		 }
		 
		return "redirect:/myaccount.do";
	}
	@RequestMapping("/myaccount.do/chgAccountInfo.do")
	public String chgAccountInfo(@RequestParam("bankName") String bankName,@RequestParam("memAccount") String memAccount,HttpServletRequest request, Model d) {
		 
		 HttpSession session = request.getSession(); 
		 MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		 
		 if(memberinfo==null) {
			 
		 }else {
			UserProfile uf = new UserProfile();
			uf.setMemAccount(memAccount);
			uf.setMemBank(bankName);
			uf.setMemEmail(memberinfo.getMem_email());
			service.chgAccountInfo(uf);
		 }
		 
		return "redirect:/myaccount.do";
	}
}
