package z01_vo;

import java.util.Date;

public class Revcomm {
	private int revc_no;
	private int rev_no;
	private String mem_id;
	private String revc_detail;
	private Date revc_date;
	
	public Revcomm() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Revcomm(int rev_no, String mem_id, String revc_detail) {
		super();
		this.rev_no = rev_no;
		this.mem_id = mem_id;
		this.revc_detail = revc_detail;
	}

	public Revcomm(int revc_no, String revc_detail) {
		super();
		this.revc_no = revc_no;
		this.revc_detail = revc_detail;
	}

	public Revcomm(int revc_no, int rev_no, String mem_id, String revc_detail, Date revc_date) {
		super();
		this.revc_no = revc_no;
		this.rev_no = rev_no;
		this.mem_id = mem_id;
		this.revc_detail = revc_detail;
		this.revc_date = revc_date;
	}

	public int getRevc_no() {
		return revc_no;
	}

	public void setRevc_no(int revc_no) {
		this.revc_no = revc_no;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getRevc_detail() {
		return revc_detail;
	}

	public void setRevc_detail(String revc_detail) {
		this.revc_detail = revc_detail;
	}

	public Date getRevc_date() {
		return revc_date;
	}

	public void setRevc_date(Date revc_date) {
		this.revc_date = revc_date;
	}

}
