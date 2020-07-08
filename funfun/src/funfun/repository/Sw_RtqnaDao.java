package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Notice;
import funfun.vo.Paging;
import funfun.vo.Rtqna;

@Repository
public interface Sw_RtqnaDao {
	// 검색할 내용의 전체 데이터 건수.
	public int rtqnatotCnt();
	
	// 검색된 데이터 리스트
	public ArrayList<Rtqna> list(Paging sch);
	
	// 채팅방 유무확인
	public int ckrtqna(int mem_code);
	public int rtqna_code(int mem_code);
	// 채팅방 등록
	public void insertrtqna(int mem_code);
	// 채팅 내용 등록
	public void insert(Rtqna ins);
	
	// 데이터 상세보기
	public ArrayList<Rtqna> detail(int mem_code);
	public Rtqna chatdetail(int mem_code);
	// rtqna_state 변경
	public void uptSt1(int mem_code);
	public void uptSt2(int mem_code);
	public void uptSt3(int mem_code);
	
}
