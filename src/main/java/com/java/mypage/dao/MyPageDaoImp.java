package com.java.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;
import com.java.order.dto.OrderDto;

@Component
public class MyPageDaoImp implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberDto readMypage(String id) {		
		return sqlSessionTemplate.selectOne("dao.MyPageMapper.readMypage",id);
	}

	@Override
	public int update(MemberDto memberDto) {
		return sqlSessionTemplate.update("dao.MyPageMapper.update",memberDto);
	}

	@Override
	public List<OrderDto> DeliverList(String member_id) {
		return sqlSessionTemplate.selectList("dao.MyPageMapper.readDeliver",member_id);
	}

}
