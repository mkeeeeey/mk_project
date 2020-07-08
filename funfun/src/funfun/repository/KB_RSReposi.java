package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Paging;
import funfun.vo.RewardStore;
import funfun.vo.storeOption;

@Repository
public interface KB_RSReposi {
	public ArrayList<RewardStore> slist(Paging sch);
	
	public RewardStore sdetail(int sto_code);
	
	public int storeCnt(Paging sch);
	
	public int storeAdminCnt(Paging sch);
	
	public ArrayList<RewardStore> adminList(Paging sch);
	
	public RewardStore adminDetail(int sto_code);
	
	public void UptCurr(RewardStore rs);
}
