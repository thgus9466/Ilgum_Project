package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminCouponDto;


/**
 * @author 최선권
 * @date 2019.08.14
 * @description 쿠폰Dao
 */ 


public interface AdminCouponDao {
	
	//버튼 클릭시 쿠폰생성 
	public int couponAutoCreate(AdminCouponDto couponDto);
	
	//생성된 쿠폰을 새로가입한 회원에게 자동등록
	public int couponAndMemberInsert(String admin_couponNumber, String member_id, String member_couponNumber, String couponState);

	public int couponCount(String member_id);

	public List<AdminCouponDto> CouponList(String member_id);
	public int updateCouponCount(String member_id, String couponUseday);
}
