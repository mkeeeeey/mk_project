package funfun.vo;

public class Withdrawl {
	private String wiDate;
	private int minusBal;
	private String wiCurr;
	private String memEmail;
	private int cnt; // 페이징 처리 글번호
	private int no;	// 글번호

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWiDate() {
		return wiDate;
	}
	public void setWiDate(String wiDate) {
		this.wiDate = wiDate;
	}

	public int getMinusBal() {
		return minusBal;
	}
	public void setMinusBal(int minusBal) {
		this.minusBal = minusBal;
	}
	public String getWiCurr() {
		return wiCurr;
	}
	public void setWiCurr(String wiCurr) {
		this.wiCurr = wiCurr;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	

}
