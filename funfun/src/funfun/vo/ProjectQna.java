package funfun.vo;

public class ProjectQna {
	private int qna_code; // 문의번호
	private int pro_code; // 프로젝트번호
	private int mem_code; // 회원번호
	private String qna_detail; // 문의내용
	private String qna_reg_date; // 문의날짜
	private String qna_open; // 비밀글여부
	private String qna_ans; // 문의 답변
	private String qna_ans_reg_date; // 답변날짜
	private String qna_chk; // 문의 확인 여부
	private String mem_name; // 회원이름
	
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getQna_detail() {
		return qna_detail;
	}
	public void setQna_detail(String qna_detail) {
		this.qna_detail = qna_detail;
	}
	public String getQna_reg_date() {
		return qna_reg_date;
	}
	public void setQna_reg_date(String qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}
	public String getQna_open() {
		return qna_open;
	}
	public void setQna_open(String qna_open) {
		this.qna_open = qna_open;
	}
	public String getQna_ans() {
		return qna_ans;
	}
	public void setQna_ans(String qna_ans) {
		this.qna_ans = qna_ans;
	}
	public String getQna_ans_reg_date() {
		return qna_ans_reg_date;
	}
	public void setQna_ans_reg_date(String qna_ans_reg_date) {
		this.qna_ans_reg_date = qna_ans_reg_date;
	}
	public String getQna_chk() {
		return qna_chk;
	}
	public void setQna_chk(String qna_chk) {
		this.qna_chk = qna_chk;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	

}
