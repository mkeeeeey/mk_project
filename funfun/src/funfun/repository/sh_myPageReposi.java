package funfun.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import funfun.vo.Favor;
import funfun.vo.MyPageInfo;
import funfun.vo.PartiFunding;
import funfun.vo.TranLookUp;


@Repository
public interface sh_myPageReposi {
	public ArrayList<Favor> list(String memEmail);
	public ArrayList<PartiFunding> plist(String memEmail);
	public ArrayList<TranLookUp> tlist(String memEmail);
	public String memState(String memEmail);
	public int fundCnt(String memEmail);
	public int orderCnt(String memEmail);
	public MyPageInfo mypageinfo(String memEmail);
	public void changeAdr(HashMap<String,String> map);
	public void changeFundingAdr(HashMap<String,String> map);
	public int cancleOrder(String oc);
	public int cancleFunding(HashMap<String,String> hm3);
	public void deleteFavor(HashMap<String,String> hmDF);
	public int cancleFundingBal(HashMap<String,String> hmBal);
	public int cancleFundingBalTb(HashMap<String,String> hmBalTb);
	public int cancleOrderBal(HashMap<String,String> hmBalO);
	public int cancleOrderBalTb(HashMap<String,String> hmBalTbO);
}
