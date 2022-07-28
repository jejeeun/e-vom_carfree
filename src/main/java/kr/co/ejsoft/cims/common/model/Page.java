package kr.co.ejsoft.cims.common.model;

import java.util.List;

/**
 * User: Naeyoung Kim
 * Date: 2018-11-26
 */
public class Page<T> {
	private static final int DEFAULT_PAGE_SIZE = 10;
	private static final int DEFAULT_RECORD_SIZE = 10;
	private int totalRecordCount;
	private int pageSize;
	private int recordSize;
	private int currentPageNo = 1;
	private int firstPageNo;
	private int lastPageNo;
	private List<T> pageList;

	public Page(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
		this.recordSize = DEFAULT_RECORD_SIZE;
		this.pageSize = DEFAULT_PAGE_SIZE;
	}

	public Page(int totalRecordCount, int recordSize) {
		this.totalRecordCount = totalRecordCount;
		this.recordSize = recordSize == 0 ? DEFAULT_RECORD_SIZE : recordSize;
		this.pageSize = DEFAULT_PAGE_SIZE;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public int getTotalPageCount() {
		return (int) Math.ceil((double)totalRecordCount / (double)recordSize);
	}

	public int getPageSize() {
		if(pageSize == 0) {
			pageSize = DEFAULT_PAGE_SIZE;
		}
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo > getTotalPageCount() ? getTotalPageCount() : currentPageNo;
	}

	public int getFirstRecordNo() {
		int firstRecordNo = (currentPageNo - 1) * recordSize;
		return firstRecordNo >= 0 ? firstRecordNo : 0;
	}

	public int getLastRecordNo() {
		int lastRecordNo = (currentPageNo - 1) * recordSize + recordSize - 1;
		return lastRecordNo <= totalRecordCount - 1 ? lastRecordNo : totalRecordCount - 1;
	}

	public int getFirstPageNo() {
		if(lastPageNo == getTotalPageCount()) {
			firstPageNo = lastPageNo - pageSize + 1;
		} else {
			firstPageNo = ((currentPageNo - 1) / pageSize) * pageSize + 1;
		}
		return firstPageNo > 0 ? firstPageNo : 1 ;
	}

	public int getLastPageNo() {
		lastPageNo = firstPageNo + pageSize - 1;
		if(lastPageNo >= getTotalPageCount()) {
			lastPageNo = getTotalPageCount();
		}
		return lastPageNo;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

	public List<T> getPageList() {
		return pageList;
	}
}
