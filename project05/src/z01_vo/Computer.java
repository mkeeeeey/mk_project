package z01_vo;

public class Computer {
	private int com_no;
	private String mem_id;
	private String com_name;
	private String com_kind;
	private String com_img;
	private String com_detail;
	private int com_price;
	
	public Computer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Computer(int com_no, String mem_id, String com_name, String com_kind, String com_img, String com_detail,
			int com_price) {
		super();
		this.com_no = com_no;
		this.mem_id = mem_id;
		this.com_name = com_name;
		this.com_kind = com_kind;
		this.com_img = com_img;
		this.com_detail = com_detail;
		this.com_price = com_price;
	}
	
	public Computer(int com_no, String mem_id) {
		super();
		this.com_no = com_no;
		this.mem_id = mem_id;
	}
	
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
