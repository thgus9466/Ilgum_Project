package com.java.member.dao;

import java.util.HashMap;

import com.java.member.dto.MemberDto;

public interface MemberDao {
	public String idCheck(String id);

	public int memberInsert(MemberDto memberDto);
	
	public String memberLoginOk(HashMap<String, Object> hMap);
	
	public String memberIdSearchOk(HashMap<String, Object> hMap);

	public String memberPasswordSearchOk(HashMap<String, Object> hMap);

	public int memberPasswordNew(HashMap<String, Object> hMap);
	
	public String memberLevel(String member_id);

	public int memberGoogleCheck(HashMap<String, Object> hMap);
}
