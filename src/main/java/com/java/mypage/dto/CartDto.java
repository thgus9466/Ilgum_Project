package com.java.mypage.dto;

public class CartDto {
	private int cart_num;		// 장바구니 번호
	private String member_id;	// 아이디
	private String book_isbn;	// 도서번호
	private int cart_quantity;	// 수량
	
	private String book_name;
	private int book_price;
	private String book_img_url;
	
	public CartDto() {}

	public CartDto(int cart_num, String member_id, String book_isbn, int cart_quantity, String book_name,
			int book_price, String book_img_url) {
		super();
		this.cart_num = cart_num;
		this.member_id = member_id;
		this.book_isbn = book_isbn;
		this.cart_quantity = cart_quantity;
		this.book_name = book_name;
		this.book_price = book_price;
		this.book_img_url = book_img_url;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
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

	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
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

	@Override
	public String toString() {
		return "CartDto [cart_num=" + cart_num + ", member_id=" + member_id + ", book_isbn=" + book_isbn
				+ ", cart_quantity=" + cart_quantity + ", book_name=" + book_name + ", book_price=" + book_price
				+ ", book_img_url=" + book_img_url + "]";
	}
	
}
