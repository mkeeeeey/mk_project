package z01_vo;

public class Pay {
	private int pay_no;
	private int ord_no;
	private String pay_method;
	private int pay_point;
	private int pay_price;
	
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Pay(int ord_no, String pay_method, int pay_point, int pay_price) {
		super();
		this.ord_no = ord_no;
		this.pay_method = pay_method;
		this.pay_point = pay_point;
		this.pay_price = pay_price;
	}


	public Pay(int pay_no, int ord_no, String pay_method, int pay_point, int pay_price) {
		super();
		this.pay_no = pay_no;
		this.ord_no = ord_no;
		this.pay_method = pay_method;
		this.pay_point = pay_point;
		this.pay_price = pay_price;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
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
	
	
}
