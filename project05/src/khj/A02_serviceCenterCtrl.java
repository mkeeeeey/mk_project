package khj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import z01_vo.Nk;
import z01_vo.Notice;

/**
 * Servlet implementation class A02_serviceCenterCtrl
 */
@WebServlet(name = "SCenter", urlPatterns = {"/SCenter"})
public class A02_serviceCenterCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A02_serviceCenterService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_serviceCenterCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new A02_serviceCenterService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//0. 한글 encoding 처리
		request.setCharacterEncoding("utf-8");
		//1. 요청
		String proc = Nk.toStr(request.getParameter("proc"),"notice");
		System.out.println("proc확인 : "+proc);
		
		//2. Model
		// 공지리스트 불러오기
		if(proc.equals("notice")) {
		request.getSession().setAttribute("nlist", service.Notice(request));
		}
		// 공지 상세불러오기
		if(proc.equals("noticeDetail")) {
			request.setAttribute("notice", service.noticeDetail(request));
		}
		// 공지 등록
		if(proc.equals("insNoti")) {
			service.insertNotice(request);
			request.getSession().setAttribute("nlist", service.Notice(request));
			proc = "notice"; //view의 notice 작동 트리거
		}
		// 공지 수정
		if(proc.equals("uptNoti")) {
			service.updateNotice(request);
			request.setAttribute("notice", service.noticeDetail(request));
			proc = "noticeDetail"; //view의 noticeDetail 작동 트리거
		}
		// 공지 삭제
		if(proc.equals("delNoti")) {
			service.deleteNotice(request);
			request.getSession().setAttribute("nlist", service.Notice(request));
			proc = "notice"; //view의 notice 작동 트리거
		}
		// 문의리스트 불러오기
		if(proc.equals("question")) {
			request.getSession().setAttribute("qlist", service.Question(request));
		}
		// 문의 상세불러오기
		if(proc.equals("queDetail")) {
			request.setAttribute("question", service.questionDetail(request));
			request.setAttribute("qclist", service.Quecomm(request));
		}
		// 문의 등록
		if(proc.equals("insQue")) {
			service.insertQuestion(request);
			request.getSession().setAttribute("qlist", service.Question(request));
			proc = "question"; //view의 question 작동 트리거
		}
		// 문의 수정
		if(proc.equals("uptQue")) {
			service.updateQuestion(request);
			request.setAttribute("question", service.questionDetail(request));
			request.setAttribute("qclist", service.Quecomm(request));
			proc = "queDetail"; //view의 quesDetail 작동 트리거
		}
		// 문의 삭제
		if(proc.equals("delQue")) {
			service.deleteQuestion(request);
			request.getSession().setAttribute("qlist", service.Question(request));
			proc = "question"; //view의 question 작동 트리거
		}
		// 문의댓글 등록
		if(proc.equals("insQuec")) {
			service.insertQuecomm(request);
			request.setAttribute("question", service.questionDetail(request));
			request.setAttribute("qclist", service.Quecomm(request));
			proc = "queDetail"; //view의 question 작동 트리거
		}
		// 문의댓글 수정
		if(proc.equals("uptQuec")) {
			service.updateQuecomm(request);
			request.setAttribute("question", service.questionDetail(request));
			request.setAttribute("qclist", service.Quecomm(request));
			proc = "queDetail"; //view의 quesDetail 작동 트리거
		}
		// 문의댓글 삭제
		if(proc.equals("delQuec")) {
			service.deleteQuecomm(request);
			request.setAttribute("question", service.questionDetail(request));
			request.setAttribute("qclist", service.Quecomm(request));
			proc = "queDetail"; //view의 quesDetail 작동 트리거
		}
		
		// 후기 불러오기
		if(proc.equals("review")) {
			request.getSession().setAttribute("rlist", service.Review(request));
		}
		// 후기 상세불러오기
		if(proc.equals("revDetail")) {
			request.setAttribute("review", service.reviewDetail(request));
			request.setAttribute("rclist", service.Revcomm(request));
		}
		// 후기 등록
		if(proc.equals("insRev")) {
			service.insertReview(request);
			request.getSession().setAttribute("rlist", service.Review(request));
			proc = "review"; //view의 review 작동 트리거
		}
		// 후기 수정
		if(proc.equals("uptRev")) {
			service.updateReview(request);
			request.setAttribute("review", service.reviewDetail(request));
			request.setAttribute("rclist", service.Revcomm(request));
			proc = "revDetail"; //view의 revDetail 작동 트리거
		}
		// 후기 삭제
		if(proc.equals("delRev")) {
			service.deleteReview(request);
			request.getSession().setAttribute("rlist", service.Review(request));
			proc = "review"; //view의 review 작동 트리거
		}
		// 후기댓글 등록
		if(proc.equals("insRevc")) {
			service.insertRevcomm(request);
			request.setAttribute("review", service.reviewDetail(request));
			request.setAttribute("rclist", service.Revcomm(request));
			proc = "revDetail"; //view의 revDetail 작동 트리거
		}
		// 후기댓글 수정
		if(proc.equals("uptRevc")) {
			service.updateRevcomm(request);
			request.setAttribute("review", service.reviewDetail(request));
			request.setAttribute("rclist", service.Revcomm(request));
			proc = "revDetail"; //view의 revDetail 작동 트리거
		}
		// 후기댓글 삭제
		if(proc.equals("delRevc")) {
			service.deleteRevcomm(request);
			request.setAttribute("review", service.reviewDetail(request));
			request.setAttribute("rclist", service.Revcomm(request));
			proc = "revDetail"; //view의 revDetail 작동 트리거
		}		
		
		// AS리스트 불러오기
		if(proc.equals("as")){
			request.setAttribute("asList", service.asList());
		}
		// AS상세 불러오기
		if(proc.equals("goAs")) {
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
		}
		// AS등록창 불러오기
		if(proc.equals("insAs")) {
			request.setAttribute("ordlist",service.ordList(request) );
		}
		// AS등록
		if(proc.equals("ins")) {
			service.insAs(request);
			proc = "insAs";
		}
		
		// AS수정 불러오기
		if(proc.equals("uptAs")) {
			request.setAttribute("ordlist",service.ordList(request) );
			request.setAttribute("as", service.asList(request));
			proc = "insAs";
		}
		
		// AS수정
		if(proc.equals("uptAsBtn")) {
			service.uptAs(request);
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			proc = "goAs";
		}
		// AS삭제
		if(proc.equals("delAs")) {
			// 관리자페이지 연결로 인하여 삭제 불가
		}
		
		// AS댓글 수정
		if(proc.equals("insComm")) {
			service.insComm(request);
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			proc = "goAs";
		}
		
		// AS댓글 삭제
		if(proc.equals("delComm")) {
			service.delComm(request);
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			proc = "goAs";
		}
		
		//3.View
		String page = "main/serviceCenter/notice.jsp";
		if(proc.equals("notice")) {
			page="main/serviceCenter/notice.jsp";
		}
		if(proc.equals("noticeDetail")) {
			page="main/serviceCenter/noticeDetail.jsp";
		}
		if(proc.equals("writeNoti")) {
			page="main/serviceCenter/noticeReg.jsp";
		}
		if(proc.equals("question")) {
			page="main/serviceCenter/question.jsp";
		}
		if(proc.equals("queDetail")) {
			page="main/serviceCenter/questionDetail.jsp";
		}
		if(proc.equals("writeQue")) {
			page="main/serviceCenter/questionReg.jsp";
		}
		if(proc.equals("review")) {
			page="main/serviceCenter/review.jsp";
		}
		if(proc.equals("revDetail")) {
			page="main/serviceCenter/reviewDetail.jsp";
		}
		if(proc.equals("writeRev")) {
			page="main/serviceCenter/reviewReg.jsp";
		}
		if(proc.equals("as")){
			page = "main\\serviceCenter\\as.jsp";
		}
		if(proc.equals("goAs")) {
			page ="main\\serviceCenter\\asdetail.jsp";
		}
		if(proc.equals("insAs")) {
			page ="main\\serviceCenter\\apply.jsp";
		}
		
		RequestDispatcher rd= request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
