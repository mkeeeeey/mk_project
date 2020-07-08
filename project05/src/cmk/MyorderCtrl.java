package cmk;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import z01_vo.Nk;
import z01_vo.Request;

/**
 * Servlet implementation class MyorderCtrl
 */
@WebServlet(name = "myorder", urlPatterns = { "/myorder" })
public class MyorderCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MyorderService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyorderCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new MyorderService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		// 1. 요청
		String proc = Nk.toStr(request.getParameter("proc"));
		// 2. Model
		request.setAttribute("olist", service.olist(request));
		// 3. View
		String page = "main\\mypage\\myorder.jsp";  
		request.getRequestDispatcher(page).forward(request, response); 
	}

}
