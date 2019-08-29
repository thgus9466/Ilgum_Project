package com.java.order.dao;

import com.java.order.dto.OrderDto;

public interface OrderDao {
	
	public OrderDto oneBookOrder(String book_isbn);
	
	public int buserOrderOk(OrderDto orderDto);
	
	public int getPoint(String member_id);
}
