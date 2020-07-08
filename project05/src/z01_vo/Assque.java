package z01_vo;

import java.util.Date;

public class Assque {
	private int asq_no;
	private int com_no;
	private String asq_name;
	private String asq_detail;
	private Date asq_reqdate;
	private String asq_comm;
	private Date asq_comdate;
	private String mem_id;
	
	public Assque() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Assque(int asq_no, String asq_name, String mem_id, Date asq_reqdate) {
		super();
		this.asq_no = asq_no;
		this.asq_name = asq_name;
		this.mem_id = mem_id;
		this.asq_reqdate = asq_reqdate;
	}
	
	
	
	public Assque(int com_no, String asq_name, String asq_detail) {
		super();
		this.com_no = com_no;
		this.asq_name = asq_name;
		this.asq_detail = asq_detail;
	}

	public Assque(int asq_no, String asq_name, String asq_detail, Date asq_reqdate, String asq_comm, Date asq_comdate,
			String mem_id) {
		super();
		this.asq_no = asq_no;
		this.asq_name = asq_name;
		this.asq_detail = asq_detail;
		this.asq_reqdate = asq_reqdate;
		this.asq_comm = asq_comm;
		this.asq_comdate = asq_comdate;
		this.mem_id = mem_id;
	}

	public Assque(int asq_no, int com_no, String asq_name, String asq_detail, Date asq_reqdate, String asq_comm,
			Date asq_comdate) {
		super();
		this.asq_no = asq_no;
		this.com_no = com_no;
		this.asq_name = asq_name;
		this.asq_detail = asq_detail;
		this.asq_reqdate = asq_reqdate;
		this.asq_comm = asq_comm;
		this.asq_comdate = asq_comdate;
	}

	public int getAsq_no() {
		return asq_no;
	}

	public void setAsq_no(int asq_no) {
		this.asq_no = asq_no;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}

	public String getAsq_name() {
		return asq_name;
	}

	public void setAsq_name(String asq_name) {
		this.asq_name = asq_name;
	}

	public String getAsq_detail() {
		return asq_detail;
	}

	public void setAsq_detail(String asq_detail) {
		this.asq_detail = asq_detail;
	}

	public Date getAsq_reqdate() {
		return asq_reqdate;
	}

	public void setAsq_reqdate(Date asq_reqdate) {
		this.asq_reqdate = asq_reqdate;
	}

	public String getAsq_comm() {
		return asq_comm;
	}

	public void setAsq_comm(String asq_comm) {
		this.asq_comm = asq_comm;
	}

	public Date getAsq_comdate() {
		return asq_comdate;
	}

	public void setAsq_comdate(Date asq_comdate) {
		this.asq_comdate = asq_comdate;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}
