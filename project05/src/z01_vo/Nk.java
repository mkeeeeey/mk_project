package z01_vo;

// Nk.toStr()
// Nk.toInt()
// Nk.toDbl()

public class Nk {
	public static String toStr(String str) {
		return str==null?"":str;
	}
	public static int toInt(String intS) {
		return intS==null||intS.equals("")?0:new Integer(intS);
	}
	public static Long toLong(String longS) {
		return longS==null||longS.equals("")?0:new Long(longS);
	}
	public static Double toDbl(String dblS) {
		return dblS==null||dblS.equals("")?0.0:new Double(dblS);
	}
	
	// 선언된 초기값으로 설정
	public static String toStr(String str, String init) {
		return str==null||str.equals("")?init:str;
	}
	public static int toInt(String intS, int init) {
		return intS==null||intS.equals("")?init:new Integer(intS);
	}
	public static Double toDbl(String dblS, Double init) {
		return dblS==null||dblS.equals("")?init:new Double(dblS);
	}
    public static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }
	
}
