package funfun.vo;

import java.sql.Date;

public class Notice {
	// CNT|NOTI_CODE|NOTI_TITLE    |NOTI_DETAIL   |NOTI_REG_DATE      |NOTI_UPT_DATE|NOTI_CK|ADMIN_CODE
	private int cnt; 		// 페이징 처리 글번호
	private int noti_code;
	private String noti_title;
	private String noti_detail;
	private Date noti_reg_date;
	private Date noti_upt_date;
	private String noti_ck;
	private int admin_code;
	
	private String admin_name;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNoti_code() {
		return noti_code;
	}
	public void setNoti_code(int noti_code) {
		this.noti_code = noti_code;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_detail() {
		return noti_detail;
	}
	public void setNoti_detail(String noti_detail) {
		this.noti_detail = noti_detail;
	}
	public Date getNoti_reg_date() {
		return noti_reg_date;
	}
	public void setNoti_reg_date(Date noti_reg_date) {
		this.noti_reg_date = noti_reg_date;
	}
	public Date getNoti_upt_date() {
		return noti_upt_date;
	}
	public void setNoti_upt_date(Date noti_upt_date) {
		this.noti_upt_date = noti_upt_date;
	}
	public String getNoti_ck() {
		return noti_ck;
	}
	public void setNoti_ck(String noti_ck) {
		this.noti_ck = noti_ck;
	}
	public int getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(int admin_code) {
		this.admin_code = admin_code;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	


}
