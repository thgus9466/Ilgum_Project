package com.java.book.dao;

import java.util.HashMap;
import java.util.List;

import com.java.book.dto.BestSellerDto;
import com.java.book.dto.BookDto;
import com.java.book.dto.UserBookStar;
import com.java.member.dto.MemberDto;

public interface BookDao {
	public BookDto bookDetail(String book_isbn);
	
	public int bookCount(String book_name);
	
	public List<BookDto> payList(String book_isbn);
	
	public MemberDto payMember(String member_id);

	public List<BookDto> bookList(String book_name, int startRow, int endRow);
	
	public List<BestSellerDto> bestSeller();

	public List<BookDto> bookFirstList();

	public List<BookDto> bookLastList();

	public List<BookDto> monthBook();

	public List<BookDto> newBook();

	public int bookCountCategory(String book_category);
	
	public List<BookDto> bookcategory(String book_category, int startRow, int endRow);

	public int reviewCount(String book_num);

	public List<UserBookStar> reviewList(HashMap<String, Object> hMap);

	public int memberWriteOk(UserBookStar userBookStar);

}
