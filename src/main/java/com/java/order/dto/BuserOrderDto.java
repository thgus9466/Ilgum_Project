package com.java.order.dto;


/**
 * @author 최선권
 * @Date 2019-08-18
 * @description: 비회원 주문DTO
 */
public class BuserOrderDto {
	private int order_bunho;						//주문번호
	private int order_book_count;					//주문수량
	private int order_total_price;					//총 주문금액

	private String book_isbn;						//도서번호
	private String book_name;						//도서명
	private String order_zipcode;					//우편번호
	private String order_book_user_address1;		//집주소
	private String order_book_user_address2;		//집 상세주소
	private String order_book_user_number;			//핸드폰번호
	private String order_book_state;				//처리상태
	private String order_date;						//주문날짜
	
	
	public BuserOrderDto() {}
	
	public int getOrder_bunho() {
		return order_bunho;
	}
	public void setOrder_bunho(int order_bunho) {
		this.order_bunho = order_bunho;
	}
	public int getOrder_book_count() {
		return order_book_count;
	}
	public void setOrder_book_count(int order_book_count) {
		this.order_book_count = order_book_count;
	}
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getOrder_zipcode() {
		return order_zipcode;
	}
	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}
	public String getOrder_book_user_address1() {
		return order_book_user_address1;
	}
	public void setOrder_book_user_address1(String order_book_user_address1) {
		this.order_book_user_address1 = order_book_user_address1;
	}
	public String getOrder_book_user_address2() {
		return order_book_user_address2;
	}
	public void setOrder_book_user_address2(String order_book_user_address2) {
		this.order_book_user_address2 = order_book_user_address2;
	}
	public String getOrder_book_user_number() {
		return order_book_user_number;
	}
	public void setOrder_book_user_number(String order_book_user_number) {
		this.order_book_user_number = order_book_user_number;
	}
	public String getOrder_book_state() {
		return order_book_state;
	}
	public void setOrder_book_state(String order_book_state) {
		this.order_book_state = order_book_state;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	@Override
	public String toString() {
		return "BuserOrderDto [order_bunho=" + order_bunho + ", order_book_count=" + order_book_count
				+ ", order_total_price=" + order_total_price + ", book_isbn=" + book_isbn + ", book_name=" + book_name
				+ ", order_zipcode=" + order_zipcode + ", order_book_user_address1=" + order_book_user_address1
				+ ", order_book_user_address2=" + order_book_user_address2 + ", order_book_user_number="
				+ order_book_user_number + ", order_book_state=" + order_book_state + ", order_date=" + order_date
				+ ", getOrder_bunho()=" + getOrder_bunho() + ", getOrder_book_count()=" + getOrder_book_count()
				+ ", getOrder_total_price()=" + getOrder_total_price() + ", getBook_isbn()=" + getBook_isbn()
				+ ", getBook_name()=" + getBook_name() + ", getOrder_zipcode()=" + getOrder_zipcode()
				+ ", getOrder_book_user_address1()=" + getOrder_book_user_address1()
				+ ", getOrder_book_user_address2()=" + getOrder_book_user_address2() + ", getOrder_book_user_number()="
				+ getOrder_book_user_number() + ", getOrder_book_state()=" + getOrder_book_state()
				+ ", getOrder_date()=" + getOrder_date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

}
