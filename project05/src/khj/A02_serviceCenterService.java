package khj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import z01_vo.*;
import z01_vo.Nk;

public class A02_serviceCenterService {
	private A02_serviceCenterDao dao;
	public A02_serviceCenterService() {
		super();
		dao = new A02_serviceCenterDao();
	}
	
	// 공지리스트 불러오기
	public ArrayList<Notice> Notice(HttpServletRequest request) {
		return dao.nlist();
	}
	
	public Notice noticeDetail(HttpServletRequest request) {
		int noti_no = Nk.toInt(request.getParameter("noti_no"));
		
		return dao.ndetail(noti_no);
	}

	public void insertNotice(HttpServletRequest request) {
		String noti_name = Nk.toStr(request.getParameter("noti_name"));
		String noti_detail = Nk.toStr(request.getParameter("noti_detail"));
		
		Notice noti = new Notice(noti_name, noti_detail);
		dao.insertNotice(noti);
	}
	
	public void updateNotice(HttpServletRequest request) {
		int noti_no = Nk.toInt(request.getParameter("noti_no"));
		String noti_name = Nk.toStr(request.getParameter("noti_name"));
		String noti_detail = Nk.toStr(request.getParameter("noti_detail"));
		
		Notice noti = new Notice(noti_no, noti_name, noti_detail);
		dao.updateNotice(noti);
	}

	public void deleteNotice(HttpServletRequest request) {
		int noti_no = Nk.toInt(request.getParameter("noti_no"));
		
		dao.deleteNotice(noti_no);
	}
	
	public ArrayList<Question> Question(HttpServletRequest request) {
		return dao.qlist();
	}

	public Question questionDetail(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		return dao.qdetail(que_no);
	}

	public ArrayList<Quecomm> Quecomm(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		return dao.qclist(que_no);
	}
	
	public void insertQuestion(HttpServletRequest request) {
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String que_name = Nk.toStr(request.getParameter("que_name"));
		String que_detail = Nk.toStr(request.getParameter("que_detail"));
		
		Question que = new Question(mem_id, que_name, que_detail);
		dao.insertQuestion(que);
	}
	
	public void updateQuestion(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String que_name = Nk.toStr(request.getParameter("que_name"));
		String que_detail = Nk.toStr(request.getParameter("que_detail"));
		
		Question que = new Question(que_no, mem_id, que_name, que_detail);
		dao.updateQuestion(que);
	}
	
	public void deleteQuestion(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		
		dao.deleteQuecommAll(que_no);
		dao.deleteQuestion(que_no);
	}

	public void insertQuecomm(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String quec_detail = Nk.toStr(request.getParameter("quec_detail"));
		
		Quecomm quec = new Quecomm(que_no, mem_id, quec_detail);
		dao.insertQuecomm(quec);
	}
	public void updateQuecomm(HttpServletRequest request) {
		int quec_no = Nk.toInt(request.getParameter("quec_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String quec_detail = Nk.toStr(request.getParameter("quec_detail"));

		System.out.println("문의댓글번호:"+quec_no);
		System.out.println("아이디:"+mem_id);
		System.out.println("내용:"+quec_detail);
		
		Quecomm quec = new Quecomm(quec_no, quec_detail);
		dao.updateQuecomm(quec);
	}
	
	public void deleteQuecomm(HttpServletRequest request) {
		int quec_no = Nk.toInt(request.getParameter("quec_no"));
		
		dao.deleteQuecomm(quec_no);
	}
	
	public ArrayList<Review> Review(HttpServletRequest request) {
		return dao.rlist();
	}

	public Review reviewDetail(HttpServletRequest request) {
		int rev_no = Nk.toInt(request.getParameter("rev_no"));
		return dao.rdetail(rev_no);
	}

	public ArrayList<Revcomm> Revcomm(HttpServletRequest request) {
		int rev_no = Nk.toInt(request.getParameter("rev_no"));
		return dao.rclist(rev_no);
	}
	
	public void insertReview(HttpServletRequest request) {
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String rev_name = Nk.toStr(request.getParameter("rev_name"));
		String rev_detail = Nk.toStr(request.getParameter("rev_detail"));
		
		Review rev = new Review(mem_id, rev_name, rev_detail);
		dao.insertReview(rev);
	}
	
	public void updateReview(HttpServletRequest request) {
		int rev_no = Nk.toInt(request.getParameter("rev_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String rev_name = Nk.toStr(request.getParameter("rev_name"));
		String rev_detail = Nk.toStr(request.getParameter("rev_detail"));
		
		Review rev = new Review(rev_no, mem_id, rev_name, rev_detail);
		dao.updateReview(rev);
	}
	
	public void deleteReview(HttpServletRequest request) {
		int rev_no = Nk.toInt(request.getParameter("rev_no"));
		
		dao.deleteRevcommAll(rev_no);
		dao.deleteReview(rev_no);
	}

	public void insertRevcomm(HttpServletRequest request) {
		int rev_no = Nk.toInt(request.getParameter("rev_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String revc_detail = Nk.toStr(request.getParameter("revc_detail"));
		
		Revcomm revc = new Revcomm(rev_no, mem_id, revc_detail);
		dao.insertRevcomm(revc);
	}
	public void updateRevcomm(HttpServletRequest request) {
		int revc_no = Nk.toInt(request.getParameter("revc_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String revc_detail = Nk.toStr(request.getParameter("revc_detail"));
		
		Revcomm revc = new Revcomm(revc_no, revc_detail);
		dao.updateRevcomm(revc);
	}
	
	public void deleteRevcomm(HttpServletRequest request) {
		int revc_no = Nk.toInt(request.getParameter("revc_no"));
		
		dao.deleteRevcomm(revc_no);
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
		As ins = new As(as_cate,as_detail,ord_no);
		dao.insAs(ins);
	}

	public void uptAs(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		String as_cate = Nk.toStr(request.getParameter("as_cate"));
		String as_detail = Nk.toStr(request.getParameter("as_detail"));
		System.out.println("서비스단:"+as_no+":"+as_cate+":"+as_detail);
		As upt = new As(as_no,as_cate,as_detail);
		dao.uptAs(upt);
	}

	public void delComm(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		dao.delComm(as_no);
	}

	public void insComm(HttpServletRequest request) {
		int as_no = Nk.toInt(request.getParameter("as_no"));
		String as_comm = Nk.toStr(request.getParameter("as_comm"));
		dao.insComm(as_no, as_comm);
	}

	public ArrayList<Order> ordList(HttpServletRequest request){
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		return dao.ordList(mem_id);
	}
}		

