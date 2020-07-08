package khj;

import java.util.ArrayList;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import cmk.Myorder;
import jhk.Comdetail;
import z01_vo.Computer;
import z01_vo.Member;
import z01_vo.Mgr;
import z01_vo.Nk;
import z01_vo.Parts;
import z01_vo.Request;

public class A04_adminService {

		private A04_adminDao dao;
		
		
		public A04_adminService() {
			super();
			dao = new A04_adminDao();
		}
		// 회원리스트
		public ArrayList<Member> Member(HttpServletRequest request) {
			return dao.mlist();
		}
		// 회원상세
		public Member memberDetail(HttpServletRequest request) {
			String mem_id = Nk.toStr(request.getParameter("mem_id"));
			
			return dao.mdetail(mem_id);
		}
		// 회원삭제
		public void deleteMember(HttpServletRequest request) {
			String mem_id = Nk.toStr(request.getParameter("mem_id"));
			
			dao.deleteMember(mem_id);
		}
		
		public ArrayList<Computer> clist(HttpServletRequest request){
			String category = Nk.toStr(request.getParameter("category"));
			if(category==null||category.equals("")) category="all";
			return dao.getComList(category);
		}
		
		public ArrayList<Comdetail> cdlist(HttpServletRequest request){
			int com_no = Nk.toInt(request.getParameter("com_no"));
			return dao.getComDetailList(com_no);
		}
		
		public Computer cominfo(HttpServletRequest request) {
			int com_no = Nk.toInt(request.getParameter("com_no"));
			return dao.getComDetail(com_no);
		}
		
		public ArrayList<Parts> plist(HttpServletRequest request){
			String category = Nk.toStr(request.getParameter("category"));
			if(category==null||category.equals("")) category="all";
			return dao.getPartsList(category);
		}
		public Parts partsinfo(HttpServletRequest request) {
			int parts_no = Nk.toInt(request.getParameter("parts_no"));
			return dao.getPartsDetail(parts_no);
		}		
		
		// mgr 목록 
		// int mgr_no, int as_no, Date as_date, String as_cate,
		// String mem_id, Date mgr_date, String mgr_stat
		public ArrayList<Mgr> mgrList(){
			return dao.mgrList();
		}
		
		// mgr 상세
		public Mgr mgrDetail(HttpServletRequest request){
			int mgr_no = Nk.toInt(request.getParameter("mgr_no"));
			
			return dao.mgrDetail(mgr_no);
		}
		
		// 상품명 목록
		public ArrayList<Mgr> reqList(HttpServletRequest request) {
			int mgr_no = Nk.toInt(request.getParameter("mgr_no"));
			// mgr_no, req_no, parts_img, parts_name, req_cnt
			return dao.reqList(mgr_no);
		}
		
		// mgr 수정
		public void uptMgr(HttpServletRequest request) {
			//int mgr_no, String mgr_stat, String mgr_note, int mgr_price
			int mgr_no = Nk.toInt(request.getParameter("mgr_no"));
			String mgr_stat = Nk.toStr(request.getParameter("mgr_stat"));
			String mgr_note = Nk.toStr(request.getParameter("mgr_note"));
			int mgr_price = Nk.toInt(request.getParameter("mgr_price"));
			System.out.println("no:"+mgr_no+"stat"+mgr_stat+"note:"+mgr_note+"price:"+mgr_price);
			Mgr upt = new Mgr(mgr_no, mgr_stat, mgr_note, mgr_price);
			dao.uptMgr(upt);
		}
		public ArrayList<Myorder> getOrders(HttpServletRequest request){
			return dao.getOrders();			
		}
		public ArrayList<Myorder> OrdersList(HttpServletRequest request){
			return dao.OrdersList();
		}
		public ArrayList<Myorder> getord(HttpServletRequest request){
			int ord_no = Nk.toInt(request.getParameter("ord_no"));
			return dao.getord(ord_no);
		}
		public void uptOrd(HttpServletRequest request) {
			int ord_no = Nk.toInt(request.getParameter("ord_no"));
			Long ord_invoice = Nk.toLong(request.getParameter("ord_invoice"));
			dao.uptOrd(new Myorder(ord_no,ord_invoice));
		}
}
