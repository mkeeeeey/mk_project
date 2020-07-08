package z01_vo;

import java.util.Date;

public class Review {
	private int rev_no;
	private String mem_id;
	private String rev_name;
	private String rev_detail;
	private Date rev_date;
	
	public Review() {
		super();
	}
	
	public Review(String mem_id, String rev_name, String rev_detail) {
		super();
		this.mem_id = mem_id;
		this.rev_name = rev_name;
		this.rev_detail = rev_detail;
	}

	public Review(int rev_no, String mem_id, String rev_name, String rev_detail) {
		super();
		this.rev_no = rev_no;
		this.mem_id = mem_id;
		this.rev_name = rev_name;
		this.rev_detail = rev_detail;
	}

	public Review(int rev_no, String mem_id, String rev_name, String rev_detail, Date rev_date) {
		super();
		this.rev_no = rev_no;
		this.mem_id = mem_id;
		this.rev_name = rev_name;
		this.rev_detail = rev_detail;
		this.rev_date = rev_date;
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

	public String getRev_name() {
		return rev_name;
	}

	public void setRev_name(String rev_name) {
		this.rev_name = rev_name;
	}

	public String getRev_detail() {
		return rev_detail;
	}

	public void setRev_detail(String rev_detail) {
		this.rev_detail = rev_detail;
	}

	public Date getRev_date() {
		return rev_date;
	}

	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}

}
