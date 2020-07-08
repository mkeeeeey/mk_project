package funfun.vo;

public class MyPageInfo {
	private String makerCode; // 메이커 코드
	private String memName; // 회원 이름
	private String memProfile; // 회원 프로필
	private String memEmail; // 회원 이메일

	
	
	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemProfile() {
		return memProfile;
	}

	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}

	public String getMakerCode() {
		return makerCode;
	}

	public void setMakerCode(String makerCode) {
		this.makerCode = makerCode;
	}
}
