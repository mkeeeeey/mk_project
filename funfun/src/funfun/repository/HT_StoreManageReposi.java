package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.ProOption;
import funfun.vo.ProStoOptionJoin;
import funfun.vo.Store;
import funfun.vo.storeOption;
import funfun.vo.storeOrder;
import funfun.vo.storeQnA;

@Repository
public interface HT_StoreManageReposi {
	
	public Store getStoreInfo(int sto_code);
	public int getStoOptCnt(int sto_code);
	public ArrayList<storeQnA> storeQnAList(int sto_code);
	public void storeQnAAnsReg(storeQnA qna);
	public ArrayList<storeOrder> orderList(int sto_code);
	public void storeOpenStart(Store sto);
	public int getStoreCode();
	public void storeBasicInfoReg(Store sto);
	public ArrayList<ProOption> getProOptList(int pro_code);
	public void stoOptUnitReg(storeOption sto);
	public void stoOptUnitUpt(storeOption sto);
	public void stoOptUnitDelete(int sto_opt_code);
	public void storeOpenRegConfirm(int sto_code);
	public ArrayList<ProStoOptionJoin> getProStoOptionJoinList(int pro_code);
}
