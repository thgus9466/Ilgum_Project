package com.java.dao;

import com.java.book.dto.BookDto;

public interface BookDao {
	public BookDto bookDetail(String book_isbn);
}
