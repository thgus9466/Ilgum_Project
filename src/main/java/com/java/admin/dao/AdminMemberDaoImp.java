package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.java.admin.dto.AdminMemberDto;


/**
 * @author 최선권
 * @date 2019.08.09
 * @description 관리자 회원관리 시스템 DAO implement
 */ 

@Component
public class AdminMemberDaoImp implements AdminMemberDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int MemberCount() {
		return sqlSessionTemplate.selectOne("dao.AdminMemberMapper.MemberCount");
	}

	@Override
	public int MemberSearchCount(String searchType, String keyword) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		return sqlSessionTemplate.selectOne("dao.AdminMemberMapper.MemberSearchCount", hMap);
	}

	@Override
	public List<AdminMemberDto> MemberList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminMemberMapper.MemberList", hMap);
	}

	@Override
	public List<AdminMemberDto> MemberSearchList(String searchType, String keyword, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminMemberMapper.MemberSearchList", hMap);
	}

	@Override
	public AdminMemberDto MemberRead(String member_id) {
			return sqlSessionTemplate.selectOne("dao.AdminMemberMapper.MemberRead",member_id);
		}
		




}
