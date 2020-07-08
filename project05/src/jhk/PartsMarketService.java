package jhk;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import z01_vo.Nk;
import z01_vo.Parts;

public class PartsMarketService {
	private PartsMarketDao dao;
	
	public PartsMarketService() {
		dao = new PartsMarketDao();
	}
	
	public ArrayList<Parts> plist(HttpServletRequest request){
		String category = Nk.toStr(request.getParameter("category"));
		if(category==null||category.equals("")) category="all";
		return dao.getPartsList(category);
	}
	public Parts partsinfo(HttpServletRequest request) {
		int com_no = Nk.toInt(request.getParameter("parts_no"));
		return dao.getPartsDetail(com_no);
	}
}
