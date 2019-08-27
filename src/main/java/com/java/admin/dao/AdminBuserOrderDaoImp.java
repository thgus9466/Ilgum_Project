package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminBookDto;
import com.java.admin.dto.AdminMemberDto;
import com.java.admin.dto.AdminQuestionDto;
import com.java.order.dto.BuserOrderDto;


/**
 * @author 최선권
 * @date 2019.08.18
 * @description 관리자 주문관리시스템 DAO implement
 */ 

@Component
public class AdminBuserOrderDaoImp implements AdminBuserOrderDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int OrderCount() {
		return sqlSessionTemplate.selectOne("dao.AdminBuserOrderMapper.OrderCount");
	}

	@Override
	public int OrderSearchCount(String searchType, String keyword) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		return sqlSessionTemplate.selectOne("dao.AdminBuserOrderMapper.OrderSearchCount", hMap);
	}

	@Override
	public List<BuserOrderDto> OrderList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminBuserOrderMapper.OrderList", hMap);
	}

	@Override
	public List<BuserOrderDto> OrderSearchList(String searchType, String keyword, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminBuserOrderMapper.OrderSearchList", hMap);
	}

	@Override
	public BuserOrderDto userOrderRead(int order_bunho) {
		return sqlSessionTemplate.selectOne("dao.AdminBuserOrderMapper.userOrderRead", order_bunho);
		}


	@Override
	public AdminBookDto bookInfo(String book_isbn) {
		return sqlSessionTemplate.selectOne("dao.AdminBookMapper.bookReadNumber", book_isbn);
		}

	@Override
	public int userOrderDelete(int order_bunho) {
		return sqlSessionTemplate.delete("dao.AdminBuserOrderMapper.userOrderDelete", order_bunho);
	}

	@Override
	public int userOrderUpdateOk(BuserOrderDto buserOrderDto) {
		return sqlSessionTemplate.update("dao.AdminBuserOrderMapper.userOrderUpdateOk", buserOrderDto);
		}
}
