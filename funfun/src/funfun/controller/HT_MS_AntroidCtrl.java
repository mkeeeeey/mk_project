package funfun.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import funfun.service.HT_MSService;
import funfun.vo.Project;
import funfun.vo.storeOrder;
import funfun.vo.storeQnA;

@Controller
@RequestMapping("/androidMyProject.do")
public class HT_MS_AntroidCtrl {
	
	// http:localhost:6080/funfun/androidMyProject.do?method=myProject
	// http:localhost:5080/funfun/androidMyProject.do?method=myProjectQnAList
	// http:localhost:5080/funfun/androidMyProject.do?method=myStoreManage
	
	@Autowired
	HT_MSService service;
	
	@RequestMapping(params="method=myProject")
	public String myProjectList(HttpServletRequest request, HttpServletResponse response) {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		ArrayList<Project> myProject = service.myProjectList(11000000);
		ArrayList<HashMap<String,String>> JSON = new ArrayList<HashMap<String,String>>();
		for(Project p:myProject) {
			String title=p.getPro_title();
			if(title==null) title="";
			String keyword=p.getPro_keyword();
			if(keyword==null) keyword="";
			HashMap<String , String> map = new HashMap<String , String>();
			map.put("pro_title", title);
			map.put("pro_keyword", keyword);
			JSON.add(map);
		}
		String jsonMyProList = gson.toJson(JSON);
		System.out.println(jsonMyProList);
		request.setAttribute("JSON", jsonMyProList);
		return "WEB-INF\\views\\makerstudio\\ht_user_m_MS_myProject_json.jsp";
	}
	
	@RequestMapping(params="method=myProjectQnAList")
	public String myProjectQnAList(HttpServletRequest request, HttpServletResponse response) {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		ArrayList<storeQnA> myProjectQnAList = service.myProjectQnaList(21000002);
		ArrayList<HashMap<String, String>> JSON = new ArrayList<HashMap<String, String>>();
		for(storeQnA s:myProjectQnAList) {
			String id = Integer.toString(s.getMem_code());
			String reg_date = s.getQna_reg_date();
			String detail = s.getQna_detail();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("mem_code", id);
			map.put("qna_reg_date", reg_date);
			map.put("qna_detail", detail);
			JSON.add(map);			
		}
		String jsonProjectQnAList = gson.toJson(JSON);
		System.out.println(jsonProjectQnAList);
		request.setAttribute("JSON", jsonProjectQnAList);
		return "WEB-INF\\views\\makerstudio\\ht_user_w_MS_proQna_json.jsp";
	}
	
	@RequestMapping(params="method=myStoreManage")
	public String myStoreManage(HttpServletRequest request, HttpServletResponse response) {
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		ArrayList<storeOrder> myStoreOrder = service.myStoreManage(31000004);
		String jsonMyStoreOrder = gson.toJson(myStoreOrder);
		System.out.println(jsonMyStoreOrder);
		request.setAttribute("JSON", jsonMyStoreOrder);
		return "WEB-INF\\views\\makerstudio\\ht_user_m_MS_store_manage_json.jsp";
	}

}
