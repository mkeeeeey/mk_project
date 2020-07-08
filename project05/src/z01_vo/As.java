package z01_vo;

import java.util.Date;

public class As {
	private int as_no;
	private int ord_no;
	private String as_cate; //AS, 교환, 반품
	private String as_detail;
	private Date as_date;
	
	private String mem_id;
	
	private String as_comm;
	private Date as_comdate;
	
	private String parts_img;
	private String parts_name;
	private int req_cnt;
	private int parts_price;
	private Date ord_date;
	
//as_cate, mem_id, as_date, pr.ord_no, a.parts_img, a.parts_name, pr.req_cnt, a.parts_price, c.ord_date, as_detail, as_comm, as_comdate
	public As() {
		super();
		// TODO Auto-generated constructor stub
	}

	public As(int as_no, int ord_no, String as_cate, String as_detail, Date as_date) {
		super();
		this.as_no = as_no;
		this.ord_no = ord_no;
		this.as_cate = as_cate;
		this.as_detail = as_detail;
		this.as_date = as_date;
	}
	
	
	
	public As(int as_no, String as_cate, String as_detail) {
		super();
		this.as_no = as_no;
		this.as_cate = as_cate;
		this.as_detail = as_detail;
	}
	
	public As(String as_cate, String as_detail, int ord_no) {
		super();
		this.ord_no = ord_no;
		this.as_cate = as_cate;
		this.as_detail = as_detail;
	}

	public As(int as_no, String as_cate, Date as_date, String mem_id) {
		super();
		this.as_no = as_no;
		this.as_cate = as_cate;
		this.as_date = as_date;
		this.mem_id = mem_id;
	}
	

	public As(int as_no, String as_cate, String as_detail, Date as_date, String mem_id, String as_comm,
			Date as_comdate) {
		super();
		this.as_no = as_no;
		this.as_cate = as_cate;
		this.as_detail = as_detail;
		this.as_date = as_date;
		this.mem_id = mem_id;
		this.as_comm = as_comm;
		this.as_comdate = as_comdate;
	}
	
	public As(int as_no, int ord_no, String as_cate, String as_detail, Date as_date, String mem_id, String as_comm,
			Date as_comdate) {
		super();
		this.as_no = as_no;
		this.ord_no = ord_no;
		this.as_cate = as_cate;
		this.as_detail = as_detail;
		this.as_date = as_date;
		this.mem_id = mem_id;
		this.as_comm = as_comm;
		this.as_comdate = as_comdate;
	}

	public As(int ord_no, String as_cate, String as_detail, Date as_date, String mem_id, String as_comm,
			Date as_comdate, String parts_img, String parts_name, int req_cnt, int parts_price, Date ord_date) {
		super();
		this.ord_no = ord_no;
		this.as_cate = as_cate;
		this.as_detail = as_detail;
		this.as_date = as_date;
		this.mem_id = mem_id;
		this.as_comm = as_comm;
		this.as_comdate = as_comdate;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
		this.parts_price = parts_price;
		this.ord_date = ord_date;
	}

	public int getAs_no() {
		return as_no;
	}

	public void setAs_no(int as_no) {
		this.as_no = as_no;
	}

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}

	public String getAs_cate() {
		return as_cate;
	}

	public void setAs_cate(String as_cate) {
		this.as_cate = as_cate;
	}

	public String getAs_detail() {
		return as_detail;
	}

	public void setAs_detail(String as_detail) {
		this.as_detail = as_detail;
	}

	public Date getAs_date() {
		return as_date;
	}

	public void setAs_date(Date as_date) {
		this.as_date = as_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getAs_comm() {
		return as_comm;
	}

	public void setAs_comm(String as_comm) {
		this.as_comm = as_comm;
	}

	public Date getAs_comdate() {
		return as_comdate;
	}

	public void setAs_comdate(Date as_comdate) {
		this.as_comdate = as_comdate;
	}

	public String getParts_img() {
		return parts_img;
	}

	public void setParts_img(String parts_img) {
		this.parts_img = parts_img;
	}

	public String getParts_name() {
		return parts_name;
	}

	public void setParts_name(String parts_name) {
		this.parts_name = parts_name;
	}

	public int getReq_cnt() {
		return req_cnt;
	}

	public void setReq_cnt(int req_cnt) {
		this.req_cnt = req_cnt;
	}

	public int getParts_price() {
		return parts_price;
	}

	public void setParts_price(int parts_price) {
		this.parts_price = parts_price;
	}

	public Date getOrd_date() {
		return ord_date;
	}

	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	
	
}
