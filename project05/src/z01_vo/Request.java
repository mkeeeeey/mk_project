package z01_vo;

public class Request {
	private int ord_no;
	private int req_no;
	private int req_cnt;
	private int req_opt; //옵션 가격
	
	public Request() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Request(int req_no, int req_cnt) {
		super();
		this.req_no = req_no;
		this.req_cnt = req_cnt;
	}
	public Request(int ord_no, int req_no, int req_cnt) {
		super();
		this.ord_no = ord_no;
		this.req_no = req_no;
		this.req_cnt = req_cnt;
	}

	public Request(int ord_no, int req_no, int req_cnt, int req_opt) {
		super();
		this.ord_no = ord_no;
		this.req_no = req_no;
		this.req_cnt = req_cnt;
		this.req_opt = req_opt;
	}

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}

	public int getReq_no() {
		return req_no;
	}

	public void setReq_no(int req_no) {
		this.req_no = req_no;
	}

	public int getReq_cnt() {
		return req_cnt;
	}

	public void setReq_cnt(int req_cnt) {
		this.req_cnt = req_cnt;
	}

	public int getReq_opt() {
		return req_opt;
	}

	public void setReq_opt(int req_opt) {
		this.req_opt = req_opt;
	}
	
	
}
