package com.java.order.dto;


/**
 * @author 최선권
 * @Date 2019-08-18
 * @description: 비회원 주문DTO
 */
public class BuserOrderDto {
	private int order_bunho;						//주문번호
	private int order_book_count;					//주문수량
	private int order_book_point;
	private int order_user_coupon_discount;
	private int order_total_price;

	private String member_id;						//아이디
	private String book_isbn;						//도서번호
	private String book_name;
	private String order_zipcode;
	private String order_book_user_address1;
	private String order_book_user_address2;
	private String order_book_user_phone;
	private String order_user_coupon_name;
	private String order_book_state;
	private String order_book_charge;
	private String order_date;	

}
