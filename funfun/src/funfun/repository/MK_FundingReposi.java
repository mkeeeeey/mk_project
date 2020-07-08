package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Funding;
import funfun.vo.Paging;
import funfun.vo.ProOption;
import funfun.vo.Project;
import funfun.vo.ProjectQna;
import funfun.vo.ProjectSch;
import funfun.vo.Report;

@Repository
public interface MK_FundingReposi {
	// 프로젝트 목록
	public int projcnt(ProjectSch sch);
	public ArrayList<Project> projectList(ProjectSch sch);
	// 프로젝트 상세보기
	public Project detail(int pro_code);
	// 프로젝트 옵션
	public ArrayList<ProOption> proOptList(int pro_code);
	// 선택 옵션
	public ProOption option(int opt_code);
	// 관심프로젝트 등록 확인
	public int ckfavor(Project sf);
	// 관심프로젝트 등록
	public void insFavor(Project proj);
	// 프로젝트 신고 리스트 
	public int reportcnt();
	public ArrayList<Report> reportList(Paging sch);
	// 신고 상세보기
	public Report report(int report_code);
	// 신고 내역 확인
	public void uptReport(Report upt);
	// 프로젝트 신고
	public void insReport(Report ins);
	// 파일정보 등록
	public void reportImg(String img);
	// 문의 리스트
	public ArrayList<ProjectQna> inquiryList(int pro_code);
	// 문의하기
	public void inquiry(ProjectQna qna);
	// 문의 답변
	public void answer(ProjectQna upt);
	// 예치금 잔액 조회
	public int balance(int mem_code);
	// 펀딩하기
	public void funding(Funding ins);
	public void uptMoney(Funding upt);
	public void useBalance(Funding use);
	public void uptBalance(Funding upt);
	public void uptCnt(Funding upt);
	
}
