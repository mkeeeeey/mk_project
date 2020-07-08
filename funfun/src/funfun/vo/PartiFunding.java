package funfun.vo;

public class PartiFunding {
	private String memEmail; // 회원이메일
	private String fundDate; // 펀딩한 날짜
	private int fundPrice; // 펀딩한 금액
	private int fundCnt; // 펀딩한 갯수
	private String fundAddress; // 펀딩 상품을 받을 주소
	private String fundPost; // 펀딩 상품을 받을 주소
	public String getFundPost() {
		return fundPost;
	}
	public void setFundPost(String fundPost) {
		this.fundPost = fundPost;
	}
	private int newAdr;// 새로운 주소 
	
	public int getNewAdr() {
		return newAdr;
	}
	public void setNewAdr(int newAdr) {
		this.newAdr = newAdr;
	}
	private int orderCodeInt;//
	public int getOrderCodeInt() {
		return orderCodeInt;
	}
	public void setOrderCodeInt(int orderCodeInt) {
		this.orderCodeInt = orderCodeInt;
	}
	private String fundReceiver; // 펀딩 상품을 받을 사람
	private String optTitle; // 옵션명
	private String optDetail; // 옵션 상세
	private String optCondition; // 옵션 조건
	private String optDeliverDate; // 배송예정일
	private String proCode; // 프로젝트 코드
	private String proTitle; // 프로젝트 이름
	private String cateTitle; // 카테고리 이름
	private int proLeftDate; // 프로젝트 종료시까지 남은 날짜 
	private String proImage; // 프로젝트 이미지
	private String makerName; // 프로젝트 메이커 이름
	private int percent; // 모금률
	private String fundState;// 배송상태
	private String fundingCode; // 펀딩 코드

	public String getFundingCode() {
		return fundingCode;
	}
	public void setFundingCode(String fundingCode) {
		this.fundingCode = fundingCode;
	}
	public String getFundState() {
		return fundState;
	}
	public void setFundState(String fundState) {
		this.fundState = fundState;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemCode(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getFundDate() {
		return fundDate;
	}
	public void setFundDate(String fundDate) {
		this.fundDate = fundDate;
	}
	public int getFundPrice() {
		return fundPrice;
	}
	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}
	public int getFundCnt() {
		return fundCnt;
	}
	public void setFundCnt(int fundCnt) {
		this.fundCnt = fundCnt;
	}
	public String getFundAddress() {
		return fundAddress;
	}
	public void setFundAddress(String fundAddress) {
		this.fundAddress = fundAddress;
	}
	public String getFundReceiver() {
		return fundReceiver;
	}
	public void setFundReceiver(String fundReceiver) {
		this.fundReceiver = fundReceiver;
	}
	public String getOptTitle() {
		return optTitle;
	}
	public void setOptTitle(String optTitle) {
		this.optTitle = optTitle;
	}
	public String getOptDetail() {
		return optDetail;
	}
	public void setOptDetail(String optDetail) {
		this.optDetail = optDetail;
	}
	public String getOptCondition() {
		return optCondition;
	}
	public void setOptCondition(String optCondition) {
		this.optCondition = optCondition;
	}
	public String getOptDeliverDate() {
		return optDeliverDate;
	}
	public void setOptDeliverDate(String optDeliverDate) {
		this.optDeliverDate = optDeliverDate;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	public String getCateTitle() {
		return cateTitle;
	}
	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}
	public int getProLeftDate() {
		return proLeftDate;
	}
	public void setProLeftDate(int proLeftDate) {
		this.proLeftDate = proLeftDate;
	}
	public String getProImage() {
		return proImage;
	}
	public void setProImage(String proImage) {
		this.proImage = proImage;
	}
	public String getMakerName() {
		return makerName;
	}
	public void setMakerName(String makerName) {
		this.makerName = makerName;
	} 
}
