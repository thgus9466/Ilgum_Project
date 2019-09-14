package com.java.admin.dto;

/**
 * @author 최선권
 * @date 2019.08.14
 * @description 자동쿠폰생성DTO
 */ 

public class AdminCouponDto {

	private String 	admin_couponNumber;  			//관리자쿠폰번호
	private String 	admin_couponName; 				//관리자 쿠폰이름
	private String 	admin_couponUseday;				//관리자쿠폰사용기간
	private String 	admin_content;					//관리자쿠폰내용
	private String 	member_couponNumber;			//회원쿠폰번호
	private String 	member_id;						//회원아이디
	private double 	admin_sale;						//관리자쿠폰 할인율
	private String couponState;						//쿠폰 사용유무
	
	public AdminCouponDto() { }
	
	public AdminCouponDto(String admin_couponNumber, String admin_couponName, String admin_couponUseday,
			String admin_content, String member_couponNumber, String member_id, double admin_sale, String couponState) {
		super();
		this.admin_couponNumber = admin_couponNumber;
		this.admin_couponName = admin_couponName;
		this.admin_couponUseday = admin_couponUseday;
		this.admin_content = admin_content;
		this.member_couponNumber = member_couponNumber;
		this.member_id = member_id;
		this.admin_sale = admin_sale;
		this.couponState = couponState;
	}

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
	public String getAdmin_couponUseday() {
		return admin_couponUseday;
	}
	public void setAdmin_couponUseday(String admin_couponUseday) {
		this.admin_couponUseday = admin_couponUseday;
	}
	public String getAdmin_content() {
		return admin_content;
	}
	public void setAdmin_content(String admin_content) {
		this.admin_content = admin_content;
	}
	public String getMember_couponNumber() {
		return member_couponNumber;
	}
	public void setMember_couponNumber(String member_couponNumber) {
		this.member_couponNumber = member_couponNumber;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public double getAdmin_sale() {
		return admin_sale;
	}
	public void setAdmin_sale(double admin_sale) {
		this.admin_sale = admin_sale;
	}
	public String getCouponState() {
		return couponState;
	}
	public void setCouponState(String couponState) {
		this.couponState = couponState;
	}

	@Override
	public String toString() {
		return "AdminCouponDto [admin_couponNumber=" + admin_couponNumber + ", admin_couponName=" + admin_couponName
				+ ", admin_couponUseday=" + admin_couponUseday + ", admin_content=" + admin_content
				+ ", member_couponNumber=" + member_couponNumber + ", member_id=" + member_id + ", admin_sale="
				+ admin_sale + ", couponState=" + couponState + "]";
	}

}
