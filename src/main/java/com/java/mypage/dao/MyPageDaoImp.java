package com.java.mypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;

@Component
public class MyPageDaoImp implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberDto readMypage(String id) {		
		return sqlSessionTemplate.selectOne("dao.MyPageMapper.readMypage",id);
	}

}
