package com.java.admin.dto;



/**
 * @author 최선권
 * @date 2019.08.08
 * @description 관리자 도서관리 시스템 DB 연동 DTO
 */ 

public class AdminBookDto {

	private String book_isbn;  			//도서코드
	private String book_name;			//도서명
	private String book_writer;			//저자
	private String book_category; 		//분류
	private String book_publisher;		//출판사
	private String book_index;			//도서목차
	private String book_intro;			//도서소개 
	private String book_img_url;		//도서 이미지
	private String book_imgxl_url;		//도서 이미지(Xl)
	private String book_buy_accept; 	//구매가능여부
	
	private int book_cost;				//도서원가
	private int book_price;				//도서가격
	private int book_star; 				//도서평점
	private int book_amount; 			//도서 판매량

	private String book_publish_date;	//출판일
	//(String 으로 처리하여 웹표시는 jsp에서 포멧으로 처리해줌 
	//DB Insert시에는 따로 처리할 내용 없음)
	//jsp로 내용 표기시 2012년 이전의 DATE들은 시간까지 표시를 해야함에 따라 포멧셋팅을 시간까지 함께 넣어줬음
	
	
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



	public String getBook_buy_accept() {
		return book_buy_accept;
	}



	public void setBook_buy_accept(String book_buy_accept) {
		this.book_buy_accept = book_buy_accept;
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



	public int getBook_star() {
		return book_star;
	}



	public void setBook_star(int book_star) {
		this.book_star = book_star;
	}



	public int getBook_amount() {
		return book_amount;
	}



	public void setBook_amount(int book_amount) {
		this.book_amount = book_amount;
	}



	public String getBook_publish_date() {
		return book_publish_date;
	}



	public void setBook_publish_date(String book_publish_date) {
		this.book_publish_date = book_publish_date;
	}



	@Override
	public String toString() {
		return "BookDto [book_isbn=" + book_isbn + ", book_name=" + book_name + ", book_writer=" + book_writer
				+ ", book_category=" + book_category + ", book_publisher=" + book_publisher + ", book_index="
				+ book_index + ", book_intro=" + book_intro + ", book_img_url=" + book_img_url + ", book_imgxl_url="
				+ book_imgxl_url + ", book_buy_accept=" + book_buy_accept + ", book_cost=" + book_cost + ", book_price="
				+ book_price + ", book_star=" + book_star + ", book_amount=" + book_amount + ", book_publish_date="
				+ book_publish_date + "]";
	}

	
}
