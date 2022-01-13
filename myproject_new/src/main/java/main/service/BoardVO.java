package main.service;

public class BoardVO {

	// 캡슐화 : 접근지정자 
	private int unq;
	private String title;
	private String pass;
	private String name;
	private String content;
	private int hits;
	private String rdate;
	
	// 페이징 처리
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 1;
	private int unit = 10; // 화면에 보여지는 글목록 수
	
	// 검색기능
	private String searchGubun;
	private String searchText;	
	
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}	
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}	
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}	
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	@Override
	public String toString() {
		return "BoardVO [unq=" + unq + ", title=" + title + ", pass=" + pass + ", name=" + name + ", content=" + content
				+ ", hits=" + hits + ", rdate=" + rdate + ", viewPage=" + viewPage + ", startIndex=" + startIndex
				+ ", endIndex=" + endIndex + ", unit=" + unit + ", searchGubun=" + searchGubun + ", searchText="
				+ searchText + "]";
	}	
}