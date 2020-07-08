package hsw;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import z01_vo.Nk;
import z01_vo.Parts;

/**
 * Servlet implementation class A01_Assembly
 */
@WebServlet(name = "assembly3", urlPatterns = { "/assembly3" })
public class A01_plist extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private A01_AssemblyService service; 
    private A01_AssemblyDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_plist() {
        super();
        // TODO Auto-generated constructor stub
        service = new A01_AssemblyService();
        dao = new A01_AssemblyDao();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 0. 한글 encoding
		request.setCharacterEncoding("utf-8");
		// 1. 요청
		String proc = Nk.toStr(request.getParameter("proc"),"first");
		HttpSession session = request.getSession();
		A01_AssemblyDao dao = new A01_AssemblyDao();
		// 2. 모델
		// proc first => 초기화면 , 카트 새로만들기
		if(proc.equals("first")) {
			request.setAttribute("plist", service.plist() );
		}
		
		
		// 3. view
		String page = "main\\estimate\\NewFile1.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
