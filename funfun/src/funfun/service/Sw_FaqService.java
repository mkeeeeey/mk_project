package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.Sw_FaqDao;
import funfun.vo.Faq;
import funfun.vo.Notice;
import funfun.vo.Paging;

@Service
public class Sw_FaqService {
	@Autowired(required=false)
	private Sw_FaqDao dao;
	
	public ArrayList<Faq> list(Paging sch){
		
		// 1. 초기 검색값 없을 경우
		if(sch.getTitle() == null) {
			sch.setTitle("");
		}
		
		/*
		// 2. 페이징 처리
		private int count; 		// 총 데이터 건수
		private int pageSize; 	// 한번에 보여줄 페이지 크기..
		private int pageCount; 	// 총 페이지 수. count/pageSize
		private int curPage; 	// 클릭한 현재 페이지번호
		private int start;		// 화면에 보여줄 페이지의 시작번호
		private int end;		// 화면에 보여줄 페이지의 마지막번호
		*/
		sch.setCount(dao.faqtotCnt(sch));
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
	
	public void insert(Faq ins){
		dao.insert(ins);
		System.out.println("faq 등록 완료");
	};
	
	public Faq detail(int faq_code) {
		System.out.println("faq 상세화면 호출");
		return dao.detail(faq_code);
	};
	public void update(Faq upt) {
		dao.update(upt);
		System.out.println("faq 수정 완료");
	};
	public void delete(int faq_code) {
		dao.delete(faq_code);
		System.out.println("faq 삭제 완료");
	};
}
