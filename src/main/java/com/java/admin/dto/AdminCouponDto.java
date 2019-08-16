package com.java.admin.dto;



/**
 * @author 최선권
 * @date 2019.08.14
 * @description 자동쿠폰생성DTO
 */ 

public class AdminCouponDto {

	private String 	admin_couponNumber;  			//관리자쿠폰번호
	private String 	admin_couponName; 				//관리자 쿠폰이름
	private String 	admin_couponeUseday;			//관리자쿠폰사용기간
	private String 	admin_content;					//관리자쿠폰내용

	private double 	admin_sale;						//관리자쿠폰한인율

	public String getAdmin_couponNumber() {
		return admin_couponNumber;
	}

	public void setAdmin_couponNumber(String admin_couponNumber) {
		this.admin_couponNumber = admin_couponNumber;
	}

	public String getAdmin_couponName() {
		return admin_couponName;
	}

	public void setAdmin_couponName(String admin_couponName) {
		this.admin_couponName = admin_couponName;
	}

	public String getAdmin_couponeUseday() {
		return admin_couponeUseday;
	}

	public void setAdmin_couponeUseday(String admin_couponeUseday) {
		this.admin_couponeUseday = admin_couponeUseday;
	}

	public String getAdmin_content() {
		return admin_content;
	}

	public void setAdmin_content(String admin_content) {
		this.admin_content = admin_content;
	}

	public double getAdmin_sale() {
		return admin_sale;
	}

	public void setAdmin_sale(double admin_sale) {
		this.admin_sale = admin_sale;
	}

	@Override
	public String toString() {
		return "AdminCouponDto [admin_couponNumber=" + admin_couponNumber + ", admin_couponName=" + admin_couponName
				+ ", admin_couponeUseday=" + admin_couponeUseday + ", admin_content=" + admin_content + ", admin_sale="
				+ admin_sale + "]";
	}
}
