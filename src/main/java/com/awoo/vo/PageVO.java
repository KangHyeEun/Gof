package com.awoo.vo;

public class PageVO {
	// 현재 페이지
	private int nowPage;
	// 시작 페이지
	private int startPage;
	// 종료 페이지
	private int endPage;
	// 전체 페이지
	private int totalPage;
	// 총 row의 갯수
	private int totalRow;
	// 현재 페이지에 보이는 시작 row
	private int startRow;
	// 현재 페이지에 보이는 끝 row
	private int endRow;
	// 페이지 당 row 갯수 // 15
	private int cntPerPage;
	// 블록 당 페이지 갯수 // 10
	private int cntPerBlock;
	// 제목
	private String title;
	// 내용
	private String content;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	//카테고리
	private String category;
	//글쓴이
	private String owner;
	
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public PageVO(int nowPage, int cntPerPage, int cntPerBlock, int totalRow) {
		super();
		this.nowPage = nowPage;
		this.cntPerPage = cntPerPage;
		this.cntPerBlock = cntPerBlock;
		this.totalRow = totalRow;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage() {
		// 현재 페이지에서 -1 을 하게 되면 현재 나누려는 수의 묶이 벗어나지 않음
		// 예를들어 한 블럭 내에 보여줄 페이지가 10개라고 한다면
		// 1,2,3,4,5,6,7,8,9,10  -1  => 0,1,2,3,4,5,6,7,8,9
		// 0,1,2,3,4,5,6,7,8,9 / 10 => 0,0,0,0,0,0,0,0,0,0 => 모든 값 일치
		
		// 11,12,13,14,15,16,17,18,19,20 -1 => 10,11,12,13,14,15,16,17,18,19
		// 10,11,12,13,14,15,16,17,18,19 / 10 => 1,1,1,1,1,1,1,1,1,1,1 => 모든 값 일치
		
		// 위의 상황에서 cntPerPage를 곱하게 되면 현재 블록의 이전 마지막 max 페이지가 나오게 됨
		// 0 => 0 , 1 => 10, 2 => 20
		// 이 상황에서 +1을 하게 되면 해당 블록의 첫번째 페이지가 나옴
		// 0 => 1 , 1 => 11, 2 => 21
		this.startPage = ((this.nowPage - 1)/this.cntPerBlock)*this.cntPerBlock+1;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage() {
		// 현재 페이지에서 -1 을 하게 되면 현재 나누려는 수의 묶이 벗어나지 않음
		// 예를들어 한 블럭 내에 보여줄 페이지가 10개라고 한다면
		// 1,2,3,4,5,6,7,8,9,10  -1  => 0,1,2,3,4,5,6,7,8,9
		// 0,1,2,3,4,5,6,7,8,9 / 10 => 0,0,0,0,0,0,0,0,0,0 => 모든 값 일치
				
		// 11,12,13,14,15,16,17,18,19,20 -1 => 10,11,12,13,14,15,16,17,18,19
		// 10,11,12,13,14,15,16,17,18,19 / 10 => 1,1,1,1,1,1,1,1,1,1,1 => 모든 값 일치
				
		// 위의 상황에서 cntPerPage를 곱하게 되면 현재 블록의 이전 마지막 max 페이지가 나오게 됨
		// 0 => 0 , 1 => 10, 2 => 20
		// 이 상황에서 +[블럭당 페이지]을 하게 되면 해당 블록의 마지막 페이지가 나옴
		// 0 => 10 , 1 => 20, 2 => 30
		this.endPage = ((this.nowPage - 1)/this.cntPerBlock)*this.cntPerBlock+this.cntPerBlock;
		// 만약에 endPage가 total보다 크다면 endPage를 total페이지로 바꾼다
		this.endPage = (this.totalPage < this.endPage)?this.totalPage:this.endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage() {
		// 토탈 페이지는 row의 갯수가 페이지당 보여줄 row의 갯수와 나눴을 때 딱 떨어지느냐 아니냐로 구분된다.
		// 총 row 개수가 토탈 페이지와 딱 떨어질 경우 [총 row의 갯수]/[페이지당 row의 갯수] 에 대한 결과가 된다.
		// 하지만 row의 개수가 딱 나눠 떨어지지 앟으면 나머지 row도 보여야 하므로 식은
		//  [총 row의 개수]/[페이지당 row의 개수] + 1 이 된다.
		this.totalPage = (this.totalRow%this.cntPerPage==0)?
				(this.totalRow/this.cntPerPage):(this.totalRow/this.cntPerPage+1);
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow() {
		// 시작 row는 현재 페이지에서 보여질 첫 row 이므로 공식은
		// 현재 페이지의 - 1을 한 데이터부터 출발하게 된다. 즉 각 페이지가 아래와 같을 대 연산 결과는
		// 1,2,3,4,5,6,7,8,9 -1 => 0,1,2,3,4,5,6,7,8
		// 여기에 한 페이지당 출력할 row의 개수를 곱하게 되면 이전 페이지의 마지막 row가 나온다.
		// 가령 예를들어 한 페이지당 출력할 row의 개수가 10이라고 가정한다면
		// 0,1,2,3,4,5,6,7,8 *10 => 0,10,20,30,40,50,60,70,80
		// 여기에 +1 을 하게 되면 현재 페이지의 시작 row가 나오게 된다.
		// 0,10,20,30,40,50,60,70,80 +1 => 1,11,21,31,41,51,61,71,81
		this.startRow = ((this.nowPage-1)*this.cntPerPage+1)-1;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow() {
		// 끝 row는 현재 페이지에서 보여질 마지막 row 이므로 공식은
		// 현재 페이지의 - 1을 한 데이터부터 출발하게 된다. 즉 각 페이지가 아래와 같을 대 연산 결과는
		// 1,2,3,4,5,6,7,8,9 -1 => 0,1,2,3,4,5,6,7,8
		// 여기에 한 페이지당 출력할 row의 개수를 곱하게 되면 이전 페이지의 마지막 row가 나온다.
		// 가령 예를들어 한 페이지당 출력할 row의 개수가 10이라고 가정한다면
		// 0,1,2,3,4,5,6,7,8 *10 => 0,10,20,30,40,50,60,70,80
		// 여기에 한 페이지당 출력할 row의 개수를 더하게 되면 현재 페이지의 끝 row가 나오게 된다.
		// 0,10,20,30,40,50,60,70,80 +10 => 10,20,30,40,50,60,70,80,90
		// 주의할 점은 endRow는 totalRow를 넘지 않으므로 만약 endRow가 totalRow를 넘을 경우
		// 해당 값은 totalRow로 대체된다.
		int init = (this.nowPage-1)*this.cntPerPage+this.cntPerPage;
		this.endRow = (init > this.totalRow)?this.totalRow:init;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getCntPerBlock() {
		return cntPerBlock;
	}

	public void setCntPerBlock(int cntPerBlock) {
		this.cntPerBlock = cntPerBlock;
	}
	
	public void process() {
		this.setTotalPage();
		this.setStartPage();
		this.setEndPage();
		this.setStartRow();
		this.setEndRow();
		this.setTitle(title);
		this.setContent(content);
		this.setCategory(category);
		this.setOwner(owner);

	}

	@Override
	public String toString() {
		return "PageVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage="
				+ totalPage + ", totalRow=" + totalRow + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", cntPerPage=" + cntPerPage + ", cntPerBlock=" + cntPerBlock + "]";
	}

	
	
	
}




