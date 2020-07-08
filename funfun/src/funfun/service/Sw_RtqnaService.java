package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.Sw_RtqnaDao;
import funfun.vo.Notice;
import funfun.vo.Paging;
import funfun.vo.Rtqna;

@Service
public class Sw_RtqnaService {
	@Autowired(required=false)
	private Sw_RtqnaDao dao;
	
	public ArrayList<Rtqna> list(Paging sch){
		/*
		// 2. 페이징 처리
		private int count; 		// 총 데이터 건수
		private int pageSize; 	// 한번에 보여줄 페이지 크기..
		private int pageCount; 	// 총 페이지 수. count/pageSize
		private int curPage; 	// 클릭한 현재 페이지번호
		private int start;		// 화면에 보여줄 페이지의 시작번호
		private int end;		// 화면에 보여줄 페이지의 마지막번호
		*/
		sch.setCount(dao.rtqnatotCnt());
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
	
	
	public int ckrtqna(int mem_code) {
		return dao.ckrtqna(mem_code);
	}
	public int rtqna_code(int mem_code) {
		return dao.rtqna_code(mem_code);
	}
	public void insertrtqna(int mem_code){
		dao.insertrtqna(mem_code);
	};
	public void insert(Rtqna ins){
		dao.insert(ins);
	};
	
	
	public ArrayList<Rtqna> detail(int mem_code) {
		System.out.println("rtqna 상세화면 호출");
		return dao.detail(mem_code);
	};
	public Rtqna chatdetail(int mem_code) {
		return dao.chatdetail(mem_code);
	}
	
	// rtqna_state 변경
	public void uptSt1(int mem_code) {
		dao.uptSt1(mem_code);
	}
	public void uptSt2(int mem_code) {
		dao.uptSt2(mem_code);
	}
	public void uptSt3(int mem_code) {
		dao.uptSt3(mem_code);
	}
	
}
