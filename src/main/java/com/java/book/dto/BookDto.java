package com.java.book.dto;

import java.sql.Date;

public class BookDto {
	private int num;
	private String book_isbn;
	private String book_index;
	private String book_intro;
	private Date book_publish_date;
	private String book_name;
	private String book_writer;
	private String book_category;
	private String book_publisher;
	private int book_cost;
	private int book_price;
	private String book_img_url;
	private String book_imgxl_url;
	private int book_star;
	private String book_buy_accept;
	private int book_amount;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_index() {
		return book_index;
	}
	public void setBook_index(String book_index) {
		this.book_index = book_index;
	}

	public String getBook_intro() {
		return book_intro;
	}
	public void setBook_intro(String book_intro) {
		this.book_intro = book_intro;
	}

	public Date getBook_publish_date() {
		return book_publish_date;
	}
	public void setBook_publish_date(Date book_publish_date) {
		this.book_publish_date = book_publish_date;
	}

	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public String getBook_category() {
		return book_category;
	}
	public void setBook_category(String book_category) {
		this.book_category = book_category;
	}
	
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	
	public int getBook_cost() {
		return book_cost;
	}
	public void setBook_cost(int book_cost) {
		this.book_cost = book_cost;
	}

	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public String getBook_img_url() {
		return book_img_url;
	}
	public void setBook_img_url(String book_img_url) {
		this.book_img_url = book_img_url;
	}
	
	public String getBook_imgxl_url() {
		return book_imgxl_url;
	}
	public void setBook_imgxl_url(String book_imgxl_url) {
		this.book_imgxl_url = book_imgxl_url;
	}

	public int getBook_star() {
		return book_star;
	}
	public void setBook_star(int book_star) {
		this.book_star = book_star;
	}

	public String getBook_buy_accept() {
		return book_buy_accept;
	}
	public void setBook_buy_accept(String book_buy_accept) {
		this.book_buy_accept = book_buy_accept;
	}

	public int getBook_amount() {
		return book_amount;
	}
	public void setBook_amount(int book_amount) {
		this.book_amount = book_amount;
	}

	@Override
	public String toString() {
		return "BookDto [book_isbn=" + book_isbn + ", book_index=" + book_index + ", book_intro=" + book_intro
				+ ", book_publish_date=" + book_publish_date + ", book_name=" + book_name + ", book_writer="
				+ book_writer + ", book_category=" + book_category + ", book_publisher=" + book_publisher
				+ ", book_cost=" + book_cost + ", book_price=" + book_price + ", book_img_url=" + book_img_url
				+ ", book_imgxl_url=" + book_imgxl_url + ", book_star=" + book_star + ", book_buy_accept="
				+ book_buy_accept + ", book_amount=" + book_amount + "]";
	}
}
