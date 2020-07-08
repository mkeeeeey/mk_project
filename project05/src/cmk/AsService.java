package cmk;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import z01_vo.Nk;
import z01_vo.Order;
import z01_vo.As;

public class AsService {
	private AsDao dao;

	public AsService() {
		super();
		// TODO Auto-generated constructor stub
		dao = new AsDao();
	}
	
	public ArrayList<As> asList(){
		return dao.asList();
	}
	
	public As asList(HttpServletRequest request){
		int as_no = Nk.toInt(request.getParameter("as_no"));
		
		return dao.asList(as_no);
	}
	
	public ArrayList<As> asDetail(HttpServletRequest request){
		int as_no = Nk.toInt(request.getParameter("as_no"));
		
		return dao.getAs(as_no);
	}
	
	public void delAs(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		dao.delAs(as_no);
	}
	
	public void insAs(HttpServletRequest request) {
		int ord_no = Nk.toInt(request.getParameter("ord_no"));
		String as_cate = Nk.toStr(request.getParameter("as_cate"));
		String as_detail = Nk.toStr(request.getParameter("as_detail"));
		As ins = new As(ord_no,as_cate,as_detail);
		dao.insAs(ins);
	}
	public void uptAs(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		String as_cate = Nk.toStr(request.getParameter("as_cate"));
		String as_detail = Nk.toStr(request.getParameter("as_detail"));
		As upt = new As(as_no,as_cate,as_detail);
		dao.insAs(upt);
	}

	public void delComm(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		dao.delComm(as_no);
	}
	
	public void insAns(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		String as_comm = Nk.toStr(request.getParameter("as_comm"));
		dao.insAns(as_no, as_comm);
	}

	public ArrayList<Order> ordList(HttpServletRequest request){
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		return dao.ordList(mem_id);
	}
}
