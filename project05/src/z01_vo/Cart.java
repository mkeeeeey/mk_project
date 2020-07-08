package z01_vo;

public class Cart {
	private int req_no;
	private String parts_img;
	private String parts_name;
	private int req_cnt;
	private int parts_price;
	
	private int totalPay;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Cart(int req_no, int req_cnt) {
		super();
		this.req_no = req_no;
		this.req_cnt = req_cnt;
	}


	public Cart(int req_no, String parts_img, String parts_name, int parts_price) {
		super();
		this.req_no = req_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.parts_price = parts_price;
	}

	public Cart(int req_no, String parts_img, String parts_name, int req_cnt, int parts_price) {
		super();
		this.req_no = req_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
		this.parts_price = parts_price;
	}
	public int getReq_no() {
		return req_no;
	}
	public void setReq_no(int req_no) {
		this.req_no = req_no;
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
	

}
