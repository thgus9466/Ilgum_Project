package com.java.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.order.dto.OrderDto;

@Component
public class OrderDaoImp implements OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public OrderDto oneBookOrder(String book_isbn) {
		return sqlSessionTemplate.selectOne("dao.OrderMapper.oneBookOrder", book_isbn);
	}

	@Override
	public int buserOrderOk(OrderDto orderDto) {
		return sqlSessionTemplate.insert("dao.OrderMapper.buserOrder", orderDto);
	}
}
