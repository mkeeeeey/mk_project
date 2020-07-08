package cmk;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import z01_vo.Cart;
import z01_vo.Member;
import z01_vo.Nk;

/**
 * Servlet implementation class PayCtrl
 */
@WebServlet(name = "order", urlPatterns = { "/order" })
public class PayCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PayService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new PayService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		// 1. 요청
		String proc = Nk.toStr(request.getParameter("proc"));
		HttpSession session = request.getSession();
		// 2. Model
		if(proc.equals("cart") || proc.equals("buy")) {
			if(session.getAttribute("cart") == null){
				ArrayList<Cart> cartlist = new ArrayList<Cart>();
				session.setAttribute("cart", cartlist);
			}
			ArrayList<Cart> cartlist = (ArrayList<Cart>) session.getAttribute("cart");
			
			cartlist.add(service.getProd(request));
			session.setAttribute("cart", cartlist);
			
		}
		if(proc.equals("delBtn")) {
			ArrayList<Cart> cartlist = (ArrayList<Cart>) session.getAttribute("cart");
			String[] cartckS = request.getParameterValues("cartck");
			for(int idx = cartckS.length-1; idx >= 0; idx--) {
				int cartck = Nk.toInt(cartckS[idx]);
				System.out.println("idx:"+idx+"cartck:"+cartck);
				cartlist.remove(cartck);
			}
			
			session.setAttribute("cart", cartlist);
		}
		
		
		
		
		
		if(proc.equals("gopay")) {
			System.out.println("확인:"+proc);
			request.setAttribute("buylist", service.getCart(request));
			request.setAttribute("point", service.getPt(request));
			String mem_id = Nk.toStr(((Member)session.getAttribute("mem")).getMem_id());
			request.setAttribute("addr", service.getAddr(mem_id));
			System.out.println();
		}
		if(proc.equals("pay")) {
			ArrayList<Cart> cartlist = service.getCart(request);
			service.insOrder(request);
			session.removeAttribute("cart");
		}
		// 3. View
		String page = "main\\order\\cart.jsp";
		
		if(proc.equals("gopay")) {
			page = "main\\order\\pay.jsp";
		}
		if(proc.equals("pay")) {
			page = "main\\order\\payend.jsp";
		}
		if(session.getAttribute("mem") == null) {
			page = "login";
		}
		
		request.getRequestDispatcher(page).forward(request, response); 
	}

}
