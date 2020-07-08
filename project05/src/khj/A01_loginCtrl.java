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
 * Servlet implementation class A01_loginCtrl
 */

@WebServlet(name = "login", urlPatterns = { "/login" })
public class A01_loginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A01_loginService service;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_loginCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new A01_loginService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
// 이부분은 servlet파일 생성시 만들어지는데 무슨 의미인지 모르겠음
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		// 요청
		String proc = Nk.toStr(request.getParameter("proc"), "login");
		System.out.println("proc확인"+proc);
		
		String page ="main/login/login.jsp";
		// 세션 선언
		HttpSession session = request.getSession();
		
		if(proc.equals("login")) {
			Member mem = service.login(request);
			if(mem!=null) {
				session.setAttribute("mem", mem);
			}
		}
		if(proc.equals("logout")) {
			request.getSession().invalidate();
			page="main/main.jsp";
		}
		
		// mem_id에 입력된 값이 있으면 DAO isMember에 해당하는걸 mem_id로 요청?
		if(proc.equals("regCkBtn")) {
			request.setAttribute("isMember", service.checkReg(request));	
		}
			
		
		// 회원테이블에 입력값 저장
		if(proc.equals("regbtn")) {
			service.insMem(request);
			System.out.println("저장확인");
			page="main/login/login.jsp";
		}
		// findBtn에 해당하는 요청 수행 
		// service단 findID에 요청(service단에서 findID에 해당하는 부분을 수행) 
		if(proc.equals("findBtn")) {
			request.setAttribute("fid", service.findID(request));
		}
		// proc가 checkBtn면 findPW에 해당하는 요청 수행
		if(proc.equals("checkBtn")) {
			request.setAttribute("fidpw", service.findPW(request));
		}
		// 메인페이지
		if(proc.equals("main")) {
			page="main/main.jsp";
		}
		// 회원가입
		if(proc.equals("signUp")) {
			page="main/login/signUp.jsp";
		}
		// 아이디 찾기
		if(proc.equals("findID")) {
			page="main/login/findID.jsp";
		}
		// 아이디찾기 결과 페이지
		if(proc.equals("findBtn")) {
			if(service.findID(request)==null) {
				page = "main/login/findID.jsp";
			}else {
				page="main/login/findIdRs.jsp";
			}
		}
		// 비밀번호 찾기
		if(proc.equals("findPS")) {
			page="main/login/findPS.jsp";
		}
		// 비밀번호 찾기 결과
		if(proc.equals("checkBtn")) {
			// 입력한 결과가 맞지 않다면 다시 비밀번호 찾기 페이지로 이동
			if(service.findPW(request)==null) {
				page = "main/login/findPS.jsp";
			// 입력한 정보가 맞으면 결과페이지 이동
			}else {
				page = "main/login/findPsRs.jsp";
			}
		}
		// 아이디 중복 체크
		if(proc.equals("regCkBtn")) {
			page="main/login/signUp.jsp";
		}

		RequestDispatcher rd= request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
