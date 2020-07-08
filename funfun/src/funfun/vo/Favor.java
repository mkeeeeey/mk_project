package funfun.vo;

public class Favor {
	private String proTitle; // 프로젝트 제목
	private String cateTitle; // 카테고리
	private String dDay; // 프로젝트 종료까지 남은 날짜
	private String image; // 프로젝트 이미지
	private String makerName; // 프로젝트 메이커 이름
	private String memEmail; // 회원 이메일
	private String percent; // 현재모금률
	private String proCode; // 프로젝트 코드
	private int pro_target;
	private int pro_money;
	
	
	
	public int getPro_target() {
		return pro_target;
	}

	public void setPro_target(int pro_target) {
		this.pro_target = pro_target;
	}

	public int getPro_money() {
		return pro_money;
	}

	public void setPro_money(int pro_money) {
		this.pro_money = pro_money;
	}

	public String getPercent() {
		return percent;
	}

	public String getProCode() {
		return proCode;
	}
	public String getemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getProTitle() {
		return proTitle;
	}
	public String getMemEmail() {
		return memEmail;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}

	public void setdDay(String dDay) {
		this.dDay = dDay;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getCateTitle() {
		return cateTitle;
	}
	public String getdDay() {
		return dDay;
	}
	public String getImage() {
		return image;
	}
	public String getMakerName() {
		return makerName;
	}
}
