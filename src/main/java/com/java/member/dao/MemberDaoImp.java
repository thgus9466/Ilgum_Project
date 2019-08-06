package com.java.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public String idCheck(String id) {
		return sqlSessionTemplate.selectOne("dao.MemberMapper.memberIdCheck", id);
	}

	@Override
	public int memberInsert(MemberDto memberDto) {
		return sqlSessionTemplate.insert("dao.MemberMapper.memberInsert", memberDto);
	}
	
	@Override
	public String memberLoginOk(HashMap<String, Object> hMap) {
		
		return sqlSessionTemplate.selectOne("dao.MemberMapper.memberLoginOk", hMap);
	}
}
