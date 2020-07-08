package funfun.vo;

public class Funding {
	private int fund_code; // 펀딩번호
	private int mem_code; // 회원번호
	private String fund_date; // 펀딩날짜
	private int opt_code; // 옵션번호
	private int fund_price; // 펀딩금액
	private int fund_cnt; // 선택수량
	private String fund_opt_detail; // 펀딩 옵션 조건 내용
	private String fund_post; // 우편번호
	private String fund_address; // 주소
	private String fund_receiver; // 수령인
	private String fund_state; // 상태
	private String fund_rec_tel; // 수령인 연락처
	private int fund_tot; // 최종 결제 금액
	
	private int pro_code; // 프로젝트번호
	
	public int getFund_code() {
		return fund_code;
	}
	public void setFund_code(int fund_code) {
		this.fund_code = fund_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getFund_date() {
		return fund_date;
	}
	public void setFund_date(String fund_date) {
		this.fund_date = fund_date;
	}
	public int getOpt_code() {
		return opt_code;
	}
	public void setOpt_code(int opt_code) {
		this.opt_code = opt_code;
	}
	public int getFund_price() {
		return fund_price;
	}
	public void setFund_price(int fund_price) {
		this.fund_price = fund_price;
	}
	public int getFund_cnt() {
		return fund_cnt;
	}
	public void setFund_cnt(int fund_cnt) {
		this.fund_cnt = fund_cnt;
	}
	public String getFund_opt_detail() {
		return fund_opt_detail;
	}
	public void setFund_opt_detail(String fund_opt_detail) {
		this.fund_opt_detail = fund_opt_detail;
	}
	public String getFund_post() {
		return fund_post;
	}
	public void setFund_post(String fund_post) {
		this.fund_post = fund_post;
	}
	public String getFund_address() {
		return fund_address;
	}
	public void setFund_address(String fund_address) {
		this.fund_address = fund_address;
	}
	public String getFund_receiver() {
		return fund_receiver;
	}
	public void setFund_receiver(String fund_receiver) {
		this.fund_receiver = fund_receiver;
	}
	public String getFund_state() {
		return fund_state;
	}
	public void setFund_state(String fund_state) {
		this.fund_state = fund_state;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getFund_rec_tel() {
		return fund_rec_tel;
	}
	public void setFund_rec_tel(String fund_rec_tel) {
		this.fund_rec_tel = fund_rec_tel;
	}
	public int getFund_tot() {
		return fund_tot;
	}
	public void setFund_tot(int fund_tot) {
		this.fund_tot = fund_tot;
	}
	
	

}
