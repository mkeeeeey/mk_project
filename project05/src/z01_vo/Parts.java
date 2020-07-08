package z01_vo;

public class Parts {
	private int parts_no;
	private String parts_name;
	private int parts_price;
	private int parts_stock;
	private String parts_img;
	private String parts_detail;
	private String parts_mc;
	private String parts_sc1;
	private String parts_sc2;
	private String parts_sc3;
	private String parts_sc4;
	private String parts_sc5;
	private String parts_sc6;
	private int parts_com;
	private int parts_cnt;
	
	public Parts() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Parts(int parts_no, String parts_name, int parts_price, String parts_img) {
		super();
		this.parts_no = parts_no;
		this.parts_name = parts_name;
		this.parts_price = parts_price;
		this.parts_img = parts_img;
	}
	public Parts(int parts_no, String parts_mc, String parts_name, int parts_price) {
		super();
		this.parts_no = parts_no;
		this.parts_mc = parts_mc;
		this.parts_name = parts_name;
		this.parts_price = parts_price;
	}
	

	public Parts(int parts_no, String parts_mc) {
		super();
		this.parts_no = parts_no;
		this.parts_mc = parts_mc;
	}
	
	public Parts(int parts_com, int parts_no, String parts_name,int parts_price, int parts_cnt, String parts_mc) {
		super();
		this.parts_com = parts_com;
		this.parts_no = parts_no;
		this.parts_name = parts_name;
		this.parts_price = parts_price;
		this.parts_cnt = parts_cnt;
		this.parts_mc = parts_mc;
	}

	public Parts(int parts_com,int parts_no) {
		super();
		this.parts_com = parts_com;
		this.parts_no = parts_no;
	}

	public Parts(String parts_mc, String parts_sc1, String parts_sc2, String parts_sc3, String parts_sc4,
			String parts_sc5, String parts_sc6) {
		super();
		this.parts_mc = parts_mc;
		this.parts_sc1 = parts_sc1;
		this.parts_sc2 = parts_sc2;
		this.parts_sc3 = parts_sc3;
		this.parts_sc4 = parts_sc4;
		this.parts_sc5 = parts_sc5;
		this.parts_sc6 = parts_sc6;
	}

	public Parts(int parts_no, String parts_name, int parts_price, int parts_stock, String parts_img,
			String parts_detail, String parts_mc, String parts_sc1, String parts_sc2, String parts_sc3,
			String parts_sc4, String parts_sc5, String parts_sc6) {
		super();
		this.parts_no = parts_no;
		this.parts_name = parts_name;
		this.parts_price = parts_price;
		this.parts_stock = parts_stock;
		this.parts_img = parts_img;
		this.parts_detail = parts_detail;
		this.parts_mc = parts_mc;
		this.parts_sc1 = parts_sc1;
		this.parts_sc2 = parts_sc2;
		this.parts_sc3 = parts_sc3;
		this.parts_sc4 = parts_sc4;
		this.parts_sc5 = parts_sc5;
		this.parts_sc6 = parts_sc6;
	}

	


	/**
	 * @return the parts_no
	 */
	public int getParts_no() {
		return parts_no;
	}
	/**
	 * @param parts_no the parts_no to set
	 */
	public void setParts_no(int parts_no) {
		this.parts_no = parts_no;
	}
	/**
	 * @return the parts_name
	 */
	public String getParts_name() {
		return parts_name;
	}
	/**
	 * @param parts_name the parts_name to set
	 */
	public void setParts_name(String parts_name) {
		this.parts_name = parts_name;
	}
	/**
	 * @return the parts_price
	 */
	public int getParts_price() {
		return parts_price;
	}
	/**
	 * @param parts_price the parts_price to set
	 */
	public void setParts_price(int parts_price) {
		this.parts_price = parts_price;
	}
	
	/**
	 * @return the parts_img
	 */
	public String getParts_img() {
		return parts_img;
	}
	/**
	 * @param parts_img the parts_img to set
	 */
	public void setParts_img(String parts_img) {
		this.parts_img = parts_img;
	}
	/**
	 * @return the parts_detail
	 */
	public String getParts_detail() {
		return parts_detail;
	}
	/**
	 * @param parts_detail the parts_detail to set
	 */
	public void setParts_detail(String parts_detail) {
		this.parts_detail = parts_detail;
	}
	/**
	 * @return the parts_mc
	 */
	public String getParts_mc() {
		return parts_mc;
	}
	/**
	 * @param parts_mc the parts_mc to set
	 */
	public void setParts_mc(String parts_mc) {
		this.parts_mc = parts_mc;
	}
	/**
	 * @return the parts_sc1
	 */
	public String getParts_sc1() {
		return parts_sc1;
	}
	/**
	 * @param parts_sc1 the parts_sc1 to set
	 */
	public void setParts_sc1(String parts_sc1) {
		this.parts_sc1 = parts_sc1;
	}
	/**
	 * @return the parts_sc2
	 */
	public String getParts_sc2() {
		return parts_sc2;
	}
	/**
	 * @param parts_sc2 the parts_sc2 to set
	 */
	public void setParts_sc2(String parts_sc2) {
		this.parts_sc2 = parts_sc2;
	}
	/**
	 * @return the parts_sc3
	 */
	public String getParts_sc3() {
		return parts_sc3;
	}
	/**
	 * @param parts_sc3 the parts_sc3 to set
	 */
	public void setParts_sc3(String parts_sc3) {
		this.parts_sc3 = parts_sc3;
	}
	/**
	 * @return the parts_sc4
	 */
	public String getParts_sc4() {
		return parts_sc4;
	}
	/**
	 * @param parts_sc4 the parts_sc4 to set
	 */
	public void setParts_sc4(String parts_sc4) {
		this.parts_sc4 = parts_sc4;
	}
	/**
	 * @return the parts_sc5
	 */
	public String getParts_sc5() {
		return parts_sc5;
	}
	/**
	 * @param parts_sc5 the parts_sc5 to set
	 */
	public void setParts_sc5(String parts_sc5) {
		this.parts_sc5 = parts_sc5;
	}
	/**
	 * @return the parts_sc6
	 */
	public String getParts_sc6() {
		return parts_sc6;
	}
	/**
	 * @param parts_sc6 the parts_sc6 to set
	 */
	public void setParts_sc6(String parts_sc6) {
		this.parts_sc6 = parts_sc6;
	}

	/**
	 * @return the parts_stock
	 */
	public int getParts_stock() {
		return parts_stock;
	}

	/**
	 * @param parts_stock the parts_stock to set
	 */
	public void setParts_stock(int parts_stock) {
		this.parts_stock = parts_stock;
	}

	/**
	 * @return the parts_com
	 */
	public int getParts_com() {
		return parts_com;
	}

	/**
	 * @param parts_com the parts_com to set
	 */
	public void setParts_com(int parts_com) {
		this.parts_com = parts_com;
	}

	public int getParts_cnt() {
		return parts_cnt;
	}

	public void setParts_cnt(int parts_cnt) {
		this.parts_cnt = parts_cnt;
	}
	
	
}
