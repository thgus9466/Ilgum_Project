package com.java.member.dao;

import java.util.HashMap;

import com.java.member.dto.MemberDto;

public interface MemberDao {
	public String idCheck(String id);

	public int memberInsert(MemberDto memberDto);
	
	public String memberLoginOk(HashMap<String, Object> hMap);
}
