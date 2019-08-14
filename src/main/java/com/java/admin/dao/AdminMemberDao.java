package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminMemberDto;


/**
 * @author 최선권
 * @date 2019.08.09
 * @description 관리자 회원관리 시스템 Dao입니다.
 */ 


public interface AdminMemberDao {

	//회원카운터(전체조회)
	public int MemberCount();

	//회원카운터(상세조회)
	public int MemberSearchCount(String searchType, String keyword);	

	
	//회원목록(전체조회페이지)
	public List<AdminMemberDto> MemberList(int startRow, int endRow);

	//회원목록(상세조회페이지)
	public List<AdminMemberDto> MemberSearchList(String searchType, String keyword, int startRow, int endRow);

	//회원 상세보기
	public AdminMemberDto MemberRead(String member_id);
}
