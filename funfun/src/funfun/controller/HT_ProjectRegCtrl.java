package funfun.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import funfun.service.HT_ProjectRegService;
import funfun.util.Uploader;
import funfun.vo.MakerStudio;
import funfun.vo.MemberInfo;
import funfun.vo.ProOption;
import funfun.vo.ProRisk;
import funfun.vo.Project;

@Controller
@RequestMapping("/ProjectReg.do")
public class HT_ProjectRegCtrl {
	
	@Autowired(required=false)
	private HT_ProjectRegService service;
	
	// http://localhost:6080/funfun/ProjectReg.do?method=ready

	

	@RequestMapping(params="method=initPage")
	public String initPage(HttpServletRequest request, Model d) {
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_Ready.jsp";
	}

	
	@RequestMapping(params="method=ready")
	public String proReady(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		d.addAttribute("makerInfo", service.makerInfo(memberinfo.getMem_code()));
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_basicReq.jsp";
	}
	
	
	@RequestMapping(params="method=proCreate")
	public String proCreate(HttpServletRequest request, Model d, Project cre) {
		HttpSession session = request.getSession();
		MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		cre.setMaker_code(memberinfo.getMaker_code());
		service.proCreate(cre);
		d.addAttribute("projectCode", service.getProjectCode());
		int pro_code = service.getProjectCode();
		session.setAttribute("projectCode", service.getProjectCode());
		return "redirect:/ProjectReg.do?method=projectManage&pro_code="+pro_code;
	}
	
	
	
	
	@RequestMapping(params="method=projectManage")
	public String projectManage(HttpServletRequest request, Model d, Project proInfo, int pro_code) {
		HttpSession session = request.getSession();
		session.setAttribute("projectCode", pro_code);
		Project project = service.projectInfo(pro_code);
		
		if (project.getPro_start_date()!=null) {
			project.setPro_start_date(project.getPro_start_date().substring(0, 10));
		}
		
		if (project.getPro_finish_date()!=null) {
			project.setPro_finish_date(project.getPro_finish_date().substring(0, 10));
		}
		
		session.setAttribute("projectInfo", project);

		if(service.getProOptionListCount(pro_code)==0) {
			d.addAttribute("projectOption", -1);
		} else {
			d.addAttribute("projectOption", 1);
		}
		
		if(service.getProRiskListCount(pro_code)==0) {
			d.addAttribute("projectRisk", -1);
		} else {
			d.addAttribute("projectRisk", 1);
		}
		
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_Ready.jsp";
	}
	
	

	@RequestMapping(params="method=basicReq")
	public String proRegBasicReq(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		d.addAttribute("makerInfo", service.makerInfo(memberinfo.getMem_code()));
		session.setAttribute("makerInfo", service.makerInfo(memberinfo.getMem_code()));
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_basicReq.jsp";
	}		
	
	
	@RequestMapping(params="method=basicInfo")
	public String proBasicInfo(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		Project projectInfo = (Project)session.getAttribute("projectInfo");
		d.addAttribute("projectInfo", projectInfo);
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_basicInfo.jsp";
	}

	@RequestMapping(params="method=basicInfoReg")
	public String proRegBasicInfoReg(HttpServletRequest request, Model d, Project cre, @RequestParam("projectImg") MultipartFile[] projectImg) {
		HttpSession session = request.getSession();
		MemberInfo memberinfo = (MemberInfo)session.getAttribute("user");
		int projectCode = (int)session.getAttribute("projectCode");
		
		Uploader uploader = new Uploader();
		String proImageAddress = uploader.upload(projectImg[0]);
		
		cre.setPro_code(projectCode);
		cre.setPro_image(proImageAddress);
		service.proBasicInfo(cre);
		
		d.addAttribute("makerInfo", service.makerInfo(memberinfo.getMem_code()));
		session.setAttribute("makerInfo", service.makerInfo(memberinfo.getMem_code()));
		return "redirect:/ProjectReg.do?method=projectManage&pro_code="+projectCode;
	}
	

	@RequestMapping(params="method=story")
	public String proRegStory(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		Project projectInfo = (Project)session.getAttribute("projectInfo");
		d.addAttribute("projectInfo", projectInfo);
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_story.jsp";
	}
	
	
	
	@RequestMapping(params="method=storyImgUpload")
	public String storyImgUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam("upload") MultipartFile[] multiFile) {
		
		PrintWriter printWriter = null;
		JsonObject json = new JsonObject();
		
		Uploader uploader = new Uploader();
		String proImageAddress = uploader.upload(multiFile[0]);
		
		try {
			printWriter = response.getWriter();
			response.setContentType("text/html");
			String fileUrl = proImageAddress;
			System.out.println(fileUrl.substring(11,fileUrl.length()));
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileUrl.substring(11,fileUrl.length()));
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
		return null;
	}
	
	
	@RequestMapping(params="method=storyReg")
	public String proStoryReg(HttpServletRequest request, Project cre) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		cre.setPro_code(projectCode);
		service.proStory(cre);
		return "redirect:/ProjectReg.do?method=projectManage&pro_code="+projectCode;
	}
	
	
	
	@RequestMapping(params="method=reward")
	public String proRegReward(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		System.out.println(projectCode);
		d.addAttribute("optList", service.getProOptionList(projectCode));
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_reward.jsp";
	}
	
	@RequestMapping(params="method=rewardUnitReg")
	public String proRegRewardUnitReg(HttpServletRequest request, Model d, ProOption cre) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		session.setAttribute("projectCode", projectCode);
		cre.setPro_code(projectCode);
		service.regProOption(cre);
		return "redirect:/ProjectReg.do?method=reward";
	}
		
	@RequestMapping(params="method=uptProOption")
	public String uptProOption(HttpServletRequest request, Model d, ProOption cre) {
		service.uptProOption(cre);
		return "redirect:/ProjectReg.do?method=reward";
	}
	
	@RequestMapping(params="method=deleteProOption")
	public String deleteProOption(HttpServletRequest request, Model d, int opt_code) {
		service.deleteProOption(opt_code);
		return "redirect:/ProjectReg.do?method=reward";
	}
	
	
	@RequestMapping(params="method=rewardReg")
	public String proRegRewardReg(HttpServletRequest request, Model d, Project cre) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		cre.setPro_code(projectCode);
		return "redirect:/ProjectReg.do?method=projectManage&pro_code="+projectCode;
	}
	
	
	@RequestMapping(params="method=risk")
	public String proRegRisk(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		d.addAttribute("riskList", service.getProRiskList(projectCode));
		return "WEB-INF\\views\\project_reg\\ht_user_w_MS_projectReg_risk.jsp";
	}
	
	@RequestMapping(params="method=riskUnitReg")
	public String proRiskUnitReg(HttpServletRequest request, Model d, ProRisk cre) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		cre.setPro_code(projectCode);
		service.regProRisk(cre);
		return "redirect:/ProjectReg.do?method=risk";
	}
	
	@RequestMapping(params="method=riskUnitUpt")
	public String updateProRisk(HttpServletRequest request, Model d, ProRisk cre) {
		service.updateProRisk(cre);
		return "redirect:/ProjectReg.do?method=risk";
	}
	
	@RequestMapping(params="method=deleteProRisk")
	public String deleteProRisk(HttpServletRequest request, Model d, ProRisk cre, int risk_code) {
		service.deleteProRisk(risk_code);
		return "redirect:/ProjectReg.do?method=risk";
	}
	
	
	@RequestMapping(params="method=projectRegister")
	public String projectRegister(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int projectCode = (int)session.getAttribute("projectCode");
		service.projectRegister(projectCode);
		return "redirect:/MakerStudio.do?method=myProject";
	}

}
