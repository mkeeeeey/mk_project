package cmk;

import java.util.Date;

public class Myorder {
	private int ord_no;
	private String mem_name;
	private String parts_img;
	private String parts_name;
	private int req_cnt;
	private int req;
	private int total;
	private Date ord_date;
	private String ord_stat;
	
	private String mem_id;
	private int parts_price;
	
	private Long ord_invoice;
	private String ord_name;
	private String ord_tel;
	private String ord_post;
	private String ord_addr1;
	private String ord_addr2;
	private String ord_req;
	
	private String pay_method;
	private int pay_point;
	private int pay_price;
	
	

	
	public Myorder(int ord_no, Long ord_invoice) {
		super();
		this.ord_no = ord_no;
		this.ord_invoice = ord_invoice;
	}
	public Myorder() {
		super();
		// TODO Auto-generated constructor stub
	}
	/*
	 c.ord_no, sum(pr.req_cnt*a.parts_price) total, c.ORD_DATE, c.ord_stat, c.ORD_INVOICE
	 */
	public Myorder(int ord_no, int total, Date ord_date, String ord_stat, Long ord_invoice) {
		super();
		this.ord_no = ord_no;
		this.total = total;
		this.ord_date = ord_date;
		this.ord_stat = ord_stat;
		this.ord_invoice = ord_invoice;
	}
	
	
	public Myorder(int ord_no, String parts_img, String parts_name) {
		super();
		this.ord_no = ord_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
	}
	/*
	 c.ord_no, m.MEM_NAME, c.ORD_DATE, c.ord_stat, sum(pr.req_cnt*a.parts_price) total, c.ORD_INVOICE, c.ORD_NAME, c.ORD_POST, c.ORD_ADDR1, c.ORD_ADDR2, c.ORD_TEL, c.ORD_REQ, e.PAY_METHOD, e.PAY_POINT ,e.PAY_PRICE
	 */

	public Myorder(int ord_no, String mem_name, Date ord_date, String ord_stat, int total, Long ord_invoice,
			String ord_name, String ord_post, String ord_addr1, String ord_addr2, String ord_tel, String ord_req,
			String pay_method, int pay_point, int pay_price) {
		super();
		this.ord_no = ord_no;
		this.mem_name = mem_name;
		this.total = total;
		this.ord_date = ord_date;
		this.ord_stat = ord_stat;
		this.ord_invoice = ord_invoice;
		this.ord_name = ord_name;
		this.ord_tel = ord_tel;
		this.ord_post = ord_post;
		this.ord_addr1 = ord_addr1;
		this.ord_addr2 = ord_addr2;
		this.ord_req = ord_req;
		this.pay_method = pay_method;
		this.pay_point = pay_point;
		this.pay_price = pay_price;
	}
	
	/*
	 pr.ord_no, a.parts_img, a.parts_name, a.parts_price, pr.req_cnt, (pr.req_cnt*a.parts_price) req 
	 */

	public Myorder(int ord_no, String parts_img, String parts_name, int parts_price, int req_cnt, int req) {
		super();
		this.ord_no = ord_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
		this.req = req;
		this.parts_price = parts_price;
	}
	/*
	 pr.ord_no, c.ord_date, c.MEM_ID, c.ord_stat, a.parts_img, a.parts_name, a.parts_price, pr.req_cnt, (pr.req_cnt*a.parts_price) req, d.total, c.ORD_INVOICE,\r\n" + 
					" c.ORD_NAME, c.ORD_POST, c.ORD_ADDR1, c.ORD_ADDR2, c.ORD_TEL, c.ORD_REQ, e.PAY_METHOD,e.PAY_POINT ,e.PAY_PRICE
	 */
	public Myorder(int ord_no, Date ord_date, String mem_name, String ord_stat, String parts_img, String parts_name, int parts_price, int req_cnt, int req, int total,
			Long ord_invoice, String ord_name, String ord_post, String ord_addr1, String ord_addr2, String ord_tel, String ord_req, String pay_method, int pay_point, int pay_price) {
		super();
		this.ord_no = ord_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
		this.req = req;
		this.total = total;
		this.ord_date = ord_date;
		this.ord_stat = ord_stat;
		this.mem_name = mem_name;
		this.parts_price = parts_price;
		this.ord_invoice = ord_invoice;
		this.ord_name = ord_name;
		this.ord_tel = ord_tel;
		this.ord_post = ord_post;
		this.ord_addr1 = ord_addr1;
		this.ord_addr2 = ord_addr2;
		this.ord_req = ord_req;
		this.pay_method = pay_method;
		this.pay_point = pay_point;
		this.pay_price = pay_price;
	}
	
	//pr.ord_no, a.parts_img, a.parts_name, pr.req_cnt, (pr.req_cnt*a.parts_price) req
	public Myorder(int ord_no, String parts_img, String parts_name, int req_cnt, int req) {
		super();
		this.ord_no = ord_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
		this.req = req;
	}
	//c.ord_no, sum(pr.req_cnt*a.parts_price) total, c.ORD_DATE, c.ord_stat	
	public Myorder(int ord_no, int total, Date ord_date, String ord_stat) {
		super();
		this.ord_no = ord_no;
		this.total = total;
		this.ord_date = ord_date;
		this.ord_stat = ord_stat;
	}
	
	public Myorder(int ord_no, String parts_img, String parts_name, int req_cnt, int req, Date ord_date) {
		super();
		this.ord_no = ord_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
		this.req = req;
		this.ord_date = ord_date;
	}
	
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
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
	public int getReq() {
		return req;
	}
	public void setReq(int req) {
		this.req = req;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_stat() {
		return ord_stat;
	}
	public void setOrd_stat(String ord_stat) {
		this.ord_stat = ord_stat;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public int getParts_price() {
		return parts_price;
	}


	public void setParts_price(int parts_price) {
		this.parts_price = parts_price;
	}


	public Long getOrd_invoice() {
		return ord_invoice;
	}


	public void setOrd_invoice(Long ord_invoice) {
		this.ord_invoice = ord_invoice;
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


	public String getPay_method() {
		return pay_method;
	}


	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}


	public int getPay_point() {
		return pay_point;
	}


	public void setPay_point(int pay_point) {
		this.pay_point = pay_point;
	}


	public int getPay_price() {
		return pay_price;
	}


	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	

	
}
