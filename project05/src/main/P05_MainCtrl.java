package main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jhk.ComMarketService;
import z01_vo.Nk;

/**
 * Servlet implementation class P05_MainCtrl
 */
@WebServlet(name = "main", urlPatterns = { "/main" })
public class P05_MainCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ComMarketService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public P05_MainCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new ComMarketService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 한글 encoding
		request.setCharacterEncoding("utf-8");
		// 1. 요청
		String proc= Nk.toStr(request.getParameter("proc"));
		if(proc==null||proc.equals("")) proc="comlist";
		
		String page = "main/main.jsp";
		
		request.setAttribute("clist", service.clist(request));
		
		if(proc.equals("comdetail")) {
			request.setAttribute("comd", service.cominfo(request));
			request.setAttribute("cdlist", service.cdlist(request));
		}
		
		if(proc.equals("comdetail")) {
			page = "main/market/com_detail.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
