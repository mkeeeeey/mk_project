package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.Sw_AdminDao;
import funfun.vo.Admin;
import funfun.vo.MemberLogin;
import funfun.vo.Paging;

@Service
public class Sw_AdminService {
	@Autowired(required=false)
	private Sw_AdminDao dao;
	
	public ArrayList<Admin> list(Paging sch){
		/*
		// 2. 페이징 처리
		private int count; 		// 총 데이터 건수
		private int pageSize; 	// 한번에 보여줄 페이지 크기..
		private int pageCount; 	// 총 페이지 수. count/pageSize
		private int curPage; 	// 클릭한 현재 페이지번호
		private int start;		// 화면에 보여줄 페이지의 시작번호
		private int end;		// 화면에 보여줄 페이지의 마지막번호
		*/
		sch.setCount(dao.AdminCnt());
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
		
		return dao.list(sch);
	}
	
	public void insert(Admin ins) {
		dao.insert(ins);
	};
	
	public int verifyAdmId(Admin admin) {
		//이메일, 비밀번호가 일치하는지 먼저 검증.
		return dao.verifyAdmId(admin);
	};
	
	public Admin detail(int admin_code) {
		return dao.detail(admin_code);
	};
	public void update(Admin upt) {
		dao.update(upt);
	};
	public void delete(int admin_code) {
		dao.delete(admin_code);
	};
	
}
