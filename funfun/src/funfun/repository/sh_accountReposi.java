package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Balance;
import funfun.vo.Deposit;
import funfun.vo.Paging_sh;
import funfun.vo.UserProfile;
import funfun.vo.Withdrawl;

@Repository
public interface sh_accountReposi {
	public ArrayList<Balance> blist(Paging_sh psh);
	public UserProfile clist(String memEmail);
	public int chargeQuery(UserProfile uf);  /* member 테이블 업데이트 */
	public int uptDepoBalanceTb(UserProfile uf);
	public int uptWithBalanceTb(UserProfile uf);
	public int minusBal(UserProfile uf);  /* member 테이블 업데이트 */
	public int insDeposit(Deposit rs);
	public int insWithdrawl(Withdrawl wd);
	public int chgAccountInfo(UserProfile uf);
	public int totCnt(Paging_sh psh);
	public ArrayList<Withdrawl> wilist(Paging_sh psh);
	public ArrayList<Deposit> rdlist(Paging_sh psh);
	
}
