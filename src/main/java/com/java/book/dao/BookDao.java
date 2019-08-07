package com.java.book.dao;

import java.util.List;

import com.java.book.dto.BookDto;

public interface BookDao {
	public BookDto bookDetail(String book_isbn);
	
	public int bookCount(String book_name);

	public List<BookDto> bookList(String book_name, int startRow, int endRow);
}
