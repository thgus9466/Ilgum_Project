package com.java.admin.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 최선권
 * @date 2019.08.08
 * @description 관리자 도서관리 시스템 서비스
 */ 

@Component
public interface AdminBookService {


	public void bookWriteOk(ModelAndView mav);
	
	public void bookList(ModelAndView mav);
	
	public void bookRead(ModelAndView mav);
	
	public void isbnCheck(ModelAndView mav);
	
	public void bookUpdate(ModelAndView mav);
	
	public void bookUpdateOk(ModelAndView mav);
	
	
}
