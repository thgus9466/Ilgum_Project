package com.java.dao;

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

}
