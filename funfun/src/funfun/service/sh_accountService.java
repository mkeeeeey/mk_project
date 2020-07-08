package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.sh_accountReposi;
import funfun.vo.Balance;
import funfun.vo.Deposit;
import funfun.vo.Paging_sh;
import funfun.vo.UserProfile;
import funfun.vo.Withdrawl;

@Service
public class sh_accountService {
	@Autowired(required=false)
	private sh_accountReposi dao;
	
	public ArrayList<Balance> blist(Paging_sh psh){
		psh.setCount(dao.totCnt(psh));
		psh.setPageSize(10);
		
		psh.setPageCount((int)Math.ceil(psh.getCount()/(double)psh.getPageSize()));
		if(psh.getCurPage() == 0) {
			psh.setCurPage(1);
		}
		psh.setStart((psh.getCurPage()-1)*psh.getPageSize()+1);
		psh.setEnd(psh.getCurPage()*psh.getPageSize());
		
		psh.setBlocksize(5);
		int blocknum = (int)Math.ceil(psh.getCurPage()/(double)psh.getBlocksize());
		psh.setStartBlock((blocknum-1)*psh.getBlocksize()+1);
		int endblock = blocknum*psh.getBlocksize();
		psh.setEndBlock(endblock>psh.getPageCount()?psh.getPageCount():endblock);
		
		return dao.blist(psh);
	}
	public UserProfile clist(String memEmail){
		return dao.clist(memEmail);
	}
	public int chargeQuery(UserProfile uf){
		return dao.chargeQuery(uf);
	}
	public ArrayList<Deposit> rdlist(Paging_sh psh){
		psh.setCount(dao.totCnt(psh));
		psh.setPageSize(5);
		
		psh.setPageCount((int)Math.ceil(psh.getCount()/(double)psh.getPageSize()));
		if(psh.getCurPage() == 0) {
			psh.setCurPage(1);
		}
		psh.setStart((psh.getCurPage()-1)*psh.getPageSize()+1);
		psh.setEnd(psh.getCurPage()*psh.getPageSize());

		psh.setBlocksize(5);
		int blocknum = (int)Math.ceil(psh.getCurPage()/(double)psh.getBlocksize());
		psh.setStartBlock((blocknum-1)*psh.getBlocksize()+1);
		int endblock = blocknum*psh.getBlocksize();
		psh.setEndBlock(endblock>psh.getPageCount()?psh.getPageCount():endblock);
		

		return dao.rdlist(psh);
	}
	public int insDeposit(Deposit ds){
		return dao.insDeposit(ds);
	}
	public ArrayList<Withdrawl> wilist(Paging_sh psh){
		psh.setCount(dao.totCnt(psh));
		psh.setPageSize(5);
		
		psh.setPageCount((int)Math.ceil(psh.getCount()/(double)psh.getPageSize()));
		if(psh.getCurPage() == 0) {
			psh.setCurPage(1);
		}
		psh.setStart((psh.getCurPage()-1)*psh.getPageSize()+1);
		psh.setEnd(psh.getCurPage()*psh.getPageSize());

		psh.setBlocksize(5);
		int blocknum = (int)Math.ceil(psh.getCurPage()/(double)psh.getBlocksize());
		psh.setStartBlock((blocknum-1)*psh.getBlocksize()+1);
		int endblock = blocknum*psh.getBlocksize();
		psh.setEndBlock(endblock>psh.getPageCount()?psh.getPageCount():endblock);
		
		
		return dao.wilist(psh);
	}
	public int minusBal(UserProfile uf){
		return dao.minusBal(uf);
	}
	public int insWithdrawl(Withdrawl wd){
		return dao.insWithdrawl(wd);
	}
	public int uptDepoBalanceTb(UserProfile uf){
		return dao.uptDepoBalanceTb(uf);
	}
	public int uptWithBalanceTb(UserProfile uf){
		return dao.uptWithBalanceTb(uf);
	}
	public int chgAccountInfo(UserProfile uf){
		return dao.chgAccountInfo(uf);
	}
}
