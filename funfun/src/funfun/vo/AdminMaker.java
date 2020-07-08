package funfun.vo;

import java.sql.Date;

public class AdminMaker {
//MAKER_CODE|MEM_CODE|MAKER_PROFILE       
//|MAKER_TYPE|MAKER_NAME |MAKER_EMAIL    |MAKER_CURR|MAKER_BANKBOOK|
	/*
	메이커 구분 - 개인/개인사업자/사업자
	메이커 상태 - DATE
	 */
	
	private int cnt;
	private int maker_code;
	private int mem_code;
	private String maker_profile;
	private String maker_type;
	private String maker_name;
	private String maker_email;
	private Date maker_curr;
	private String maker_bankbook;
	private String maker_opt;
	
	private String pro_title;
	private String mem_name;

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getMaker_code() {
		return maker_code;
	}

	public void setMaker_code(int maker_code) {
		this.maker_code = maker_code;
	}

	public int getMem_code() {
		return mem_code;
	}

	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}

	public String getMaker_profile() {
		return maker_profile;
	}

	public void setMaker_profile(String maker_profile) {
		this.maker_profile = maker_profile;
	}

	public String getMaker_type() {
		return maker_type;
	}

	public void setMaker_type(String maker_type) {
		this.maker_type = maker_type;
	}

	public String getMaker_name() {
		return maker_name;
	}

	public void setMaker_name(String maker_name) {
		this.maker_name = maker_name;
	}

	public String getMaker_email() {
		return maker_email;
	}

	public void setMaker_email(String maker_email) {
		this.maker_email = maker_email;
	}

	public Date getMaker_curr() {
		return maker_curr;
	}

	public void setMaker_curr(Date maker_curr) {
		this.maker_curr = maker_curr;
	}

	public String getMaker_bankbook() {
		return maker_bankbook;
	}

	public void setMaker_bankbook(String maker_bankbook) {
		this.maker_bankbook = maker_bankbook;
	}

	public String getPro_title() {
		return pro_title;
	}

	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMaker_opt() {
		return maker_opt;
	}

	public void setMaker_opt(String maker_opt) {
		this.maker_opt = maker_opt;
	}
	
	
	
}
