package com.java.book.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.book.dto.BestSellerDto;
import com.java.book.dto.BookDto;
import com.java.book.dto.UserBookStar;
import com.java.member.dto.MemberDto;

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
	
	@Override
	public List<BookDto> payList(String book_isbn) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.BookMapper.bookPay", book_isbn);
	}

	@Override
	public MemberDto payMember(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.BookMapper.payMember", member_id);
	}
	
	@Override
	public List<BestSellerDto> bestSeller() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.BookMapper.bestSeller");
	}

	@Override
	public List<BookDto> bookFirstList() {
		
		return sqlSessionTemplate.selectList("dao.BookMapper.bookFirstList");
	}

	@Override
	public List<BookDto> bookLastList() {
		
		return sqlSessionTemplate.selectList("dao.BookMapper.bookLastList");
	}

	@Override
	public List<BookDto> monthBook() {
		
		return sqlSessionTemplate.selectList("dao.BookMapper.monthBook");
	}

	@Override
	public List<BookDto> newBook() {
		
		return sqlSessionTemplate.selectList("dao.BookMapper.newBook");
	}

	@Override
	public int bookCountCategory(String book_category) {
		
		return sqlSessionTemplate.selectOne("dao.BookMapper.bookCountCategory", book_category);
	}

	@Override
	public List<BookDto> bookcategory(String book_category, int startRow, int endRow) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("book_category", book_category);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);

		return sqlSessionTemplate.selectList("dao.BookMapper.bookListCategory", hMap);
	}

	@Override
	public int reviewCount(String book_num) {
		
		return sqlSessionTemplate.selectOne("dao.BookMapper.reviewCount", book_num);
	}

	@Override
	public List<UserBookStar> reviewList(HashMap<String, Object> hMap) {
		
		return sqlSessionTemplate.selectList("dao.BookMapper.reviewList", hMap);
	}

	@Override
	public int memberWriteOk(UserBookStar userBookStar) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.BookMapper.writeOk", userBookStar);
	}

	@Override
	public String deleteCheck(HashMap<String, Object> hMap) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.BookMapper.deleteCheck", hMap);
	}

	@Override
	public int deleteReview(HashMap<String, Object> hMap) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.BookMapper.deleteReview", hMap);
	}

	

}
