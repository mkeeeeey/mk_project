package khj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import z01_vo.Member;
import z01_vo.Nk;

/**
 * Servlet implementation class A03_myPageCtrl
 */
@WebServlet(name ="MyPage" , urlPatterns = {"/MyPage"})
public class A03_myPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A03_myPageService service;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_myPageCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new A03_myPageService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String proc = Nk.toStr(request.getParameter("proc"));
		System.out.println("proc확인"+proc);
		
		
		HttpSession session = request.getSession();
		Member mem = (Member)session.getAttribute("mem");
		String mem_id = Nk.toStr(mem.getMem_id());
		int ord_no = Nk.toInt(request.getParameter("ord_no"));
		
		if(proc.equals("mypt")) {
			request.setAttribute("ptList", service.ptList(mem_id));
		}
		if(proc.equals("myorder")) {
			request.setAttribute("getolist", service.getolist(mem_id));
			request.setAttribute("olist", service.olist(mem_id));
		}
		if(proc.equals("modetail")) {
			request.setAttribute("myolist", service.myolist(mem_id, request));
		}
		
		
		String page ="main/mypage/userInfo.jsp";
		
		if(proc.equals("update")) {
			// 수정처리 서비스
			service.uptPw(request);
		}		
		if(proc.equals("delete")) {
			// 삭제처리 서비스.
			service.deleteMember(request);			
			request.getSession().invalidate();
			page = "main/main.jsp";
		}
		// 회원정보수정 페이지 -> 회원탈퇴
		if(proc.equals("dropInfo")) {
			page = "main/mypage/dropInfo.jsp";
		}
		
		// 수정 처리 후, 수정된 상세화면 확인으로 model 처리..
		if(proc.equals("userInfo")||proc.equals("update")) {
			// emp Model
			request.setAttribute("emp", service.userInfo( request ));
			
		}
		
		if(proc.equals("mypt")) {
			page = "main\\mypage\\mypoint.jsp";
		}
		if(proc.equals("myorder")) {
			page = "main\\mypage\\myorder.jsp";
		}
		if(proc.equals("modetail")) {
			page = "main\\mypage\\orderdetail.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
