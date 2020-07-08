package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.MainRepo;
import funfun.vo.AccountInfo;
import funfun.vo.Favor;
import funfun.vo.FavorCodeList;
import funfun.vo.MainViewProject;
import funfun.vo.MemberInfo;
import funfun.vo.MemberLogin;
import funfun.vo.MyFundingInfo;
import funfun.vo.MyOrderInfo;
import funfun.vo.NotificationInfo;
import funfun.vo.OptCodeAndCnt;
import funfun.vo.PagingStartEnd;
import funfun.vo.StoreTitleImageDetailPrice;

@Service
public class MainService {

	@Autowired
	private MainRepo repo;
	
	public int verifyId(MemberLogin m) {
		
		//이메일, 비밀번호가 일치하는지 먼저 검증.
		if(repo.verifyId(m)==1) {
			//일치하는 경우
			if(repo.getActiveInfo(m)>0) {
				//정지되지 않은 사용자
				return 1;
			} else {
				//정지된 사용자
				return -1;
			}
			
		} else {
			return 0;
		}
		
		
	}
	
	public MemberInfo getMemberInfo(String email) {
		
		//이름, 멤버코드, 이메일주소, balance, phoneno 가져옴
		MemberInfo memberInfo=repo.getMemberInfo(email);
		System.out.println("멤버밸런스"+memberInfo.getMem_balance());
		// count로 메이커인지 아닌지 확인 카운트 0-> 메이커아님, 카운트1->메이커
		boolean isMaker=(repo.isMaker(memberInfo.getMem_code())==1)? true:false;
		if(isMaker) {
			//메이커인 경우 메이커 코드 set
			int makerCode=repo.getMakerCode(memberInfo.getMem_code());
			memberInfo.setMaker_code(makerCode);
		} else {
			//메이커가 아닌 경우 메이커코드에 -1 set
			memberInfo.setMaker_code(-1);
		}
		return memberInfo;
	}
	

	public boolean signupIdCheck(String email) {
		if(repo.signupIdCheck(email)==1) {
			return false; //���̵�����
		} else {
			return true;
		}
	}
	
	public void insertMember(MemberInfo m) {
		repo.insertMember(m);
	}
	
	public boolean changePass(MemberInfo m) {
		repo.changePass(m);
		return true;
	}
	
	public String getNameByEmail(String email) {
		return repo.getNameByEmail(email);
	}
	
	public FavorCodeList getFavorCodeListByEmail(String email){
		int memCode=repo.getMemCodeByEmail(email);
		FavorCodeList favorCodeList= new FavorCodeList();
		favorCodeList.setList(repo.getFavorProjectCodeListByMemCode(memCode));
		return favorCodeList;
	}
	
	public Favor getFavorByCode(Integer i) {
		Favor favor = repo.getFavorByCode(i);
		favor.setdDay(favor.getdDay().substring(0,4));
		return favor;
	}
	
	public AccountInfo getAccountInfo(String email) {
		int balance=repo.getBalanceByEmail(email);
		int memCode=repo.getMemCodeByEmail(email);
		int used=repo.getUsedByMemCode(memCode);
		
		
		AccountInfo accountInfo = new AccountInfo();
		accountInfo.setTotal(balance);
		accountInfo.setUsed(used);
		
		return accountInfo;
	}
	
	public ArrayList<MyFundingInfo> getMyFundingList(String email){
		
		ArrayList<MyFundingInfo> list=new ArrayList<MyFundingInfo>();
		//먼저 이메일로 mem_code를 가져온다.
		System.out.println("먼저 이메일로 mem_code를 가져온다."+email);
		int mem_code=repo.getMemCodeByEmail(email);
		//가져온 code로 Funding Table로부터 Optioncode와 수량을 가져온다.
		System.out.println("가져온 code로 Funding Table로부터 Optioncode와 수량을 가져온다."+mem_code);
		ArrayList<OptCodeAndCnt> optCodeAndCnt=repo.getOptCodeAndCntByMemCode(mem_code);
		System.out.println(optCodeAndCnt.size());
		for(OptCodeAndCnt o:optCodeAndCnt) {
			MyFundingInfo tmp=repo.getOptionInfoByOptCode(o.getOptionCode());
			tmp.setOrderCnt(o.getCnt());
			list.add(tmp);
		}
		return list;
	}
	
	public ArrayList<NotificationInfo> getNotificationList(int memCode){
		
		ArrayList<NotificationInfo> list = repo.getProjectOrStoreCodeListByMemCode(memCode);
		for(NotificationInfo info:list) {
			int code = info.getCode();
			int tmp=code/10000000;
			if(tmp==2) {
				info.setType("project");
			} else if(tmp==3) {
				info.setType("store");
			}
		}
		return list;
	}
	
	public ArrayList<NotificationInfo> getFavorProjectListLeft7DaysOrLess(int memCode){
		ArrayList<NotificationInfo> tmp= new ArrayList<NotificationInfo>();
		ArrayList<Integer> codeList= repo.getFavorProjectCodeListByMemCode(memCode);
		for(Integer i:codeList) {
			if(repo.getProjectInfoLeft7DaysOrLessByProjectCode(i)!=null) {
				tmp.add(repo.getProjectInfoLeft7DaysOrLessByProjectCode(i));
			} else {
			}
		}
		return tmp;
	}
	
	public ArrayList<MyOrderInfo> getMyOrderList(String email){
		// 리턴할 어레이
		ArrayList<MyOrderInfo> list0=new ArrayList<MyOrderInfo>();
		//이메일로 멤버코드
		int memCode=repo.getMemCodeByEmail(email);
		//멤버코드로 옵션 및 수량 
		ArrayList<OptCodeAndCnt> list1=repo.getStoreOptNoAndCnt(memCode);
		System.out.println(list1.size());
		for (OptCodeAndCnt ocac:list1) {
			StoreTitleImageDetailPrice restInfo =repo.getStoreInfo(ocac.getOptionCode());
			if(restInfo!=null) {
				MyOrderInfo tmp=new MyOrderInfo();
				tmp.setOrderCnt(ocac.getCnt());
				tmp.setState(ocac.getState());
				tmp.setImage(restInfo.getImage());
				tmp.setTitle(restInfo.getTitle());
				tmp.setPrice(restInfo.getPrice());
				tmp.setOption(restInfo.getDetail());
				list0.add(tmp);
			}
		}
		
		return list0;
	}
	
	public ArrayList<MainViewProject> getMainViewProject(int page, String cate){
		PagingStartEnd paging = new PagingStartEnd();
		paging.setCategory(cate);
		paging.setStart((page-1)*9);
		paging.setEnd(page*9);
		System.out.println("paging start"+paging.getStart());
		System.out.println("paging end"+paging.getEnd());
		System.out.println("paging cate"+paging.getCategory());
		ArrayList<MainViewProject> list=repo.getMainViewProjectList(paging);
		System.out.println("리스트");
		for(MainViewProject m:list) {
			System.out.println(m.getTitle());
			int a=(int)Math.round(((double)100*m.getCurrentFunding()/m.getTargetFunding()));
			m.setPercent(a);
			m.setRestDay(Math.floor(m.getRestDay()));
		}
		return list;
	}
	
	
}
