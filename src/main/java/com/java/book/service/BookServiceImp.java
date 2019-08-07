package com.java.book.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.dto.BookDto;
import com.java.dao.BookDao;

@Component
public class BookServiceImp implements BookService {
	@Autowired
	private BookDao bookDao;

	@Override
	public void bookDetail(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String book_isbn = request.getParameter("book_isbn");
		IlgumAspect.logger.info(IlgumAspect.logMsg + book_isbn);
		
		BookDto bookDto = bookDao.bookDetail(book_isbn);
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookDto.toString());
		
		mav.addObject("bookDto", bookDto);
		mav.setViewName("book/bookDetail");
	}

}
