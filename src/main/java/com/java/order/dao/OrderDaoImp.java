package com.java.order.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.book.dto.BookDto;
import com.java.member.dto.MemberDto;
import com.java.order.dto.BuserOrderDto;
import com.java.order.dto.NonUserOrderDto;

@Component
public class OrderDaoImp implements OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public NonUserOrderDto nonMemberOrder(String book_isbn) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.OrderMapper.nonMemberOrder", book_isbn);
	}

	@Override
	public List<BookDto> oneBookOrder(String book_isbn) {
		
		return sqlSessionTemplate.selectList("dao.OrderMapper.nonMemberOrder", book_isbn);
	}

	@Override
	public int orderLogin(String member_id, String member_password) {
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("member_id", member_id);
		hMap.put("member_password", member_password);
		
		return sqlSessionTemplate.selectOne("dao.OrderMapper.memOrderLogin", hMap);
	}

	@Override
	public List<BookDto> memberBook(String book_isbn) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.OrderMapper.memberBook", book_isbn);
	}

	@Override
	public MemberDto selectMember(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.OrderMapper.selectMember", member_id);
	}

}
