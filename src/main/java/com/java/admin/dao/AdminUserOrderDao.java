package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminBookDto;
import com.java.admin.dto.AdminMemberDto;
import com.java.admin.dto.AdminQuestionDto;
import com.java.order.dto.OrderDto;



/**
 * @author 최선권
 * @date 2019.08.18
 * @description 관리자 주문관리 시스템 Dao
 */ 


public interface AdminUserOrderDao {

	//상담문의조회 카운터
	public int OrderSearchCount(String searchType, String keyword);	
	public int OrderCount();
	
	//상담조회 목록
	public List<OrderDto> OrderList(int startRow, int endRow);
	public List<OrderDto> OrderSearchList(String searchType, String keyword, int startRow, int endRow);
	
	
	public OrderDto userOrderRead(int order_bunho);

	public AdminMemberDto userInfo(String member_id);

	public AdminBookDto bookInfo(String book_isbn);
	
	public int userOrderUpdateOk(OrderDto userOrderDto);
	public int userOrderDelete(int order_bunho);
	
}
