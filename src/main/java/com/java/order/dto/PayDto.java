package com.java.order.dto;


/**
 * @author 최선권
 *
 */
public class PayDto {

	private String pay_num;		//결제번호
	private String member_id;	//회원아이디(회원,비회원)
	private String receier;		//주문자
	private String product;		//상품명
	private String merchant_uid;//결제일	
	private String pay_method;	//결제방식
	private String pay_pg;		//결제PG

	private int order_num;		//주문번호
	private int total_price;	//총금액
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReceier() {
		return receier;
	}
	public void setReceier(String receier) {
		this.receier = receier;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPay_pg() {
		return pay_pg;
	}
	public void setPay_pg(String pay_pg) {
		this.pay_pg = pay_pg;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	@Override
	public String toString() {
		return "payDto [pay_num=" + pay_num + ", member_id=" + member_id + ", receier=" + receier + ", product="
				+ product + ", merchant_uid=" + merchant_uid + ", pay_method=" + pay_method + ", pay_pg=" + pay_pg
				+ ", order_num=" + order_num + ", total_price=" + total_price + "]";
	}

	
}