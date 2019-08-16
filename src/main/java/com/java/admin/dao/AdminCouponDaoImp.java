package com.java.admin.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminCouponDto;


/**
 * @author 최선권
 * @date 2019.08.14
 * @description 관리자 회원관리 시스템 DAO implement
 */ 

@Component
public class AdminCouponDaoImp implements AdminCouponDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int couponAutoCreate(AdminCouponDto couponDto) {
		return sqlSessionTemplate.insert("dao.AdminCouponMapper.couponAutoCreateInsert", couponDto);
	}

	@Override
	public int couponAndMemberInsert(String admin_couponNumber, String member_id, String member_couponNumber) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("admin_couponNumber", admin_couponNumber);
		hMap.put("member_id", member_id);
		hMap.put("member_couponNumber", member_couponNumber);
		return sqlSessionTemplate.insert("dao.MemberCouponMapper.couponAndMemberInsert", hMap);
		
	}
}
