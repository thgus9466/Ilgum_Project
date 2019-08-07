package com.java.book.service;

import org.springframework.web.servlet.ModelAndView;

public interface BookService {
	public void bookDetail(ModelAndView mav);
	
	public void bookList(ModelAndView mav);
}
