package org.zerock.domain;

import lombok.Getter;

@Getter
public class PageDTO {
	// private int pageNum;
	// private int amount;
	private Criteria cri;

	private int startPage;
	private int endPage;

	private boolean prev;
	private boolean next;

	private int total;

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		
		int current = cri.getPageNum();
		int numPerPage = cri.getAmount();

		this.endPage = ((current - 1) / 10 + 1) * 10;
		this.startPage = endPage - 9;
		
		// 가장 마지막 페이지
		int realEnd = total / numPerPage;
		
		if (total % numPerPage != 0) {
			realEnd = realEnd + 1;
		}
		
		// '마지막 페이지'와 '가장 마지막 페이지' 비교
		this.endPage = Math.min(endPage, realEnd);
		
		// 이전, 다음 버튼 표시 여부
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
