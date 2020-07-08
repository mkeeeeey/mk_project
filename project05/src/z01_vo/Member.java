package z01_vo;

import java.util.Date;

public class Member {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private Date mem_birth;
	private String mem_email;
	private String mem_tel;
	private Date mem_jdate;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String mem_id, String mem_pw) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}

	public Member(String mem_id, String mem_name, Date mem_birth, String mem_email, String mem_tel, Date mem_jdate) {
		super();
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_email = mem_email;
		this.mem_tel = mem_tel;
		this.mem_jdate = mem_jdate;
	}
	public Member(String mem_id, String mem_name, String mem_email, String mem_tel) {
		super();
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_tel = mem_tel;
	}
	// 회원가입
	public Member(String mem_id, String mem_pw, String mem_name, Date mem_birth, String mem_email, String mem_tel) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_email = mem_email;
		this.mem_tel = mem_tel;
	}
	public Member(String mem_id, String mem_pw, String mem_name, Date mem_birth, String mem_email, String mem_tel,
			Date mem_jdate) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_email = mem_email;
		this.mem_tel = mem_tel;
		this.mem_jdate = mem_jdate;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public Date getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public Date getMem_jdate() {
		return mem_jdate;
	}

	public void setMem_jdate(Date mem_jdate) {
		this.mem_jdate = mem_jdate;
	}
	
}
