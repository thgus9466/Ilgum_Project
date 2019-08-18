package com.java.ilgum.dao;

import java.util.List;

import com.java.book.dto.BookDto;

public interface HomeDao {
	public int bookCount();
	public List<BookDto> bookList();
	
	public int novelCount();
	public List<BookDto> novelList();
	
	public int economyCount();
	public List<BookDto> economyList();
	
	public int itCount();
	public List<BookDto> itList();
}
