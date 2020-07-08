package funfun.vo;

public class Paging {
	// 검색과 페이징 처리를 위한 VO 객체..
	// 1. 검색(제목, 작성자, 내용, 회원번호)
	private String title;
	private String writer;
	private String content;
	private int sto_code;
	private String sto_title;
	private String cate_title;
	private String store_sort;
	private int report_code;
	private String pro_title;
	public String getPro_title() {
		return pro_title;
	}
	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}
	public String getStore_sort() {
		return store_sort;
	}
	public void setStore_sort(String store_sort) {
		this.store_sort = store_sort;
	}
	public String getSto_title() {
		return sto_title;
	}
	public void setSto_title(String sto_title) {
		this.sto_title = sto_title;
	}
	public String getCate_title() {
		return cate_title;
	}
	public void setCate_title(String cate_title) {
		this.cate_title = cate_title;
	}
	public int getSto_code() {
		return sto_code;
	}
	public void setSto_code(int sto_code) {
		this.sto_code = sto_code;
	}
	public int getReport_code() {
		return report_code;
	}
	public void setReport_code(int report_code) {
		this.report_code = report_code;
	}
	// 2. 페이징 처리
	private int count; 		// 총 데이터 건수
	private int pageSize; 	// 한번에 보여줄 페이지 크기..
	private int pageCount; 	// 총 페이지 수. count/pageSize
	private int curPage; 	// 클릭한 현재 페이지번호
	private int start;		// 화면에 보여줄 페이지의 시작번호
	private int end;		// 화면에 보여줄 페이지의 마지막번호
	// 3. 블럭 처리.
	private int blocksize;  // 한번에 보여줄 block의 크기
	private int startBlock;	// block의 시작번호
	private int endBlock;	// block의 마지막번호
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlocksize() {
		return blocksize;
	}
	public void setBlocksize(int blocksize) {
		this.blocksize = blocksize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
	
}
