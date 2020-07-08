package z01_vo;

import java.util.Date;

public class Mgr {
	private int mgr_no;
	private int as_no;
	private Date mgr_date;
	private String mgr_stat;
	private String mgr_note;
	private int mgr_price;
	
	private Date as_date;
	private String as_cate;
	private String mem_id;
	private int ord_no;
	private Date ord_date;
	private String as_detail;
	private int req_no;
	private String parts_img;
	private String parts_name;
	private int req_cnt;
	
	
	
	public Mgr() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Mgr(int mgr_no, String mgr_stat, String mgr_note, int mgr_price) {
		super();
		this.mgr_no = mgr_no;
		this.mgr_stat = mgr_stat;
		this.mgr_note = mgr_note;
		this.mgr_price = mgr_price;
	}

	public Mgr(int mgr_no, int as_no, Date as_date, String as_cate,
			String mem_id, Date mgr_date, String mgr_stat ) {
		super();
		this.mgr_no = mgr_no;
		this.as_no = as_no;
		this.as_date = as_date;
		this.as_cate = as_cate;
		this.mem_id = mem_id;
		this.mgr_date = mgr_date;
		this.mgr_stat = mgr_stat;
	}
	
	public Mgr(int mgr_no, int as_no, Date mgr_date, String mgr_stat, String mgr_note, int mgr_price) {
		super();
		this.mgr_no = mgr_no;
		this.as_no = as_no;
		this.mgr_date = mgr_date;
		this.mgr_stat = mgr_stat;
		this.mgr_note = mgr_note;
		this.mgr_price = mgr_price;
	}
	
	// mgr_no, req_no, parts_img, parts_name, req_cnt
	public Mgr(int mgr_no, int req_no, String parts_img, String parts_name, int req_cnt) {
		super();
		this.mgr_no = mgr_no;
		this.req_no = req_no;
		this.parts_img = parts_img;
		this.parts_name = parts_name;
		this.req_cnt = req_cnt;
	}

	// 관리번호mgr_no, 신청번호 as_no, 신청일as_date, 분류as_cate, 신청자mem_id, 입고일mgr_date, 진행사항mgr_stat
	// 주문번호ord_no, 구매날짜ord_date, 신청내용as_detail, 처리비용mgr_price, 비고mgr_note
	public Mgr(int mgr_no, int as_no, Date as_date, String as_cate, String mem_id, Date mgr_date,
			String mgr_stat, int ord_no, Date ord_date, String as_detail, int mgr_price, String mgr_note){
		super();
		this.mgr_no = mgr_no;
		this.as_no = as_no;
		this.mgr_date = mgr_date;
		this.mgr_stat = mgr_stat;
		this.mgr_note = mgr_note;
		this.mgr_price = mgr_price;
		this.as_date = as_date;
		this.as_cate = as_cate;
		this.mem_id = mem_id;
		this.ord_no = ord_no;
		this.ord_date = ord_date;
		this.as_detail = as_detail;
	}

	public int getMgr_no() {
		return mgr_no;
	}

	public void setMgr_no(int mgr_no) {
		this.mgr_no = mgr_no;
	}

	public int getAs_no() {
		return as_no;
	}

	public void setAs_no(int as_no) {
		this.as_no = as_no;
	}

	public Date getMgr_date() {
		return mgr_date;
	}

	public void setMgr_date(Date mgr_date) {
		this.mgr_date = mgr_date;
	}

	public String getMgr_stat() {
		return mgr_stat;
	}

	public void setMgr_stat(String mgr_stat) {
		this.mgr_stat = mgr_stat;
	}

	public String getMgr_note() {
		return mgr_note;
	}

	public void setMgr_note(String mgr_note) {
		this.mgr_note = mgr_note;
	}

	public int getMgr_price() {
		return mgr_price;
	}

	public void setMgr_price(int mgr_price) {
		this.mgr_price = mgr_price;
	}

	public Date getAs_date() {
		return as_date;
	}

	public void setAs_date(Date as_date) {
		this.as_date = as_date;
	}

	public String getAs_cate() {
		return as_cate;
	}

	public void setAs_cate(String as_cate) {
		this.as_cate = as_cate;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}

	public Date getOrd_date() {
		return ord_date;
	}

	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}

	public String getAs_detail() {
		return as_detail;
	}

	public void setAs_detail(String as_detail) {
		this.as_detail = as_detail;
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
	
	
}	
