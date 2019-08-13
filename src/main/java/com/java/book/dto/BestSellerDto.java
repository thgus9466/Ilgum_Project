package com.java.book.dto;

public class BestSellerDto {
	private String month;
	private String book1;
	private String book2;
	private String book3;
	
	public BestSellerDto() {
	
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getBook1() {
		return book1;
	}

	public void setBook1(String book1) {
		this.book1 = book1;
	}

	public String getBook2() {
		return book2;
	}

	public void setBook2(String book2) {
		this.book2 = book2;
	}

	public String getBook3() {
		return book3;
	}

	public void setBook3(String book3) {
		this.book3 = book3;
	}

	@Override
	public String toString() {
		return "BookDto [month=" + month + ", book1=" + book1 + ", book2=" + book2 + ", book3=" + book3 + "]";
	}
	
	
	
}
