package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Faq;
import funfun.vo.Notice;
import funfun.vo.Paging;

@Repository
public interface Sw_FaqDao {
	// 검색할 내용의 전체 데이터 건수.
	public int faqtotCnt(Paging sch);
	
	// 검색된 데이터 리스트
	public ArrayList<Faq> list(Paging sch);
	public void insert(Faq ins);
	
	// 데이터 상세보기
	public Faq detail(int faq_code);
	public void update(Faq upt);
	public void delete(int faq_code);
	
}
