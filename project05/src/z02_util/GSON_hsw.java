package z02_util;

import java.util.ArrayList;

import com.google.gson.Gson;

import hsw.A01_AssemblyDao;
import z01_vo.Parts;
import z01_vo.PartsList;

public class GSON_hsw {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Gson gson = new Gson();
		A01_AssemblyDao dao = new A01_AssemblyDao();
		
		
		// dao.pList로 불러낸 결과물 : ArrayList<Parts> plist
		ArrayList<Parts> pList = (ArrayList<Parts>)dao.pList();
		String jsonPart = gson.toJson(pList);
		String jsData3 = "{\"partsList\":"+jsonPart +" } ";
		PartsList partsList = gson.fromJson(jsData3, PartsList.class);
		ArrayList<Parts> plist = partsList.getPartsList();
		for(Parts p : plist) {
			System.out.print(p.getParts_no()+"\t");
			System.out.print(p.getParts_name()+"\n");
		}
		
		
		
		
	}

}
