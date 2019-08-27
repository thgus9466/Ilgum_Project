package com.java.order.dto;

import java.util.Date;

public class OrderDto {
	private int order_num;						// 주문번호
	private String member_id;					// 아이디
	private String cart_quantity;				// 주문수량[]
	private String member_zipcode;				// 우편번호
	private String member_address1;				// 주소1
	private String member_address2;				// 주소2
	private String member_phone;				// 휴대전화
	private int member_point;					// 적립금
	private String member_user__couponnumber;	// 쿠폰번호
	private char order_state;					// 주문상태
	private char order_charge;					// 결제상태
	private Date order_date;					// 주문일
	private int total_price;					// 총 금액
	private String book_isbn;					// 책 번호[]
	private String request;						// 배송요청사항
	
	private String book_name;					// 책 이름
	private String book_img_url;				// 책 이미지
	private int book_price;						// 책 가격
	
	public OrderDto() {}

	public OrderDto(int order_num, String member_id, String cart_quantity, String member_zipcode,
			String member_address1, String member_address2, String member_phone, int member_point,
			String member_user__couponnumber, char order_state, char order_charge, Date order_date, int total_price,
			String book_isbn, String request, String book_name, String book_img_url, int book_price) {
		super();
		this.order_num = order_num;
		this.member_id = member_id;
		this.cart_quantity = cart_quantity;
		this.member_zipcode = member_zipcode;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.member_phone = member_phone;
		this.member_point = member_point;
		this.member_user__couponnumber = member_user__couponnumber;
		this.order_state = order_state;
		this.order_charge = order_charge;
		this.order_date = order_date;
		this.total_price = total_price;
		this.book_isbn = book_isbn;
		this.request = request;
		this.book_name = book_name;
		this.book_img_url = book_img_url;
		this.book_price = book_price;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(String cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_address2() {
		return member_address2;
	}

	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public String getMember_user__couponnumber() {
		return member_user__couponnumber;
	}

	public void setMember_user__couponnumber(String member_user__couponnumber) {
		this.member_user__couponnumber = member_user__couponnumber;
	}

	public char getOrder_state() {
		return order_state;
	}

	public void setOrder_state(char order_state) {
		this.order_state = order_state;
	}

	public char getOrder_charge() {
		return order_charge;
	}

	public void setOrder_charge(char order_charge) {
		this.order_charge = order_charge;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_img_url() {
		return book_img_url;
	}

	public void setBook_img_url(String book_img_url) {
		this.book_img_url = book_img_url;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	@Override
	public String toString() {
		return "OrderDto [order_num=" + order_num + ", member_id=" + member_id + ", cart_quantity=" + cart_quantity
				+ ", member_zipcode=" + member_zipcode + ", member_address1=" + member_address1 + ", member_address2="
				+ member_address2 + ", member_phone=" + member_phone + ", member_point=" + member_point
				+ ", member_user__couponnumber=" + member_user__couponnumber + ", order_state=" + order_state
				+ ", order_charge=" + order_charge + ", order_date=" + order_date + ", total_price=" + total_price
				+ ", book_isbn=" + book_isbn + ", request=" + request + ", book_name=" + book_name + ", book_img_url="
				+ book_img_url + ", book_price=" + book_price + "]";
	}
		
}
