package cmk;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import z01_vo.Nk;

/**
 * Servlet implementation class AsCtrl
 */
@WebServlet(name = "as", urlPatterns = { "/as" })
public class AsCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AsService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new AsService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// 1. 요청
		String proc = Nk.toStr(request.getParameter("proc"),"as");
		System.out.println("proc: "+proc);
		// 2. Model
		
		// 3. View
		String page = "main\\serviceCenter\\as.jsp";
		// 공자사항 이동
		if(proc.equals("notice")) {
			page = "notice";
		}
		// as목록 불러오기
		if(proc.equals("as")){
			request.setAttribute("asList", service.asList());
			page = "main\\serviceCenter\\as.jsp";
		}
		// as 상세보기
		if(proc.equals("goAs")) {
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			page ="main\\serviceCenter\\asdetail.jsp";
		}
		
		// as 삭제
		if(proc.equals("delAs")) {
			service.delAs(request);
			
			page ="main\\serviceCenter\\asdetail.jsp";
		}
		// as 등록 이동
		if(proc.equals("insAs")) {
			// 회원의 주문번호 전달
			request.setAttribute("ordlist",service.ordList(request) );
			
			page ="main\\serviceCenter\\apply.jsp";
		}
		// as 등록 
		if(proc.equals("ins")) {
			service.insAs(request);
			
			page ="main\\serviceCenter\\apply.jsp";
		}
		
		// as 수정
		if(proc.equals("uptAs")) {
			service.uptAs(request);
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			page ="main\\serviceCenter\\asdetail.jsp";
		}
		
		// as comm 삭제
		if(proc.equals("delComm")) {
			service.delComm(request);
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			page ="main\\serviceCenter\\asdetail.jsp";
		}
		// as comm 등록
		if(proc.equals("insAns")) {
			
			service.insAns(request);
			request.setAttribute("as", service.asList(request));
			request.setAttribute("asdetail", service.asDetail(request));
			page ="main\\serviceCenter\\asdetail.jsp";
						
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
