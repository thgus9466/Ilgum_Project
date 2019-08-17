package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.java.admin.dto.AdminBookDto;

/**
 * @author 최선권
 * @date 2019.08.08
 * @description 관리자 도서관리 시스템 DAO implement
 */ 

@Component
public class AdminBookDaoImp implements AdminBookDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//도서추가
	@Override
	public int insert(AdminBookDto bookDto) {
		System.out.println("insert 넘어옴");
		System.out.println(bookDto.toString());
		return sqlSessionTemplate.insert("dao.AdminBookMapper.bookInsert", bookDto);
	}
	
	//도서검색시 검색 수량표기(상세)
	@Override
	public int bookSearchCount(String searchType, String keyword) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		System.out.println("bookSearchCount로 진입 ");
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		return sqlSessionTemplate.selectOne("dao.AdminBookMapper.bookSearchCount", hMap);
	}
	//도서검색시 검색 수량표기(전체)
	@Override
	public int adminBookCount() {
		return sqlSessionTemplate.selectOne("dao.AdminBookMapper.adminBookCount");
	}

	//도서검색 리스트(전체)
	@Override
	public List<AdminBookDto> bookList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminBookMapper.bookList", hMap);

	}
	
	//도서검색 리스트(상세)
	@Override
	public List<AdminBookDto> bookSearchList(String searchType, String keyword, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("searchType", searchType);
		hMap.put("keyword", keyword);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminBookMapper.bookSearchList", hMap);
	}

	//isbn중복확인시 데이터 실시간으로 불러오기
	@Override
	public int select(String book_isbn) {
		return sqlSessionTemplate.selectOne("dao.AdminBookMapper.bookSelect", book_isbn);
	}

	//도서 상세보기시 데이터 불러오기
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public AdminBookDto bookRead(String book_isbn) {
		return sqlSessionTemplate.selectOne("dao.AdminBookMapper.bookReadNumber",book_isbn);
	}

	//도서 수정
	@Override
	public int bookUpdate(AdminBookDto bookDto) {
		return sqlSessionTemplate.update("dao.AdminBookMapper.bookUpdate",bookDto);
	}
}
