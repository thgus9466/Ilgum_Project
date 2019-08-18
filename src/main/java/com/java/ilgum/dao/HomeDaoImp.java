package com.java.ilgum.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.book.dto.BookDto;

@Component
public class HomeDaoImp implements HomeDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int bookCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.HomeMapper.bookCount");
	}

	@Override
	public List<BookDto> bookList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.HomeMapper.monthBook");
	}

	@Override
	public int novelCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.HomeMapper.novelCount");
	}

	@Override
	public List<BookDto> novelList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.HomeMapper.novelList");
	}

	@Override
	public int economyCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.HomeMapper.economyCount");
	}

	@Override
	public List<BookDto> economyList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.HomeMapper.economyList");
	}

	@Override
	public int itCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.HomeMapper.itCount");
	}

	@Override
	public List<BookDto> itList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.HomeMapper.itList");
	}

	
}
