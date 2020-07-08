package funfun.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.KB_adminPrjReposi;
import funfun.vo.*;
import java.util.*;
@Service
public class KB_adminService {

	@Autowired(required=false)
	KB_adminPrjReposi dao;
	public ArrayList<Project> projectList(Paging sch){
		sch.setCount(dao.proCnt());
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
		
		return dao.projectList(sch);
		
	}
	
	public int proCnt() {
		return dao.proCnt();
	}
	
	public Project proDetail(int pro_code) {
		return dao.proDetail(pro_code);
	}
	
	public void UptCurr(Project pro) {
		dao.UptCurr(pro);
	}
}
