package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminBookDto;


/**
 * @author 최선권
 * @date 2019.08.08
 * @description 관리자 도서관리 시스템 Dao입니다.
 */ 


public interface AdminBookDao {
	
	// 도서 추가를 위한 중복 확인
	public int select(String book_isbn);

	// 도서 추가
	public int insert(AdminBookDto bookDto);
	
	//도서 카운터
	public int bookSearchCount(String searchType, String keyword);	
	public int adminBookCount();
	
	//도서목록
	public List<AdminBookDto> bookList(int startRow, int endRow);
	public List<AdminBookDto> bookSearchList(String searchType, String keyword, int startRow, int endRow);
	
	//도서 읽기
	public AdminBookDto bookRead(String book_isbn);
	
	//도서상세정보 수정
	public int bookUpdate(AdminBookDto bookDto);



}
