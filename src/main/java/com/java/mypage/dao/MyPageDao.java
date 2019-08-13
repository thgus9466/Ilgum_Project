package com.java.mypage.dao;

import java.util.List;

import com.java.member.dto.MemberDto;
<<<<<<< HEAD
import com.java.order.dto.OrderDto;
=======
import com.java.mypage.dto.QuestionDto;
>>>>>>> c6d15fbf38847c663bb33a70d819241a8642e19c

public interface MypageDao {

	public MemberDto readMypage(String id);

<<<<<<< HEAD
	public int update(MemberDto memberDto);

	public List<OrderDto> DeliverList(String member_id);

=======
	public int boardGroupNumberMax();

	public int boardWrite(QuestionDto questionDto);

	public int qCount(String member_id);

	public List<QuestionDto> qList(String member_id, int startRow, int endRow);

	public QuestionDto qRead(int q_number);

	public String getName(String member_id);

	public int qDelete(int q_number);
>>>>>>> c6d15fbf38847c663bb33a70d819241a8642e19c
}
