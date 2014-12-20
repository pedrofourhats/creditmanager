package com.creditmanager.model;

import java.util.List;

public class Page<T> {
	
	private List<T> elements;
	
	private int pageIndex;
	
	private int pageSize;
	
	private Integer totalItems;
	
	private int totalPages;

	public Page(List<T> elements, int pageIndex, int pageSize, Integer totalItems){
		this.elements = elements;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.totalItems = totalItems;
		this.setTotalPages(this.calculateTotalPages());
	}
	
	public List<T> getElements() {
		return elements;
	}

	public void setElements(List<T> elements) {
		this.elements = elements;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(Integer totalItems) {
		this.totalItems = totalItems;
	}

	public int getTotalPages() {
		return totalPages;
	}
	
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	private int calculateTotalPages() {
		if(totalItems == 0){
			return 1;
		}
		
		int pages = (totalItems / pageSize) + 1;
		if(totalItems % pageSize == 0){
			return pages - 1;
		} else {
			return pages;
		}
	}
}
