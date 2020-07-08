package z01_vo;

import java.util.Date;

public class Order {
	private int ord_no;
	private String mem_id;
	private Date ord_date;
	private String ord_name;
	private String ord_tel;
	private String ord_post;
	private String ord_addr1;
	private String ord_addr2;
	private String ord_req;
	private String ord_stat;
	private int ord_invoice;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Order(int ord_no) {
		super();
		this.ord_no = ord_no;
	}
	
	

	public Order(String ord_name, String ord_tel, String ord_post, String ord_addr1, String ord_addr2) {
		super();
		this.ord_name = ord_name;
		this.ord_tel = ord_tel;
		this.ord_post = ord_post;
		this.ord_addr1 = ord_addr1;
		this.ord_addr2 = ord_addr2;
	}


	public Order(String mem_id, String ord_name, String ord_tel, String ord_post, String ord_addr1, String ord_addr2,
			String ord_req) {
		super();
		this.mem_id = mem_id;
		this.ord_name = ord_name;
		this.ord_tel = ord_tel;
		this.ord_post = ord_post;
		this.ord_addr1 = ord_addr1;
		this.ord_addr2 = ord_addr2;
		this.ord_req = ord_req;
	}


	public Order(int ord_no, String mem_id, Date ord_date, String ord_name, String ord_tel, String ord_post,
			String ord_addr1, String ord_addr2, String ord_req, String ord_stat, int ord_invoice) {
		super();
		this.ord_no = ord_no;
		this.mem_id = mem_id;
		this.ord_date = ord_date;
		this.ord_name = ord_name;
		this.ord_tel = ord_tel;
		this.ord_post = ord_post;
		this.ord_addr1 = ord_addr1;
		this.ord_addr2 = ord_addr2;
		this.ord_req = ord_req;
		this.ord_stat = ord_stat;
		this.ord_invoice = ord_invoice;
	}

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getOrd_date() {
		return ord_date;
	}

	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}

	public String getOrd_name() {
		return ord_name;
	}

	public void setOrd_name(String ord_name) {
		this.ord_name = ord_name;
	}

	public String getOrd_tel() {
		return ord_tel;
	}

	public void setOrd_tel(String ord_tel) {
		this.ord_tel = ord_tel;
	}

	public String getOrd_post() {
		return ord_post;
	}

	public void setOrd_post(String ord_post) {
		this.ord_post = ord_post;
	}

	public String getOrd_addr1() {
		return ord_addr1;
	}

	public void setOrd_addr1(String ord_addr1) {
		this.ord_addr1 = ord_addr1;
	}

	public String getOrd_addr2() {
		return ord_addr2;
	}

	public void setOrd_addr2(String ord_addr2) {
		this.ord_addr2 = ord_addr2;
	}

	public String getOrd_req() {
		return ord_req;
	}

	public void setOrd_req(String ord_req) {
		this.ord_req = ord_req;
	}

	public String getOrd_stat() {
		return ord_stat;
	}

	public void setOrd_stat(String ord_stat) {
		this.ord_stat = ord_stat;
	}

	public int getOrd_invoice() {
		return ord_invoice;
	}

	public void setOrd_invoice(int ord_invoice) {
		this.ord_invoice = ord_invoice;
	}
	
}
