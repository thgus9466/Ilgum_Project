package com.java.order.dto;

import java.sql.Date;
import java.util.List;

public class NonUserOrderDto {
	private int order_bunho;
	private int order_book_count;
	private String order_zipcode;
	private String order_book_user_address1;
	private String order_book_user_address2;
	private String order_book_user_number;
	private String order_book_state;
	private Date order_date;
	private int order_total_price;
	private String order_name;
	private String order_book_isbn;
	private List<NonUserOrderDto> nonUserList;
	
	public String getOrder_book_isbn() {
		return order_book_isbn;
	}
	public void setOrder_book_isbn(String order_book_isbn) {
		this.order_book_isbn = order_book_isbn;
	}
	
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	
	public List<NonUserOrderDto> getNonUserList() {
		return nonUserList;
	}
	public void setNonUserList(List<NonUserOrderDto> nonUserList) {
		this.nonUserList = nonUserList;
	}
	
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
	
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	
	@Override
	public String toString() {
		return "NonUserOrderDto [order_bunho=" + order_bunho + ", order_book_count=" + order_book_count
				+ ", order_zipcode=" + order_zipcode + ", order_book_user_address1=" + order_book_user_address1
				+ ", order_book_user_address2=" + order_book_user_address2 + ", order_book_user_number="
				+ order_book_user_number + ", order_book_state=" + order_book_state + ", order_date=" + order_date
				+ ", order_total_price=" + order_total_price + ", order_name=" + order_name + ", order_book_isbn="
				+ order_book_isbn + ", nonUserList=" + nonUserList + "]";
	}
}
