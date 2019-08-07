package com.java.book.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.book.dto.BookDto;

@Component
public class BookDaoImp implements BookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public BookDto bookDetail(String book_isbn) {
		
		return sqlSessionTemplate.selectOne("dao.BookMapper.bookDetail", book_isbn);
	}

	@Override
	public int bookCount(String book_name) {
		return sqlSessionTemplate.selectOne("dao.BookMapper.bookCount", book_name);
	}

	@Override
	public List<BookDto> bookList(String book_name, int startRow, int endRow) {

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("book_name", book_name);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);

		return sqlSessionTemplate.selectList("dao.BookMapper.bookList", hMap);
	}
}
