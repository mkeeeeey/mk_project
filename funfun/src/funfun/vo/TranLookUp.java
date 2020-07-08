package funfun.vo;

public class TranLookUp {
	private String memEmail; // 회원 이메일
	private int orderCnt; // 주문 수량
	private int orderPrice; // 지불한 비용
	private String orderCurr; // 주문 상태
	private String orderAddress; // 수령 주소
	private String orderPost; // 수령 주소	
	private String orderReceiver; // 수령인
	private String orderPhoneNo; // 수령인 휴대폰 번호
	private String orderAsk; // 주문 요청 사항
	private String optDetail; // 옵션 상세
	private String stoTitle; // 스토어 이름
	private String stoImage; // 스토어 이미지
	private String orderCode; // 주문 번호
	private String receivDate; // 배송예정일
	private String orderDate; //주문날짜
	private String makerName; // 상품 제작 메이커 이름
	private String sto_code; // 스토어 코드
	public String getOrderPost() {
		return orderPost;
	}
	public void setOrderPost(String orderPost) {
		this.orderPost = orderPost;
	}
	public String getSto_code() {
		return sto_code;
	}
	public void setSto_code(String sto_code) {
		this.sto_code = sto_code;
	}
	public String getMakerName() {
		return makerName;
	}
	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getReceivDate() {
		return receivDate;
	}
	public void setReceivDate(String receivDate) {
		this.receivDate = receivDate;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderCurr() {
		return orderCurr;
	}
	public void setOrderCurr(String orderCurr) {
		this.orderCurr = orderCurr;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderReceiver() {
		return orderReceiver;
	}
	public void setOrderReceiver(String orderReceiver) {
		this.orderReceiver = orderReceiver;
	}
	public String getOrderPhoneNo() {
		return orderPhoneNo;
	}
	public void setOrderPhoneNo(String orderPhoneNo) {
		this.orderPhoneNo = orderPhoneNo;
	}
	public String getOrderAsk() {
		return orderAsk;
	}
	public void setOrderAsk(String orderAsk) {
		this.orderAsk = orderAsk;
	}
	public String getOptDetail() {
		return optDetail;
	}
	public void setOptDetail(String optDetail) {
		this.optDetail = optDetail;
	}
	public String getStoTitle() {
		return stoTitle;
	}
	public void setStoTitle(String stoTitle) {
		this.stoTitle = stoTitle;
	}
	public String getStoImage() {
		return stoImage;
	}
	public void setStoImage(String stoImage) {
		this.stoImage = stoImage;
	}
}
