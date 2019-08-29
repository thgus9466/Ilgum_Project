package com.java.admin.dto;



/**
 * @author 최선권
 * @date 2019.08.16
 * @description 유저쿠폰DTO
 */ 

public class MemberCouponDto {

	String member_couponNumber;			//쿠폰번호 PK
	String member_id;					//아이디 member table member_id FK (FK ID: member_id_fk)
	String admin_couponNumber;			//관리자쿠폰번호  admincoupon table admin_couponNumber FK (FK ID: admin_couponNumber_fk)
	String couponState;					//쿠폰 사용유무
	
	
	public String getCouponState() {
		return couponState;
	}



	public void setCouponState(String couponState) {
		this.couponState = couponState;
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



	public String getAdmin_couponNumber() {
		return admin_couponNumber;
	}



	public void setAdmin_couponNumber(String admin_couponNumber) {
		this.admin_couponNumber = admin_couponNumber;
	}



	@Override
	public String toString() {
		return "MemberCouponDto [member_couponNumber=" + member_couponNumber + ", member_id=" + member_id
				+ ", admin_couponNumber=" + admin_couponNumber + ", couponState=" + couponState + "]";
	}
	
}
