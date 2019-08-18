package com.java.ilgum.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.java.book.dto.BookDto;

public interface HomeService {
	public List<BookDto> monthBook();
	
	public List<BookDto> novelList();
	
	public List<BookDto> economyBook();
	
	public List<BookDto> itBook();

	
}
