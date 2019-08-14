package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminQuestionDto;



/**
 * @author 최선권
 * @date 2019.08.12
 * @description 관리자 상담관리 시스템 Dao
 */ 


public interface AdminQuestionDao {
	
	//상담문의조회 카운터
	public int QuestionSearchCount(String searchType, String keyword);	
	public int QuestionCount();
	
	//상담조회 목록
	public List<AdminQuestionDto> QuestionList(int startRow, int endRow);
	public List<AdminQuestionDto> QuestionSearchList(String searchType, String keyword, int startRow, int endRow);
	
	//상담문의 읽기
	public AdminQuestionDto QuestionRead(int q_number);
	
	public int QuestionReply(AdminQuestionDto questionDto);
	
	public AdminQuestionDto QuestionSelect(int q_number, String member_id);


}
