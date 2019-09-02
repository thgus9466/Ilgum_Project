package com.java.order.dao;

import java.util.List;

import com.java.admin.dto.AdminCouponDto;
import com.java.order.dto.OrderDto;

public interface OrderDao {
	
	public OrderDto oneBookOrder(String book_isbn);
	
	public int buserOrderOk(OrderDto orderDto);
	
	public int getPoint(String member_id);
	
	public List<AdminCouponDto> getCoupon(String member_id);
	
	public String couponRate(String admin_couponNumber);
	
	public String getMember_couponNumber(String member_id, String admin_couponnumber);
	
	public void updateCouponState(String member_id, String member_couponnumber);
	
	public void setMember_point(String member_id, int member_point);
	
	public int userOrderOk(OrderDto orderDto);
}
