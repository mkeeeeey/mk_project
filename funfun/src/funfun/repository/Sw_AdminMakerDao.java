package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.AdminMaker;
import funfun.vo.Paging;

@Repository
public interface Sw_AdminMakerDao {
	// 검색할 내용의 전체 데이터 건수.
	public int AdminMakerCnt();
	
	// 검색된 데이터 리스트
	public ArrayList<AdminMaker> list(Paging sch);
	public void insert(AdminMaker ins);
	
	// 데이터 상세보기
	public AdminMaker detail(int maker_code);
	public void update(AdminMaker upt);
	public void update2(AdminMaker upt);
	
}
