package funfun.vo;

import java.sql.Date;

public class Faq {
	/*
	(	"FAQ_CODE" NUMBER NOT NULL ENABLE, 
	"FAQ_TITLE" VARCHAR2(100) NOT NULL ENABLE, 
	"FAQ_DETAIL" VARCHAR2(2000) NOT NULL ENABLE, 
	"FAQ_REG_DATE" DATE NOT NULL ENABLE, 
	"FAQ_UPT_DATE" DATE, 
	"ADMIN_CODE" NUMBER NOT NULL ENABLE
	*/
	private int cnt; 			// 페이징 처리 글번호
	private int faq_code;		// 글번호
	private String faq_title; 	// 제목
	private String faq_detail;	// 내용
	private Date faq_reg_date;	// 등록일
	private Date faq_upt_date;	// 수정일
	private int admin_code;		// 작성자
	
	private String faq_category;// 문의카테고리
	private String admin_name;
	
	
	public Faq() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Faq(int cnt, int faq_code, String faq_title, String faq_detail, Date faq_reg_date, Date faq_upt_date,
			int admin_code, String faq_category, String admin_name) {
		super();
		this.cnt = cnt;
		this.faq_code = faq_code;
		this.faq_title = faq_title;
		this.faq_detail = faq_detail;
		this.faq_reg_date = faq_reg_date;
		this.faq_upt_date = faq_upt_date;
		this.admin_code = admin_code;
		this.faq_category = faq_category;
		this.admin_name = admin_name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getFaq_code() {
		return faq_code;
	}
	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_detail() {
		return faq_detail;
	}
	public void setFaq_detail(String faq_detail) {
		this.faq_detail = faq_detail;
	}
	public Date getFaq_reg_date() {
		return faq_reg_date;
	}
	public void setFaq_reg_date(Date faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}
	public Date getFaq_upt_date() {
		return faq_upt_date;
	}
	public void setFaq_upt_date(Date faq_upt_date) {
		this.faq_upt_date = faq_upt_date;
	}
	public int getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(int admin_code) {
		this.admin_code = admin_code;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	
}
