package funfun.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.KB_QnAReposi;
import funfun.repository.KB_RSOptionRep;
import funfun.repository.KB_RSPayReposi;
import funfun.repository.KB_RSReposi;
import funfun.vo.*;
import java.util.*;

@Service
public class KB_StoreService {
	@Autowired(required=false)
	KB_RSReposi dao;
	@Autowired(required=false)
	KB_RSOptionRep opt_dao;
	@Autowired(required=false)
	KB_QnAReposi qna_dao;
	@Autowired(required=false)
	KB_RSPayReposi pay_dao;
	
	public ArrayList<RewardStore> slist(Paging sch){
		sch.setCount(dao.storeCnt(sch));
		if(sch.getPageSize() == 0) {
			sch.setPageSize(12);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage() == 0) {
			sch.setCurPage(1);
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1); // start => (curPage-1)*pageSize+1
		sch.setEnd(sch.getCurPage()*sch.getPageSize());			// end 	 => curPage*pageSize
		
		/*
		// 3. 블럭 처리.
		private int blocksize;  // 한번에 보여줄 block의 크기
		private int startBlock;	// block의 시작번호
		private int endBlock;	// block의 마지막번호
		*/
		sch.setBlocksize(5);
		// int blocknum 현재 위치한 블럭의 단계 1~5 = 1, 6~10=2..
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
		int endblock = blocknum*sch.getBlocksize();
		sch.setEndBlock(endblock>sch.getPageCount()?sch.getPageCount():endblock);
		
		return dao.slist(sch);
	}
	
	public RewardStore sdetail(int sto_code) {
		return dao.sdetail(sto_code);
	}
	
	public ArrayList<storeOption> stoOptlist(int sto_code){
		return opt_dao.stoOptList(sto_code);
	}
	
	public storeOption stoOpt(int sto_opt_code) {
		return opt_dao.stoOpt(sto_opt_code);
	}
	
	public ArrayList<storeQnA> qnaList(Paging sch){
		
		sch.setCount(qna_dao.qnaCnt(sch.getSto_code()));
		if(sch.getPageSize() == 0) {
			sch.setPageSize(5);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage() == 0) {
			sch.setCurPage(1);
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1); // start => (curPage-1)*pageSize+1
		sch.setEnd(sch.getCurPage()*sch.getPageSize());			// end 	 => curPage*pageSize
		
		/*
		// 3. 블럭 처리.
		private int blocksize;  // 한번에 보여줄 block의 크기
		private int startBlock;	// block의 시작번호
		private int endBlock;	// block의 마지막번호
		*/
		sch.setBlocksize(5);
		// int blocknum 현재 위치한 블럭의 단계 1~5 = 1, 6~10=2..
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
		int endblock = blocknum*sch.getBlocksize();
		sch.setEndBlock(endblock>sch.getPageCount()?sch.getPageCount():endblock);

		return qna_dao.qnaList(sch);
	}

	public void qnaInsert(storeQnA store) {
		 qna_dao.qnaInsert(store);
	}
	
	public String opt_title(int sto_opt_code) {
		return opt_dao.opt_title(sto_opt_code);
	}
	
	public int mem_balance(int mem_code) {
		return opt_dao.mem_balance(mem_code);
	}
	
	public void payInsert(storePay pay) {
		pay_dao.payInsert(pay);
	}
	
	public void UptMemBalance(storePay pay) {
		pay_dao.UptMemBalance(pay);
	}
	
	public ArrayList<RewardStore> adminList(Paging sch){
		sch.setCount(dao.storeAdminCnt(sch));
		if(sch.getPageSize() == 0) {
			sch.setPageSize(7);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage() == 0) {
			sch.setCurPage(1);
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1); // start => (curPage-1)*pageSize+1
		sch.setEnd(sch.getCurPage()*sch.getPageSize());			// end 	 => curPage*pageSize
		
		/*
		// 3. 블럭 처리.
		private int blocksize;  // 한번에 보여줄 block의 크기
		private int startBlock;	// block의 시작번호
		private int endBlock;	// block의 마지막번호
		*/
		sch.setBlocksize(5);
		// int blocknum 현재 위치한 블럭의 단계 1~5 = 1, 6~10=2..
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
		int endblock = blocknum*sch.getBlocksize();
		sch.setEndBlock(endblock>sch.getPageCount()?sch.getPageCount():endblock);
		
		return dao.adminList(sch);
	}
	
	public RewardStore adminDetail(int sto_code) {
		return dao.adminDetail(sto_code);
	}
	
	public void UptCurr(RewardStore rs) {
		dao.UptCurr(rs);
	}
	
	public int payCode(int mem_code) {
		return pay_dao.payCode(mem_code);
	}
	
	public void InsertBalance(storePay pay) {
		pay_dao.InsertBalance(pay);
	}
}
