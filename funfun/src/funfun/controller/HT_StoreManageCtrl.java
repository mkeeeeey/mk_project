package funfun.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import funfun.service.HT_StoreManageService;
import funfun.util.Uploader;
import funfun.vo.Store;
import funfun.vo.storeQnA;
import funfun.vo.storeOption;

@Controller
@RequestMapping("/Store.do")
public class HT_StoreManageCtrl {

	@Autowired(required=false)
	private HT_StoreManageService service;
	
	
	@RequestMapping(params="method=storeOpenReg")
	public String storeOpenReg() {
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeOpenReg.jsp";
	}
	
	@RequestMapping(params="method=storeOpenStart")
	public String storeOpenStart(HttpServletRequest request, Store sto) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		sto.setPro_code(projectCode);
		service.storeOpenStart(sto);
		session.setAttribute("storeCode", service.getStoreCode());
		return "redirect:/Store.do?method=storeRegReady"; 
	}

	@RequestMapping(params="method=storeRegReady")
	public String storeRegReady(HttpServletRequest request, Store sto, Model d) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		
		d.addAttribute("storeInfo", service.getStoreInfo(storeCode));
		d.addAttribute("stoOptCnt", service.getStoOptCnt(storeCode));
		System.out.println("스토어 옵션 갯수: " + service.getStoOptCnt(storeCode));
		
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeRegReady.jsp"; 
	}
	
	
	@RequestMapping(params="method=storeBasicInfo")
	public String storeBasicInfo(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		d.addAttribute("storeInfo", service.getStoreInfo(storeCode));
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeBasicInfoReg.jsp";
	}

	
	@RequestMapping(params="method=storeStoryImgUpload")
	public String storeStoryImgUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam("upload") MultipartFile[] multiFile) {
		
		PrintWriter printWriter = null;
		JsonObject json = new JsonObject();
		
		Uploader uploader = new Uploader();
		String storeImageAddress = uploader.upload(multiFile[0]);
		
		try {
			printWriter = response.getWriter();
			response.setContentType("text/html");
			String fileUrl = "${path}/"+storeImageAddress;
			
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", "product01.jpeg");
			json.addProperty("url", fileUrl);
			
			printWriter.println(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(printWriter != null) {
				printWriter.close();
			}
		}
		
		System.out.println("스토어 스토리 파일 업로드 프로세스");
		return null;
	}	
	
	
	
	@RequestMapping(params="method=storeBasicInfoReg")
	public String storeBasicInfoReg(HttpServletRequest request, Store sto, @RequestParam("storeImg") MultipartFile[] storeImg) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		
		Uploader uploader = new Uploader();
		String stoImageAddress = uploader.upload(storeImg[0]);

		sto.setSto_code(storeCode);
		sto.setSto_image(stoImageAddress);
		service.storeBasicInfoReg(sto);
		System.out.println("기본정보 등록 프로세스 완료");
		return "redirect:/Store.do?method=storeRegReady";
	}
	
	
	@RequestMapping(params="method=storeOption")
	public String storeOption(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		int storeCode = (int)session.getAttribute("storeCode");
		d.addAttribute("proStoOptList", service.getProStoOptionJoinList(projectCode));
		d.addAttribute("proOptList", service.getProOptList(projectCode));
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeOptionReg.jsp";
	}
	
	@RequestMapping(params="method=storeOptionReg")
	public String storeOptionReg(HttpServletRequest request, storeOption sto) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		System.out.println("스토어옵션등록됨??");
		System.out.println(storeCode);
		sto.setSto_code(storeCode);
		service.stoOptUnitReg(sto);
		return "redirect:/Store.do?method=storeOption";
	}
	
	@RequestMapping(params="method=storeOptionUpt")
	public String storeOptionUpt(HttpServletRequest request, storeOption sto, int sto_opt_code) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		sto.setSto_opt_code(sto_opt_code);
		service.stoOptUnitUpt(sto);
		return "redirect:/Store.do?method=storeOption";
	}
	
	@RequestMapping(params="method=stoOptUnitDelete")
	public String stoOptUnitDelete(HttpServletRequest request, storeOption sto, int sto_opt_code) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		service.stoOptUnitDelete(sto_opt_code);
		return "redirect:/Store.do?method=storeOption";
	}
	
	
	
	@RequestMapping(params="method=storeOpenRegSubmit")
	public String storeOpenRegSubmit() {
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeOpenRegSubmit.jsp";
	}
	
	@RequestMapping(params="method=storeOpenRegConfirm")
	public String storeOpenRegConfirm(HttpServletRequest request, int pro_code) {
		HttpSession session = request.getSession();
		int storeCode = (int)session.getAttribute("storeCode");
		service.storeOpenRegConfirm(storeCode);
		return "redirect:/MakerStudio.do?method=proCurrnet&pro_code="+pro_code;
	}
	
	
	@RequestMapping(params="method=storeOrderManage")
	public String storeOrderManage(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		session.getAttribute("user");
		int storeCode = (int)session.getAttribute("storeCode");
		d.addAttribute("orderList", service.orderList(storeCode));
		System.out.println("주문 관리 storeCode : "+ storeCode);
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeOrderManage.jsp";
	}

	@RequestMapping(params="method=storeQnAManage")
	public String storeQnAManage(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		session.getAttribute("user");
		int storeCode = (int)session.getAttribute("storeCode");
		d.addAttribute("storeQnAList", service.storeQnAList(storeCode));
		return "WEB-INF\\views\\storeManage\\ht_user_w_MS_storeQnAManage.jsp";
	}
	
	@RequestMapping(params="method=storeQnAAnsReg")
	public String storeQnAAnsReg(int qna_code, storeQnA qna) {
		System.out.println("스토어 답변 등록 : "+qna_code);
		qna.setQna_code(qna_code);
		service.storeQnAAnsReg(qna);
		return "redirect:/Store.do?method=storeQnAManage";
	}
	
}
