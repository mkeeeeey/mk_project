package cmk;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import z01_vo.Cart;
import z01_vo.Nk;

public class MyorderService {
	private MyorderDao dao;

	public MyorderService() {
		super();
		// TODO Auto-generated constructor stub
		dao = new MyorderDao();
	}
	
	public ArrayList<Myorder> olist(HttpServletRequest request){
		String mem_id= Nk.toStr(request.getParameter("mem_id"));
		
		return dao.olist(mem_id);
	}
	

}
