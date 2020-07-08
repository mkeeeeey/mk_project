package z01_vo;

import java.util.Date;

public class Question {
	private int que_no;
	private String mem_id;
	private String que_name;
	private String que_detail;
	private Date que_date;
	
	public Question() {
		super();
	}
	public Question(int que_no, String mem_id, String que_name, String que_detail, Date que_date) {
		super();
		this.que_no = que_no;
		this.mem_id = mem_id;
		this.que_name = que_name;
		this.que_detail = que_detail;
		this.que_date = que_date;
	}

	public Question(String mem_id, String que_name, String que_detail) {
		this.mem_id = mem_id;
		this.que_name = que_name;
		this.que_detail = que_detail;
	}

	public Question(int que_no, String mem_id, String que_name, String que_detail) {
		super();
		this.que_no = que_no;
		this.mem_id = mem_id;
		this.que_name = que_name;
		this.que_detail = que_detail;
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

	public String getQue_name() {
		return que_name;
	}

	public void setQue_name(String que_name) {
		this.que_name = que_name;
	}

	public String getQue_detail() {
		return que_detail;
	}

	public void setQue_detail(String que_detail) {
		this.que_detail = que_detail;
	}

	public Date getQue_date() {
		return que_date;
	}

	public void setQue_date(Date que_date) {
		this.que_date = que_date;
	}

}
