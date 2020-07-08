package funfun.vo;

public class Project {

	private int pro_code; // 프로젝트 번호
	private int maker_code; // 메이커 번호
	private int mem_code; // 회원번호
	private String pro_reg_date; // 프로젝트 신청 날짜
	private String pro_sub_date; // 프로젝트 승인 날짜
	private String pro_title; // 프로젝트 명
	private String cate_title; // 카테고리 명
	private int pro_target; // 목표금액
	private String pro_start_date; // 프로젝트 시작 날짜
	private String pro_finish_date; // 프로젝트 종료 날짜
	private String pro_image; // 대표이미지
	private String pro_story; // 프로젝트 스토리
	private String pro_docu; // 리워드 인증서류
	private String pro_keyword; // 키워드
	private String pro_curr; // 현재 상태
	private int pro_money; // 현재 모금액
	private int percent; // 모금률
	private int dday; // 남은기간
	
	private String maker_name; // 메이커이름
	private String maker_profile; // 메이커프로필
	
	public Project() {
		super();
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public int getMaker_code() {
		return maker_code;
	}
	public void setMaker_code(int maker_code) {
		this.maker_code = maker_code;
	}
	public String getPro_reg_date() {
		return pro_reg_date;
	}
	public void setPro_reg_date(String pro_reg_date) {
		this.pro_reg_date = pro_reg_date;
	}
	public String getPro_sub_date() {
		return pro_sub_date;
	}
	public void setPro_sub_date(String pro_sub_date) {
		this.pro_sub_date = pro_sub_date;
	}
	public String getPro_title() {
		return pro_title;
	}
	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}
	public String getCate_title() {
		return cate_title;
	}
	public void setCate_title(String cate_title) {
		this.cate_title = cate_title;
	}
	public int getPro_target() {
		return pro_target;
	}
	public void setPro_target(int pro_target) {
		this.pro_target = pro_target;
	}
	public String getPro_start_date() {
		return pro_start_date;
	}
	public void setPro_start_date(String pro_start_date) {
		this.pro_start_date = pro_start_date;
	}
	public String getPro_finish_date() {
		return pro_finish_date;
	}
	public void setPro_finish_date(String pro_finish_date) {
		this.pro_finish_date = pro_finish_date;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public String getPro_story() {
		return pro_story;
	}
	public void setPro_story(String pro_story) {
		this.pro_story = pro_story;
	}
	public String getPro_docu() {
		return pro_docu;
	}
	public void setPro_docu(String pro_docu) {
		this.pro_docu = pro_docu;
	}
	public String getPro_keyword() {
		return pro_keyword;
	}
	public void setPro_keyword(String pro_keyword) {
		this.pro_keyword = pro_keyword;
	}
	public String getPro_curr() {
		return pro_curr;
	}
	public void setPro_curr(String pro_curr) {
		this.pro_curr = pro_curr;
	}
	public int getPro_money() {
		return pro_money;
	}
	public void setPro_money(int pro_money) {
		this.pro_money = pro_money;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getMaker_name() {
		return maker_name;
	}
	public void setMaker_name(String maker_name) {
		this.maker_name = maker_name;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getMaker_profile() {
		return maker_profile;
	}
	public void setMaker_profile(String maker_profile) {
		this.maker_profile = maker_profile;
	}
	
	
	
}
