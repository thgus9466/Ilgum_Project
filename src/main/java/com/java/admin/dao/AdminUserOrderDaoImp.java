package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminQuestionDto;
import com.java.order.dto.UserOrderDto;


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
	public List<UserOrderDto> OrderList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminUserOrderMapper.OrderList", hMap);
	}

	@Override
	public List<UserOrderDto> OrderSearchList(String searchType, String keyword, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminUserOrderMapper.OrderSearchList", hMap);
	}


}
