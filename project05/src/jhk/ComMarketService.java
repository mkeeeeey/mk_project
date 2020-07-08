package jhk;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import z01_vo.Computer;
import z01_vo.Nk;

public class ComMarketService {
	private ComMarketDao dao;
	
	public ComMarketService() {
		dao = new ComMarketDao();
	}
	
	public ArrayList<Computer> clist(HttpServletRequest request){
		String category = Nk.toStr(request.getParameter("category"));
		if(category==null||category.equals("")) category="all";
		return dao.getComList(category);
	}
	
	public ArrayList<Comdetail> cdlist(HttpServletRequest request){
		int com_no = Nk.toInt(request.getParameter("com_no"));
		return dao.getComDetailList(com_no);
	}
	
	public Computer cominfo(HttpServletRequest request) {
		int com_no = Nk.toInt(request.getParameter("com_no"));
		return dao.getComDetail(com_no);
	}
}
