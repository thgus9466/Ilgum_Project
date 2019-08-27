package com.java.book.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface BookService {
	public void bookDetail(ModelAndView mav);
	
	public void bookPay(ModelAndView mav);
	
	public void bookList(ModelAndView mav);
	
	public void bestSeller(ModelAndView mav);

	public void monthBook(ModelAndView mav);

	public void newBook(ModelAndView mav);

	public void category1(ModelAndView mav);

	public void memberWrite(ModelAndView mav);

	public void memberWriteOk(ModelAndView mav);

	public void memberDelete(ModelAndView mav);
	
	public void memberUpdate(ModelAndView mav);

	public List<String> autocomplete(String book_name);
}
