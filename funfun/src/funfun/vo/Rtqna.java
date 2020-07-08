package funfun.vo;

import java.sql.Date;

public class Rtqna {
	/*
	채팅 목록(관리자) 페이징처리 및 마지막 채팅내용 완료
	SELECT *
	from(
		SELECT rownum cnt, a.rtQNA_CODE, a.rtqna_detail, a.mem_name, a.rtqna_state, a.mem_code
		from(
		SELECT a.*, b.rtqna_detail, c.mem_name
		FROM rtqna a, (SELECT a.* FROM rtqna_detail a, (SELECT max(rtqna_detail_code) lastqna FROM rtqna_detail
		GROUP by rtqna_code) b
		where b.lastqna = a.rtqna_detail_code) b, MEMBER c
		WHERE a.rtqna_code = b.rtqna_code
		AND a.mem_code = c.mem_code
		ORDER BY rtqna_state) a)
	WHERE cnt BETWEEN 1 AND 5
	
	채팅 작성자 이름 처리
	
	
	 */
	
	private int rtqna_code;
	private int mem_code;
	private String rtqna_state;
	private int rtqna_detail_code;
	private Date rtqna_time;
	private int rtqna_writer;
	private String rtqna_detail;
	
	private int cnt;
	private String mem_name;
	private String name;
	
	public int getRtqna_code() {
		return rtqna_code;
	}
	public void setRtqna_code(int rtqna_code) {
		this.rtqna_code = rtqna_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getRtqna_state() {
		return rtqna_state;
	}
	public void setRtqna_state(String rtqna_state) {
		this.rtqna_state = rtqna_state;
	}
	public int getRtqna_detail_code() {
		return rtqna_detail_code;
	}
	public void setRtqna_detail_code(int rtqna_detail_code) {
		this.rtqna_detail_code = rtqna_detail_code;
	}
	public Date getRtqna_time() {
		return rtqna_time;
	}
	public void setRtqna_time(Date rtqna_time) {
		this.rtqna_time = rtqna_time;
	}
	public int getRtqna_writer() {
		return rtqna_writer;
	}
	public void setRtqna_writer(int rtqna_writer) {
		this.rtqna_writer = rtqna_writer;
	}
	public String getRtqna_detail() {
		return rtqna_detail;
	}
	public void setRtqna_detail(String rtqna_detail) {
		this.rtqna_detail = rtqna_detail;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
}
