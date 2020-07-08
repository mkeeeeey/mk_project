package jhk;

public class Comdetail {
	private int com_no;
	private String parts_name;
	private int parts_cnt;
	private String parts_mc;
	private String com_name;
	private String com_kind;
	private String com_img;
	private String com_detail;
	private int com_price;
	
	public Comdetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Comdetail(int com_no, String parts_name, int parts_cnt, String parts_mc, String com_name, String com_kind,
			String com_img, String com_detail, int com_price) {
		super();
		this.com_no = com_no;
		this.parts_name = parts_name;
		this.parts_cnt = parts_cnt;
		this.parts_mc = parts_mc;
		this.com_name = com_name;
		this.com_kind = com_kind;
		this.com_img = com_img;
		this.com_detail = com_detail;
		this.com_price = com_price;
	}

	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public String getParts_name() {
		return parts_name;
	}
	public void setParts_name(String parts_name) {
		this.parts_name = parts_name;
	}
	public int getParts_cnt() {
		return parts_cnt;
	}
	public void setParts_cnt(int parts_cnt) {
		this.parts_cnt = parts_cnt;
	}
	public String getParts_mc() {
		return parts_mc;
	}
	public void setParts_mc(String parts_mc) {
		this.parts_mc = parts_mc;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_kind() {
		return com_kind;
	}
	public void setCom_kind(String com_kind) {
		this.com_kind = com_kind;
	}
	public String getCom_img() {
		return com_img;
	}
	public void setCom_img(String com_img) {
		this.com_img = com_img;
	}
	public String getCom_detail() {
		return com_detail;
	}
	public void setCom_detail(String com_detail) {
		this.com_detail = com_detail;
	}
	public int getCom_price() {
		return com_price;
	}
	public void setCom_price(int com_price) {
		this.com_price = com_price;
	}
	
	
}
