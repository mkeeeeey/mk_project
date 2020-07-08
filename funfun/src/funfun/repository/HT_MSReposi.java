package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.MakerStudio;
import funfun.vo.MemberInfo;
import funfun.vo.Project;
import funfun.vo.ProjectQna;
import funfun.vo.storeOrder;
import funfun.vo.storeQnA;

@Repository
public interface HT_MSReposi {

	public void regMaker(MakerStudio reg);
	public MakerStudio makerInfo(int mem_code);
	public void makerInfoUpt(MakerStudio upt);
	public ArrayList<Project> myProjectList(int mem_code);
	public ArrayList<storeQnA> myProjectQnaList(int pro_code);
	public ArrayList<storeOrder> myStoreManage(int sto_code);
	public Project getProjectInfo(int pro_code);
	public ArrayList<ProjectQna> proQnAList(int pro_code);
	public void proQnAAnsReg(storeQnA qna);
	public void projectCancel(int pro_code);
	public int isStoOpen(int pro_code);
	public Integer getStoCode(int pro_code);
	public String getStoRegDate(int pro_code);
	public MemberInfo getMemberInfo(String email);
	public int getMakerCode(int mem_code);
	public int isMaker(int mem_code);
}
