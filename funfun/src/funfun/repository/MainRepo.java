package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.AccountInfo;
import funfun.vo.Favor;
import funfun.vo.FavorCodeList;
import funfun.vo.MainViewProject;
import funfun.vo.MemberInfo;
import funfun.vo.MemberLogin;
import funfun.vo.MyFundingInfo;
import funfun.vo.NotificationInfo;
import funfun.vo.OptCodeAndCnt;
import funfun.vo.PagingStartEnd;
import funfun.vo.StoreTitleImageDetailPrice;


@Repository
public interface MainRepo {

	public int verifyId(MemberLogin m);
	
	public MemberInfo getMemberInfo(String email);
	
	public int signupIdCheck(String email);
	
	public void insertMember(MemberInfo m);
	
	public void changePass(MemberInfo m);
	
	public int isMaker(int mem_code);
	
	public int getMakerCode(int mem_code);
	
	public String getNameByEmail(String email);
	
	public ArrayList<Integer> getFavorCodeListByEmail(String email);
	
	public Favor getFavorByCode(Integer i);
	
	public int getBalanceByEmail(String email);
	
	public int getMemCodeByEmail(String email);
	
	public int getUsedByMemCode(int code);
	
	public ArrayList<OptCodeAndCnt> getOptCodeAndCntByMemCode(int mem_code);
	
	public MyFundingInfo getOptionInfoByOptCode(int opt_code);
	
	public int getActiveInfo(MemberLogin m);
	
	public ArrayList<NotificationInfo> getProjectOrStoreCodeListByMemCode(int memCode);
	
	public ArrayList<Integer> getFavorProjectCodeListByMemCode(int memCode);
	
	public NotificationInfo getProjectInfoLeft7DaysOrLessByProjectCode(int projectCode);
	
	public ArrayList<OptCodeAndCnt> getStoreOptNoAndCnt(int memCode);
	
	public StoreTitleImageDetailPrice getStoreInfo(int optCode);
	
	public ArrayList<MainViewProject> getMainViewProjectList(PagingStartEnd paging); 
}
