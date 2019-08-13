package com.java.book.dao;

import java.util.List;

import com.java.book.dto.BestSellerDto;
import com.java.book.dto.BookDto;

public interface BookDao {
	public BookDto bookDetail(String book_isbn);
	
	public int bookCount(String book_name);

	public List<BookDto> bookList(String book_name, int startRow, int endRow);
	
	public List<BestSellerDto> bestSeller();

	public List<BookDto> bookFirstList();

	public List<BookDto> bookLastList();

	public List<BookDto> monthBook();

	public List<BookDto> newBook();
}
