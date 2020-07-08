package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.HT_StoreManageReposi;
import funfun.vo.ProOption;
import funfun.vo.ProStoOptionJoin;
import funfun.vo.Store;
import funfun.vo.storeOption;
import funfun.vo.storeOrder;
import funfun.vo.storeQnA;

@Service
public class HT_StoreManageService {
	
	@Autowired(required=false)
	private HT_StoreManageReposi dao;
	
	public Store getStoreInfo(int sto_code) {
		return dao.getStoreInfo(sto_code);
	}
	
	public int getStoOptCnt(int sto_code) {
		return dao.getStoOptCnt(sto_code);
	}
	
	public ArrayList<storeQnA> storeQnAList(int sto_code){
		return dao.storeQnAList(sto_code);
	}
	
	public void storeQnAAnsReg(storeQnA qna) {
		System.out.println("스토어 답변등록 서비스 : "+qna.getQna_code());
		dao.storeQnAAnsReg(qna);
	}
	
	public ArrayList<storeOrder> orderList(int sto_code){
		return dao.orderList(sto_code);
	}
	
	public void storeOpenStart(Store sto) {
		dao.storeOpenStart(sto);
	}
	
	public int getStoreCode() {
		return dao.getStoreCode();
	}
	
	public void storeBasicInfoReg(Store sto) {
		dao.storeBasicInfoReg(sto);
	}
	
	public ArrayList<ProOption> getProOptList(int pro_code){
		return dao.getProOptList(pro_code);
	}
	
	public void stoOptUnitReg(storeOption sto) {
		dao.stoOptUnitReg(sto);
	}
	
	public void stoOptUnitUpt(storeOption sto) {
		dao.stoOptUnitUpt(sto);
	}
	
	public void stoOptUnitDelete(int sto_opt_code) {
		dao.stoOptUnitDelete(sto_opt_code);
	}
	
	public void storeOpenRegConfirm(int sto_code) {
		dao.storeOpenRegConfirm(sto_code);
	}
	
	public ArrayList<ProStoOptionJoin> getProStoOptionJoinList(int pro_code){
		return dao.getProStoOptionJoinList(pro_code);
	}
	
}
