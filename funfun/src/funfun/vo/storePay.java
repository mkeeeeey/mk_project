package funfun.vo;

import lombok.Getter;
import lombok.Setter;


public class storePay {
	private int sto_order_code;
	private int sto_opt_code;
	private int mem_code;
	private int pay_cnt;
	private int pay_price;
	private String pay_curr;
	private int pay_zipcode;
	private String pay_addr;
	private String pay_name;
	private String pay_phone;
	private String pay_ship_req;
	
	public int getSto_order_code() {
		return sto_order_code;
	}
	public void setSto_order_code(int sto_order_code) {
		this.sto_order_code = sto_order_code;
	}
	public int getSto_opt_code() {
		return sto_opt_code;
	}
	public void setSto_opt_code(int sto_opt_code) {
		this.sto_opt_code = sto_opt_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public int getPay_cnt() {
		return pay_cnt;
	}
	public void setPay_cnt(int pay_cnt) {
		this.pay_cnt = pay_cnt;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_curr() {
		return pay_curr;
	}
	public void setPay_curr(String pay_curr) {
		this.pay_curr = pay_curr;
	}
	public int getPay_zipcode() {
		return pay_zipcode;
	}
	public void setPay_zipcode(int pay_zipcode) {
		this.pay_zipcode = pay_zipcode;
	}
	public String getPay_addr() {
		return pay_addr;
	}
	public void setPay_addr(String pay_addr) {
		this.pay_addr = pay_addr;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public String getPay_phone() {
		return pay_phone;
	}
	public void setPay_phone(String pay_phone) {
		this.pay_phone = pay_phone;
	}
	public String getPay_ship_req() {
		return pay_ship_req;
	}
	public void setPay_ship_req(String pay_ship_req) {
		this.pay_ship_req = pay_ship_req;
	}
	
	
}
