package z02_util;

import java.util.ArrayList;

import com.google.gson.Gson;

import hsw.A01_AssemblyDao;
import z01_vo.Member;
import z01_vo.Parts;
import z01_vo.PartsList;

public class GSONexp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Gson gson = new Gson();
		
		// 1. DB데이터를 json형식으로 변환
		//	1) DAO 선언.
		A01_AssemblyDao dao = new A01_AssemblyDao();
		// 	2) ArrayList<VO> list 선언하고, dao.pList() 할당.
		ArrayList<Parts> pList = (ArrayList<Parts>)dao.pList();
		// 	3) toJson 메서드 사용
		String jsonPart = gson.toJson(pList);
		System.out.println(jsonPart);
		// 결과 : [{"parts_no":1,"parts_name":"AMD RYZEN 3 2200G (레이븐 릿지)(정품)","parts_price":121890,"parts_stock":0,"parts_img":"AMD RYZEN 3 2200G (레이븐 릿지)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":2,"parts_name":"AMD RYZEN 3 3200G (피카소)(정품)","parts_price":137280,"parts_stock":0,"parts_img":"AMD RYZEN 3 3200G (피카소)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":3,"parts_name":"AMD RYZEN 5 3500 (마티스)(멀티팩)","parts_price":189350,"parts_stock":0,"parts_img":"AMD RYZEN 5 3500 (마티스)(멀티팩).jpg","parts_com":0,"parts_cnt":0},{"parts_no":4,"parts_name":"AMD RYZEN 5 3500X (마티스)(멀티팩)","parts_price":204090,"parts_stock":0,"parts_img":"AMD RYZEN 5 3500X (마티스)(멀티팩).jpg","parts_com":0,"parts_cnt":0},{"parts_no":5,"parts_name":"AMD RYZEN 5 3600 (마티스)(정품)","parts_price":272830,"parts_stock":0,"parts_img":"AMD RYZEN 5 3600 (마티스)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":6,"parts_name":"AMD RYZEN 7 3700X (마티스)(정품)","parts_price":438420,"parts_stock":0,"parts_img":"AMD RYZEN 7 3700X (마티스)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":7,"parts_name":"AMD RYZEN 9 3900X (마티스)(정품)","parts_price":702790,"parts_stock":0,"parts_img":"AMD RYZEN 9 3900X (마티스)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":8,"parts_name":"인텔 코어i3-9세대 9100F (커피레이크-R)(정품)","parts_price":99170,"parts_stock":0,"parts_img":"인텔 코어i3-9세대 9100F (커피레이크-R)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":9,"parts_name":"인텔 코어i5-9세대 9400F (커피레이크-R)(정품)","parts_price":253800,"parts_stock":0,"parts_img":"인텔 코어i5-9세대 9400F (커피레이크-R)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":10,"parts_name":"인텔 코어i5-9세대 9600KF (커피레이크-R)(정품)","parts_price":265030,"parts_stock":0,"parts_img":"인텔 코어i5-9세대 9600KF (커피레이크-R)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":11,"parts_name":"인텔 코어i7-9세대 9700F (커피레이크-R)(정품)","parts_price":433790,"parts_stock":0,"parts_img":"인텔 코어i7-9세대 9700F (커피레이크-R)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":12,"parts_name":"인텔 코어i7-9세대 9700K (커피레이크-R) (정품)","parts_price":558660,"parts_stock":0,"parts_img":"인텔 코어i7-9세대 9700K (커피레이크-R) (정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":13,"parts_name":"인텔 코어i9-9세대 9900K (커피레이크-R)(정품)","parts_price":720330,"parts_stock":0,"parts_img":"인텔 코어i9-9세대 9900K (커피레이크-R)(정품).jpg","parts_com":0,"parts_cnt":0},{"parts_no":14,"parts_name":"인텔 코어X-시리즈 i9-10900X (캐스케이드레이크)(정품)","parts_price":1340780,"parts_stock":0,"parts_img":"인텔 코어X-시리즈 i9-10900X (캐스케이드레이크)(정품).jpg","parts_com":0,"parts_cnt":0}]

		
		// 2. json형식 데이터를 객체로 저장
		//String jsData3 = "{\"partsList\":[{\"parts_no\":1,\"parts_name\":\"AMD RYZEN 3 2200G (레이븐 릿지)(정품)\",\"parts_price\":121890,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 3 2200G (레이븐 릿지)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":2,\"parts_name\":\"AMD RYZEN 3 3200G (피카소)(정품)\",\"parts_price\":137280,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 3 3200G (피카소)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":3,\"parts_name\":\"AMD RYZEN 5 3500 (마티스)(멀티팩)\",\"parts_price\":189350,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 5 3500 (마티스)(멀티팩).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":4,\"parts_name\":\"AMD RYZEN 5 3500X (마티스)(멀티팩)\",\"parts_price\":204090,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 5 3500X (마티스)(멀티팩).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":5,\"parts_name\":\"AMD RYZEN 5 3600 (마티스)(정품)\",\"parts_price\":272830,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 5 3600 (마티스)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":6,\"parts_name\":\"AMD RYZEN 7 3700X (마티스)(정품)\",\"parts_price\":438420,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 7 3700X (마티스)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":7,\"parts_name\":\"AMD RYZEN 9 3900X (마티스)(정품)\",\"parts_price\":702790,\"parts_stock\":0,\"parts_img\":\"AMD RYZEN 9 3900X (마티스)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":8,\"parts_name\":\"인텔 코어i3-9세대 9100F (커피레이크-R)(정품)\",\"parts_price\":99170,\"parts_stock\":0,\"parts_img\":\"인텔 코어i3-9세대 9100F (커피레이크-R)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":9,\"parts_name\":\"인텔 코어i5-9세대 9400F (커피레이크-R)(정품)\",\"parts_price\":253800,\"parts_stock\":0,\"parts_img\":\"인텔 코어i5-9세대 9400F (커피레이크-R)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":10,\"parts_name\":\"인텔 코어i5-9세대 9600KF (커피레이크-R)(정품)\",\"parts_price\":265030,\"parts_stock\":0,\"parts_img\":\"인텔 코어i5-9세대 9600KF (커피레이크-R)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":11,\"parts_name\":\"인텔 코어i7-9세대 9700F (커피레이크-R)(정품)\",\"parts_price\":433790,\"parts_stock\":0,\"parts_img\":\"인텔 코어i7-9세대 9700F (커피레이크-R)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":12,\"parts_name\":\"인텔 코어i7-9세대 9700K (커피레이크-R) (정품)\",\"parts_price\":558660,\"parts_stock\":0,\"parts_img\":\"인텔 코어i7-9세대 9700K (커피레이크-R) (정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":13,\"parts_name\":\"인텔 코어i9-9세대 9900K (커피레이크-R)(정품)\",\"parts_price\":720330,\"parts_stock\":0,\"parts_img\":\"인텔 코어i9-9세대 9900K (커피레이크-R)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0},{\"parts_no\":14,\"parts_name\":\"인텔 코어X-시리즈 i9-10900X (캐스케이드레이크)(정품)\",\"parts_price\":1340780,\"parts_stock\":0,\"parts_img\":\"인텔 코어X-시리즈 i9-10900X (캐스케이드레이크)(정품).jpg\",\"parts_com\":0,\"parts_cnt\":0}] } ";
		String jsData3 = "{\"partsList\":"+jsonPart +" } ";
		// []안의 내용인 json형식의 데이터는 1. 방법으로 DB에서 추출
		// partsList는 PartsList.java에서 동일 이름으로 
		// private ArrayList<Parts> partsList; 선언하였음
		
		PartsList partsList = gson.fromJson(jsData3, PartsList.class);
		ArrayList<Parts> plist = partsList.getPartsList();
		for(Parts p : plist) {
			System.out.print(p.getParts_no()+"\t");
			System.out.print(p.getParts_name()+"\n");
		}
		
		/*  ## 이거 복사해서 사용하세요. ##
		// dao.pList로 불러낸 결과물 : ArrayList<Parts> plist
		ArrayList<Parts> pList = (ArrayList<Parts>)dao.pList();
		String jsonPart = gson.toJson(pList);
		String jsData3 = "{\"partsList\":"+jsonPart +" } ";
		PartsList partsList = gson.fromJson(jsData3, PartsList.class);
		ArrayList<Parts> plist = partsList.getPartsList();
		*/
		
		
	}

}
