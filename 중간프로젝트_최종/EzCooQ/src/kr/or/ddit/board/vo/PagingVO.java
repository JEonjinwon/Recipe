package kr.or.ddit.board.vo;

public class PagingVO {
	private int pageCount = 10;		// 페이지 목록에 게시되는 페이지 수
	private int countPerPage = 10;	// 한 페이지당 게시되는 게시물 건수
	private int currentPageNo;		// 현재 페이지 번호
	private int totalCount;			// 전체 게시물 건 수
	
	private int totalPageCount;		// 전체 페이지 수
	private int firstPageNo;		// 현재페이지 목록의 첫 페이지 번호
	private int lastPageNo;			// 현재페이지 목록의 마지막 페이지 번호
	private int firstRecNo;			// 첫번째 레코드 번호
	private int lastRecNo;			// 마지막 레코드 번호
	
	
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	// 전체 페이지 수
	public int getTotalPageCount() {
		totalPageCount = ((getTotalCount() - 1) / getCountPerPage()) + 1;
		return totalPageCount; 
	}
	
	// 시작페이지 번호
	public int getFirstPageNo() {
		firstPageNo = ((getCurrentPageNo() - 1) 
				/ getPageCount()) * getPageCount() + 1;
		return firstPageNo;
	}
	
	// 마지막 페이지 번호
	public int getLastPageNo() {
		lastPageNo = getFirstPageNo() + getPageCount() - 1;
		if(lastPageNo > getTotalPageCount()) {
			lastPageNo = getTotalPageCount();
		}
		
		return lastPageNo;
	}
	
	// 첫번째 레코드 번호
	public int getFirstRecNo() {
		firstRecNo = 
				(getCurrentPageNo() -1) * getCountPerPage() + 1;
		return firstRecNo;
	}
	
	// 마지막 레코드 번호
	public int getLastRecNo() {
		lastRecNo = getCurrentPageNo() * getCountPerPage();
		
		return lastRecNo;
	}
	
	
	
	
	
	
	
	
	
	
}
