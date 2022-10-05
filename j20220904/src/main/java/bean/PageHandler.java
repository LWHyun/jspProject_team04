package bean;

public class PageHandler {
	private int curPage;		// 현재페이지
	private int pageSize;		// 한 페이지 당 게시물 수
	private int blockSize;		// 페이지 네비게이션 크기
	private int totalCnt; 		// 총 게시물 개수
	private int totalPage;		// 총 페이지 수
	private int startPage;		// 페이지 네비게이션 시작
	private int endPage;		// 페이지 네비게이션 끝
	private boolean showPrev;	// 이전
	private boolean	showNext;	// 다음
	
	public PageHandler(int curPage, int pageSize, int blockSize, int totalCnt) {
		this.curPage = curPage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.totalCnt = totalCnt;
		
		totalPage = (int)Math.ceil((double)totalCnt/pageSize);
		startPage = (curPage-1)/blockSize*blockSize+1;
		endPage = startPage+blockSize-1;
		endPage = endPage > totalPage ? totalPage : endPage;
		
		showPrev = startPage != 1;
		showNext = endPage != totalPage; 
	}
	
	public PageHandler(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	// getter / setter
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}
	

	@Override
	public String toString() {
		return "PageHandler [curPage=" + curPage + ", pageSize=" + pageSize + ", blockSize=" + blockSize + ", totalCnt="
				+ totalCnt + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", showPrev=" + showPrev + ", showNext=" + showNext + "]";
	}
	
	
}
