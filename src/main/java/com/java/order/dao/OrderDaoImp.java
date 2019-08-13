package com.java.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.book.dto.BookDto;

@Component
public class OrderDaoImp implements OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<BookDto> nonMemberOrder(String book_isbn) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.OrderMapper.nonMemberOrder", book_isbn);
	}

}
