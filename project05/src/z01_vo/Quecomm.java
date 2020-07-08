package z01_vo;

import java.util.Date;

public class Quecomm {
	private int quec_no;
	private int que_no;
	private String mem_id;
	private String quec_detail;
	private Date quec_date;
	
	public Quecomm() {
		super();
	}
	
	public Quecomm(int que_no, String mem_id, String quec_detail) {
		super();
		this.que_no = que_no;
		this.mem_id = mem_id;
		this.quec_detail = quec_detail;
	}
	
	public Quecomm(int quec_no, String quec_detail) {
		super();
		this.quec_no = quec_no;
		this.quec_detail = quec_detail;
	}
	
	public Quecomm(int quec_no, int que_no, String mem_id, String quec_detail, Date quec_date) {
		super();
		this.quec_no = quec_no;
		this.que_no = que_no;
		this.mem_id = mem_id;
		this.quec_detail = quec_detail;
		this.quec_date = quec_date;
	}

	public int getQuec_no() {
		return quec_no;
	}

	public void setQuec_no(int quec_no) {
		this.quec_no = quec_no;
	}

	public int getQue_no() {
		return que_no;
	}

	public void setQue_no(int que_no) {
		this.que_no = que_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getQuec_detail() {
		return quec_detail;
	}

	public void setQuec_detail(String quec_detail) {
		this.quec_detail = quec_detail;
	}

	public Date getQuec_date() {
		return quec_date;
	}

	public void setQuec_date(Date quec_date) {
		this.quec_date = quec_date;
	}
	
}
