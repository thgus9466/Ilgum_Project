package com.java.book.dto;

public class UserBookStar {
	
	private int order_bunho;
	private String member_id;
	private String book_num;
	private String book_review;
	private int userbookstar_star;
	
	public UserBookStar() {
	}

	public int getOrder_bunho() {
		return order_bunho;
	}

	public void setOrder_bunho(int order_bunho) {
		this.order_bunho = order_bunho;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBook_num() {
		return book_num;
	}

	public void setBook_num(String book_num) {
		this.book_num = book_num;
	}

	public String getBook_review() {
		return book_review;
	}

	public void setBook_review(String book_review) {
		this.book_review = book_review;
	}

	public int getUserbookstar_star() {
		return userbookstar_star;
	}

	public void setUserbookstar_star(int userbookstar_star) {
		this.userbookstar_star = userbookstar_star;
	}

	@Override
	public String toString() {
		return "UserBookStar [order_bunho=" + order_bunho + ", member_id=" + member_id + ", book_num=" + book_num
				+ ", book_review=" + book_review + ", userbookstar_star=" + userbookstar_star + "]";
	}

	
	
}
