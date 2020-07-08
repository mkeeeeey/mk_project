package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.AdminMember;
import funfun.vo.Notice;
import funfun.vo.Paging;

@Repository
public interface Sw_AdminMemberDao {
	// 검색할 내용의 전체 데이터 건수.
	public int AdminMemberCnt();
	
	// 검색된 데이터 리스트
	public ArrayList<AdminMember> list(Paging sch);
	public void insert(AdminMember ins);
	
	// 데이터 상세보기
	public AdminMember detail(int mem_code);
	public void update(AdminMember upt);
	public void update2(AdminMember upt);
	
}
