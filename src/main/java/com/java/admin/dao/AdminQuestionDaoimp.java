package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminQuestionDto;


/**
 * @author 최선권
 * @date 2019.08.12
 * @description 관리자 상담문의관리시스템 DAO implement
 */ 

@Component
public class AdminQuestionDaoimp implements AdminQuestionDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int QuestionCount() {
//		System.out.println(sqlSessionTemplate.selectOne("dao.AdminQuestionMapper.QuestionCount"));
		return sqlSessionTemplate.selectOne("dao.AdminQuestionMapper.QuestionCount");
	}

	@Override
	public int QuestionSearchCount(String searchType, String keyword) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		return sqlSessionTemplate.selectOne("dao.AdminQuestionMapper.QuestionSearchCount", hMap);
	}

	@Override
	public List<AdminQuestionDto> QuestionList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminQuestionMapper.QuestionList", hMap);
	}

	@Override
	public List<AdminQuestionDto> QuestionSearchList(String searchType, String keyword, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminQuestionMapper.QuestionSearchList", hMap);
	}

	@Override
	public AdminQuestionDto QuestionRead(int q_number) {
			return sqlSessionTemplate.selectOne("dao.AdminQuestionMapper.QuestionRead",q_number);
		}

	@Override
	public int QuestionReply(AdminQuestionDto questionDto) {
		return sqlSessionTemplate.update("dao.AdminQuestionMapper.QuestionUpdate",questionDto);
	}

	@Override
	public AdminQuestionDto QuestionSelect(int q_number, String member_id) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("q_number", q_number);
		hMap.put("member_id", member_id);
		
		return sqlSessionTemplate.selectOne("dao.AdminQuestionMapper.QuestionSelect",hMap);
	}
		




}
