package funfun.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.sh_myPageReposi;
import funfun.vo.Favor;
import funfun.vo.MyPageInfo;
import funfun.vo.PartiFunding;
import funfun.vo.TranLookUp;


@Service
public class sh_myPageService {
	@Autowired(required=false)
	private sh_myPageReposi dao;
	
	public ArrayList<Favor> list(String memEmail){
		return dao.list(memEmail);
	}
	public ArrayList<PartiFunding> plist(String memEmail){
		return dao.plist(memEmail);
	}
	public ArrayList<TranLookUp> tlist(String memEmail){
		return dao.tlist(memEmail);
	}
	
	public String memState(String memEmail){ 
		return dao.memState(memEmail); 
	}
	public int fundCnt(String memEmail){ 
		return dao.fundCnt(memEmail); 
	}
	public int orderCnt(String memEmail){ 
		return dao.orderCnt(memEmail); 
	}
	public MyPageInfo mypageinfo(String memEmail){ 
		return dao.mypageinfo(memEmail); 
	}
	public void changeAdr(HashMap<String,String> hm) {
		dao.changeAdr(hm);
	}
	public void changeFundingAdr(HashMap<String,String> hm2) {
		dao.changeFundingAdr(hm2);
	}
	public void cancleOrder(String oc) {
		dao.cancleOrder(oc);
	}
	public void cancleFunding(HashMap<String,String> hm3) {
		dao.cancleFunding(hm3);
	}
	public void deleteFavor(HashMap<String,String> hmDF) {
		dao.deleteFavor(hmDF);
	}
	public void cancleFundingBal(HashMap<String,String> hmBal) {
		dao.cancleFundingBal(hmBal);
	}
	public void cancleFundingBalTb(HashMap<String,String> hmBalTb) {
		dao.cancleFundingBalTb(hmBalTb);
	}
	public void cancleOrderBal(HashMap<String,String> hmBalO) {
		dao.cancleOrderBal(hmBalO);
	}
	public void cancleOrderBalTb(HashMap<String,String> hmBalTbO) {
		dao.cancleOrderBalTb(hmBalTbO);
	}
}
