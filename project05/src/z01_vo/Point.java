package z01_vo;

import java.util.Date;

public class Point {
	private int point_no;
	private String mem_id;
	private Date point_date;
	private String point_detail;
	private int point_pt;
	
	private int tot;
	private int plus;
	private int minus;
	
	public Point() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Point(String mem_id, String point_detail, int point_pt) {
		super();
		this.mem_id = mem_id;
		this.point_detail = point_detail;
		this.point_pt = point_pt;
	}


	public Point(int point_no, String mem_id, Date point_date, String point_detail, int point_pt) {
		super();
		this.point_no = point_no;
		this.mem_id = mem_id;
		this.point_date = point_date;
		this.point_detail = point_detail;
		this.point_pt = point_pt;
	}

	// 포인트조회
	public Point(Date point_date, String point_detail, int point_pt) {
		super();
		this.point_date = point_date;
		this.point_detail = point_detail;
		this.point_pt = point_pt;
	}
	
	// 포인트 계산

	public Point(int tot) {
		super();
		this.tot = tot;
	}


	public int getPoint_no() {
		return point_no;
	}



	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}

	public String getPoint_detail() {
		return point_detail;
	}

	public void setPoint_detail(String point_detail) {
		this.point_detail = point_detail;
	}

	public int getPoint_pt() {
		return point_pt;
	}

	public void setPoint_pt(int point_pt) {
		this.point_pt = point_pt;
	}


	public int getTot() {
		return tot;
	}


	public void setTot(int tot) {
		this.tot = tot;
	}


	public int getPlus() {
		return plus;
	}


	public void setPlus(int plus) {
		this.plus = plus;
	}


	public int getMinus() {
		return minus;
	}


	public void setMinus(int minus) {
		this.minus = minus;
	}

	
	
}
