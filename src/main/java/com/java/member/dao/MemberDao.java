package com.java.member.dao;

import com.java.member.dto.MemberDto;

public interface MemberDao {
	public String idCheck(String id);

	public int memberInsert(MemberDto memberDto);
}
