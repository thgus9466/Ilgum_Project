package com.java.mypage.dao;

import java.util.List;

import com.java.member.dto.MemberDto;
import com.java.mypage.dto.QuestionDto;

public interface MypageDao {

	public MemberDto readMypage(String id);

	public int boardGroupNumberMax();

	public int boardWrite(QuestionDto questionDto);

	public int qCount(String member_id);

	public List<QuestionDto> qList(String member_id, int startRow, int endRow);

	public QuestionDto qRead(int q_number);

	public String getName(String member_id);

	public int qDelete(int q_number);
}
