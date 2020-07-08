package khj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import cmk.Myorder;
import z01_vo.Member;
import z01_vo.Nk;
import z01_vo.Point;

public class A03_myPageService {

	private A03_myPageDao dao;
	
	public A03_myPageService() {
		super();
		dao = new A03_myPageDao();
	}
	// 수정 처리
	public void uptPw(HttpServletRequest request) {
		// 1. 수정할 요청값.
		String mem_id= Nk.toStr(request.getParameter("mem_id"));
		String mem_pw= Nk.toStr(request.getParameter("mem_pw"));
		// 2. VO에 요청값 할당.
		// 3. 수정 dao 호출 처리..
		dao.uptPw(new Member(mem_id, mem_pw));
	}	
	// 삭제처리 
	public void deleteMember(HttpServletRequest request) {
		String mem_id= Nk.toStr(request.getParameter("mem_id"));
		String mem_pw= Nk.toStr(request.getParameter("mem_pw"));
		
		dao.deleteMember(new Member(mem_id, mem_pw));
	}	
	// 상세화면 처리..
	public Member userInfo(HttpServletRequest request) {
		return dao.getMember(Nk.toStr(request.getParameter("mem_id")));
	}
	
	public ArrayList<Point> ptList(String mem_id){
		return dao.ptList(mem_id);
	}
	
	public ArrayList<Myorder> getolist(String mem_id){
		return dao.getolist(mem_id);
	}
	public ArrayList<Myorder> olist(String mem_id){
		return dao.olist(mem_id);
	}
	
	public ArrayList<Myorder> myolist(String mem_id, HttpServletRequest request){
		int ord_no = Nk.toInt(request.getParameter("ord_no"));
		return dao.myolist(mem_id, ord_no);
	}
}
