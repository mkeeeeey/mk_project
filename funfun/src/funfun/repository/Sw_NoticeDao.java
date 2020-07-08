package funfun.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import funfun.vo.Notice;
import funfun.vo.Paging;

@Repository
public interface Sw_NoticeDao {
	// 검색할 내용의 전체 데이터 건수.
	public int notitotCnt();
	
	// 검색된 데이터 리스트
	public ArrayList<Notice> toplist();
	public ArrayList<Notice> list(Paging sch);
	public void insert(Notice ins);
	
	// 데이터 상세보기
	public Notice detail(int noti_code);
	public void update(Notice upt);
	public void delete(int noti_code);
	
	/*
	// 파일 정보 등록..
	public void insertRepo(String fname);
	// 파일 다운로드 정보 
	public ArrayList<String> fnames(int no);
	public void insFileInfo(HashMap hm);
	public void uptFileInfo(HashMap hm);
	public void deleteFile(int no);
	
	*/
	
	
}
