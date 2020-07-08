package funfun.vo;

import java.sql.Date;

public class AdminMember {
	// 회원번호, 회원이메일, 회원이름, 회원휴대폰번호,
	// 회원관심카테고리, 회원 프로필 이미지, 회원상태(제제여부),
	// 회원계좌은행, 회원 계좌번호, 회원 보유 예치금
	// 메이커유무, 펀딩기록, 구매기록
	
	private int cnt;
	private int mem_code;
	private String mem_email;
	private String mem_pw;
	private String mem_name;
	private String mem_phoneno;
	private String mem_favor;
	private String mem_profile;
	private Date mem_curr;
	private String mem_bank;
	private String mem_account;
	private int mem_balance;
	
	
	private int maker_code;
	private String mem_opt;
	

	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getMem_code() {
		return mem_code;
	}


	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}


	public String getMem_email() {
		return mem_email;
	}


	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public String getMem_phoneno() {
		return mem_phoneno;
	}


	public void setMem_phoneno(String mem_phoneno) {
		this.mem_phoneno = mem_phoneno;
	}


	public String getMem_favor() {
		return mem_favor;
	}


	public void setMem_favor(String mem_favor) {
		this.mem_favor = mem_favor;
	}


	public String getMem_profile() {
		return mem_profile;
	}


	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}


	public Date getMem_curr() {
		return mem_curr;
	}


	public void setMem_curr(Date mem_curr) {
		this.mem_curr = mem_curr;
	}


	public String getMem_bank() {
		return mem_bank;
	}


	public void setMem_bank(String mem_bank) {
		this.mem_bank = mem_bank;
	}


	public String getMem_account() {
		return mem_account;
	}


	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}


	public int getMem_balance() {
		return mem_balance;
	}


	public void setMem_balance(int mem_balance) {
		this.mem_balance = mem_balance;
	}


	public int getMaker_code() {
		return maker_code;
	}


	public void setMaker_code(int maker_code) {
		this.maker_code = maker_code;
	}


	public String getMem_opt() {
		return mem_opt;
	}


	public void setMem_opt(String mem_opt) {
		this.mem_opt = mem_opt;
	}
	
	
	
}
