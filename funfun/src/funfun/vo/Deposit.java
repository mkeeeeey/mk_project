package funfun.vo;

public class Deposit {
	private String rddate;
	private int chargeQueryAmount;
	private String curr;
	private String memEmail;
	
	public int getChargeQueryAmount() {
		return chargeQueryAmount;
	}
	public void setChargeQueryAmount(int chargeQueryAmount) {
		this.chargeQueryAmount = chargeQueryAmount;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getRddate() {
		return rddate;
	}
	public void setRddate(String rddate) {
		this.rddate = rddate;
	}
	public String getCurr() {
		return curr;
	}
	public void setCurr(String curr) {
		this.curr = curr;
	}
}
