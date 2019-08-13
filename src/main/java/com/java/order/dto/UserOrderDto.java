package com.java.order.dto;

public class UserOrderDto {
	private int order_bunho;
	private String member_id;
	private String book_isbn;
	private int order_book_count;
	private String order_zipcode;
	private String order_book_user_address1;
	private String order_book_user_address2;
	private String order_book_user_phone;
	private int order_book_point;
	private String order_user_coupon_name;
	private int order_user_coupon_discount;
	private char order_book_state;
	private char order_book_charge;
	private String order_date;
	private int order_total_price;
	
	private String book_name;
	
	public UserOrderDto() {
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

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public int getOrder_book_count() {
		return order_book_count;
	}
	public void setOrder_book_count(int order_book_count) {
		this.order_book_count = order_book_count;
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

	public String getOrder_book_user_phone() {
		return order_book_user_phone;
	}
	public void setOrder_book_user_phone(String order_book_user_phone) {
		this.order_book_user_phone = order_book_user_phone;
	}

	public int getOrder_book_point() {
		return order_book_point;
	}
	public void setOrder_book_point(int order_book_point) {
		this.order_book_point = order_book_point;
	}

	public String getOrder_user_coupon_name() {
		return order_user_coupon_name;
	}
	public void setOrder_user_coupon_name(String order_user_coupon_name) {
		this.order_user_coupon_name = order_user_coupon_name;
	}

	public int getOrder_user_coupon_discount() {
		return order_user_coupon_discount;
	}
	public void setOrder_user_coupon_discount(int order_user_coupon_discount) {
		this.order_user_coupon_discount = order_user_coupon_discount;
	}

	public char getOrder_book_state() {
		return order_book_state;
	}
	public void setOrder_book_state(char order_book_state) {
		this.order_book_state = order_book_state;
	}

	public char getOrder_book_charge() {
		return order_book_charge;
	}
	public void setOrder_book_charge(char order_book_charge) {
		this.order_book_charge = order_book_charge;
	}

	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}

	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	@Override
	public String toString() {
		return "UserOrderDto [order_bunho=" + order_bunho + ", member_id=" + member_id + ", book_isbn=" + book_isbn
				+ ", order_book_count=" + order_book_count + ", order_zipcode=" + order_zipcode
				+ ", order_book_user_address1=" + order_book_user_address1 + ", order_book_user_address2="
				+ order_book_user_address2 + ", order_book_user_phone=" + order_book_user_phone + ", order_book_point="
				+ order_book_point + ", order_user_coupon_name=" + order_user_coupon_name
				+ ", order_user_coupon_discount=" + order_user_coupon_discount + ", order_book_state="
				+ order_book_state + ", order_book_charge=" + order_book_charge + ", order_date=" + order_date
				+ ", order_total_price=" + order_total_price + ", book_name=" + book_name + "]";
	}
	
	

	
}
