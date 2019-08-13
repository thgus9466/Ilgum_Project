package com.java.mypage.dao;

import java.util.List;

import com.java.member.dto.MemberDto;
import com.java.order.dto.OrderDto;

public interface MyPageDao {

	public MemberDto readMypage(String id);

	public int update(MemberDto memberDto);

	public List<OrderDto> DeliverList(String member_id);

}
