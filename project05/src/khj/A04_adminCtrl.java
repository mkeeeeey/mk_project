package khj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import z01_vo.Nk;

/**
 * Servlet implementation class A04_adminCtrl
 */
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class A04_adminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A04_adminService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_adminCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new A04_adminService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("proc"));
		String proc= Nk.toStr(request.getParameter("proc"),"member");
		System.out.println("proc확인"+proc);
			
		String page= "main/admin/memList.jsp";
		//2.모델처리
		// 회원 정보 불러오기
		if(proc.equals("member")) {
			request.getSession().setAttribute("mlist", service.Member(request));
		}
		// 회원 상세
		if(proc.equals("memberDetail")) {
			request.setAttribute("member", service.memberDetail(request));
		}
		//회원 삭제
		if(proc.equals("delMem")) {
			service.deleteMember(request);
			request.getSession().setAttribute("mlist", service.Member(request));
			proc = "member"; 
		}
		
		if(proc.equals("mcomlist")) {
			request.setAttribute("clist", service.clist(request));
			request.setAttribute("cdlist", service.cdlist(request));
		}
		if(proc.equals("mcomdetail")) {
			request.setAttribute("comd", service.cominfo(request));
			request.setAttribute("cdlist", service.cdlist(request));
		}
		if(proc.equals("mpartslist")) {
			request.setAttribute("plist", service.plist(request));
		}
		if(proc.equals("mpartsdetail")) {
			request.setAttribute("partsd", service.partsinfo(request));
		}
		if(proc.equals("mgr")) {
			request.setAttribute("mgrList",service.mgrList());
		}
		if(proc.equals("mgrDetail")) {
			request.setAttribute("mgr", service.mgrDetail(request));
			request.setAttribute("ordlist", service.reqList(request));
		}
		if(proc.equals("uptmgrDetail")) {
			service.uptMgr(request);
		}
		//3. 페이지 이동
		// 회원 리스트
		if(proc.equals("member")) {
			page = "main/admin/memList.jsp";
		}
		//회원 상세 이동
		if(proc.equals("memberDetail")) {
			page="main/admin/memDetail.jsp";
		}
		
		if(proc.equals("mcomlist")) {
			page = "main/admin/marketcomList.jsp";
		}
		if(proc.equals("mcomdetail")) {
			page = "main/admin/marketcomDetail.jsp";
		}
		if(proc.equals("mpartslist")) {
			page = "main/admin/marketpartsList.jsp";
		}
		if(proc.equals("mpartsdetail")) {
			page = "main/admin/marketpartsDetail.jsp";
		}
		
		if(proc.equals("mgr")) {
			page = "main/admin/asAdmin.jsp";
		}
		if(proc.equals("mgrDetail")) {
			page = "main/admin/asdetailAdmin.jsp";
		}
		if(proc.equals("uptmgrDetail")) {
			page = "main/admin/asdetailAdmin.jsp";
		}
		if(proc.equals("order")) {
			request.setAttribute("getorders", service.getOrders(request));
			request.setAttribute("orderslist", service.OrdersList(request));
			
			page = "\\main\\admin\\orderAdmin.jsp";
		}
		if(proc.equals("orderdetail")) {
			request.setAttribute("getord", service.getord(request));
			
			page = "\\main\\admin\\orderdetailAdmin.jsp";
		}
		if(proc.equals("uptord")) {
			service.uptOrd(request);
			page = "\\main\\admin\\orderdetailAdmin.jsp";
		}


		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
