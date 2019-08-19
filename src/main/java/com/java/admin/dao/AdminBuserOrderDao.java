package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminBookDto;
import com.java.order.dto.BuserOrderDto;
import com.java.order.dto.UserOrderDto;



/**
 * @author 최선권
 * @date 2019.08.18
 * @description 관리자 주문관리 시스템 Dao
 */ 


public interface AdminBuserOrderDao {

	//상담문의조회 카운터
	public int OrderSearchCount(String searchType, String keyword);	
	public int OrderCount();
	
	//상담조회 목록
	public List<BuserOrderDto> OrderList(int startRow, int endRow);
	public List<BuserOrderDto> OrderSearchList(String searchType, String keyword, int startRow, int endRow);
	
	
	public BuserOrderDto userOrderRead(int order_bunho);

	public AdminBookDto bookInfo(String book_isbn);
	
	public int userOrderUpdateOk(BuserOrderDto buserOrderDto);

	public int userOrderDelete(int order_bunho);
	
}
