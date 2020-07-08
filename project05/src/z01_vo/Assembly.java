package z01_vo;

public class Assembly {
	private int com_no;
	private int parts_no;
	private int parts_cnt;
	
	public Assembly() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Assembly(int com_no, int parts_no, int parts_cnt) {
		super();
		this.com_no = com_no;
		this.parts_no = parts_no;
		this.parts_cnt = parts_cnt;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}

	public int getParts_no() {
		return parts_no;
	}

	public void setParts_no(int parts_no) {
		this.parts_no = parts_no;
	}

	public int getParts_cnt() {
		return parts_cnt;
	}

	public void setParts_cnt(int parts_cnt) {
		this.parts_cnt = parts_cnt;
	}
	
	
}
