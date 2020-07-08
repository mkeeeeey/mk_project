package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.HT_MSReposi;
import funfun.vo.MakerStudio;
import funfun.vo.MemberInfo;
import funfun.vo.Project;
import funfun.vo.ProjectQna;
import funfun.vo.storeOrder;
import funfun.vo.storeQnA;

@Service
public class HT_MSService {

	@Autowired(required=false)
	private HT_MSReposi dao;
	
	
	public void regMaker(MakerStudio reg) {
		dao.regMaker(reg);
	}
	
	public MakerStudio makerInfo(int mem_code) {
		System.out.println(mem_code);
		MakerStudio d = dao.makerInfo(mem_code);
		return d;
	}
	
	public void makerInfoUpt(MakerStudio upt) {
		dao.makerInfoUpt(upt);
	}
	
	public ArrayList<Project> myProjectList(int mem_code){
		System.out.println(mem_code);
		return dao.myProjectList(mem_code);
	}
	
	public ArrayList<storeQnA> myProjectQnaList(int pro_code){
		return dao.myProjectQnaList(pro_code);
	}
	
	public ArrayList<storeOrder> myStoreManage(int sto_code){
		return dao.myStoreManage(sto_code);
	}
	
	public Project getProjectInfo(int pro_code) {
		return dao.getProjectInfo(pro_code);
	}
	
	public ArrayList<ProjectQna> proQnAList(int pro_code){
		return dao.proQnAList(pro_code);
	}
	
	public void proQnAAnsReg(storeQnA qna) {
		dao.proQnAAnsReg(qna);
	}
	
	public void projectCancel(int pro_code) {
		dao.projectCancel(pro_code);
	}
	
	public int getStoCode(int pro_code) {
		if(dao.isStoOpen(pro_code)==0) {
			return -1;	
		} else {
			int d = dao.getStoCode(pro_code).intValue();
			return d;
		}
		
	}
	
	public String getStoRegDate(int pro_code) {
		return dao.getStoRegDate(pro_code);
	}
	
	public MemberInfo getMemberInfo(String email) {
		
		//이름, 멤버코드, 이메일주소, balance, phoneno 가져옴
		MemberInfo memberInfo=dao.getMemberInfo(email);
		System.out.println("멤버밸런스"+memberInfo.getMem_balance());
		// count로 메이커인지 아닌지 확인 카운트 0-> 메이커아님, 카운트1->메이커
		boolean isMaker=(dao.isMaker(memberInfo.getMem_code())==1)? true:false;
		if(isMaker) {
			//메이커인 경우 메이커 코드 set
			int makerCode=dao.getMakerCode(memberInfo.getMem_code());
			memberInfo.setMaker_code(makerCode);
		} else {
			//메이커가 아닌 경우 메이커코드에 -1 set
			memberInfo.setMaker_code(-1);
		}
		return memberInfo;
	}
	
}
