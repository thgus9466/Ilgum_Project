package com.java.order.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminCouponDto;
import com.java.order.dto.OrderDto;

@Component
public class OrderDaoImp implements OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public OrderDto oneBookOrder(String book_isbn) {
		return sqlSessionTemplate.selectOne("dao.OrderMapper.oneBookOrder", book_isbn);
	}

	@Override
	public int buserOrderOk(OrderDto orderDto) {
		return sqlSessionTemplate.insert("dao.OrderMapper.buserOrder", orderDto);
	}
	
	@Override
	public int getPoint(String member_id) {
		return sqlSessionTemplate.selectOne("dao.OrderMapper.getPoint", member_id);
	}
	
	@Override
	public List<AdminCouponDto> getCoupon(String member_id) {
		return sqlSessionTemplate.selectList("dao.OrderMapper.getCoupon", member_id);
	}
	
	@Override
	public String couponRate(String admin_couponNumber) {
		return sqlSessionTemplate.selectOne("dao.OrderMapper.couponRate", admin_couponNumber);
	}
	
	@Override
	public String getMember_couponNumber(String member_id, String admin_couponnumber) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("member_id", member_id);
		hMap.put("admin_couponnumber", admin_couponnumber);
		
		return sqlSessionTemplate.selectOne("dao.OrderMapper.getMember_couponNumber", hMap);
	}
	
	@Override
	public void updateCouponState(String member_id, String member_couponnumber) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("member_id", member_id);
		hMap.put("member_couponnumber", member_couponnumber);
		
		sqlSessionTemplate.update("dao.OrderMapper.updateCouponState", hMap);
	}
	
	@Override
	public void setMember_point(String member_id, int member_point) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("member_id", member_id);
		hMap.put("member_point", member_point);
		
		sqlSessionTemplate.update("dao.OrderMapper.setMember_point", hMap);
	}
	
	@Override
	public int userOrderOk(OrderDto orderDto) {
		return sqlSessionTemplate.insert("dao.OrderMapper.userOrderOk", orderDto);
	}
}
