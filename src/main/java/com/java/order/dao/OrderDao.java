package com.java.order.dao;

import java.util.List;

import com.java.book.dto.BookDto;

public interface OrderDao {
	public List<BookDto> nonMemberOrder(String book_isbn);
}
