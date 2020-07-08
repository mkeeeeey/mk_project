package z01_vo;

import java.util.Date;

public class Notice {
	private int noti_no;
	private String noti_name;
	private String noti_detail;
	private Date noti_date;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(String noti_name, String noti_detail) {
		super();
		this.noti_name = noti_name;
		this.noti_detail = noti_detail;
	}
	
	public Notice(int noti_no, String noti_name, String noti_detail) {
		super();
		this.noti_no = noti_no;
		this.noti_name = noti_name;
		this.noti_detail = noti_detail;
	}
	
	public Notice(int noti_no, String noti_name, Date noti_date) {
		super();
		this.noti_no = noti_no;
		this.noti_name = noti_name;
		this.noti_date = noti_date;
	}

	public Notice(int noti_no, String noti_name, String noti_detail, Date noti_date) {
		super();
		this.noti_no = noti_no;
		this.noti_name = noti_name;
		this.noti_detail = noti_detail;
		this.noti_date = noti_date;
	}

	public int getNoti_no() {
		return noti_no;
	}

	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}

	public String getNoti_name() {
		return noti_name;
	}

	public void setNoti_name(String noti_name) {
		this.noti_name = noti_name;
	}

	public String getNoti_detail() {
		return noti_detail;
	}

	public void setNoti_detail(String noti_detail) {
		this.noti_detail = noti_detail;
	}

	public Date getNoti_date() {
		return noti_date;
	}

	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	
	
}
