package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminBookDto;
import com.java.admin.dto.AdminMemberDto;
import com.java.order.dto.OrderDto;


/**
 * @author 최선권
 * @date 2019.08.18
 * @description 관리자 주문관리시스템 DAO implement
 */ 

@Component
public class AdminUserOrderDaoImp implements AdminUserOrderDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int OrderCount() {
		return sqlSessionTemplate.selectOne("dao.AdminUserOrderMapper.OrderCount");
	}

	@Override
	public int OrderSearchCount(String searchType, String keyword) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		return sqlSessionTemplate.selectOne("dao.AdminUserOrderMapper.OrderSearchCount", hMap);
	}

	@Override
	public List<OrderDto> OrderList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminUserOrderMapper.OrderList", hMap);
	}

	@Override
	public List<OrderDto> OrderSearchList(String searchType, String keyword, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminUserOrderMapper.OrderSearchList", hMap);
	}

	@Override
	public OrderDto userOrderRead(int order_bunho) {
		return sqlSessionTemplate.selectOne("dao.AdminUserOrderMapper.userOrderRead", order_bunho);
		}

	@Override //회원정보를 가져올거라 회원정보가 담겨져있는 맵퍼에서 셀렉트 함.
	public AdminMemberDto userInfo(String member_id) {
		return sqlSessionTemplate.selectOne("dao.AdminMemberMapper.MemberRead", member_id);
		}

	@Override
	public AdminBookDto bookInfo(String book_isbn) {
		return sqlSessionTemplate.selectOne("dao.AdminBookMapper.bookReadNumber", book_isbn);
		}
	public int userOrderUpdateOk(OrderDto userOrderDto) {
		return sqlSessionTemplate.update("dao.AdminUserOrderMapper.userOrderUpdateOk", userOrderDto);
	}

	@Override
	public int userOrderDelete(int order_bunho) {
		return sqlSessionTemplate.delete("dao.AdminUserOrderMapper.userOrderDelete", order_bunho);
	}
}
