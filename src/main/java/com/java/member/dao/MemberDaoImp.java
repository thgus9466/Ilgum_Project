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
	
	@Override
	public String memberIdSearchOk(HashMap<String, Object> hMap) {
		
		return sqlSessionTemplate.selectOne("dao.MemberMapper.memberIdSearchOk", hMap);
	}

	@Override
	public String memberPasswordSearchOk(HashMap<String, Object> hMap) {
		
		return sqlSessionTemplate.selectOne("dao.MemberMapper.memberPasswordSearchOk", hMap);
	}

	@Override
	public int memberPasswordNew(HashMap<String, Object> hMap) {

		return sqlSessionTemplate.update("dao.MemberMapper.memberPasswordNew", hMap);
	}
	
	@Override
	public String memberLevel(String member_id) {
		return sqlSessionTemplate.selectOne("dao.MemberMapper.memberLevel",member_id);
	}
}
