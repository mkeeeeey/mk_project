package hsw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Page
 */
@WebServlet("/Page")
public class Page extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A01_AssemblyService service; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page() {
        super();
        // TODO Auto-generated constructor stub
        service = new A01_AssemblyService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("plist", service.plist(request));
		// 3. view
		String page = "main\\estimate\\estimate2.jsp";
		
		RequestDispatcher rd= request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
