package com.java.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.dao.BookDao;
import com.java.book.dto.BookDto;

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
		mav.setViewName("/book/bookDetail.tiles");
	}

	@Override
	public void bookList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String book_name = request.getParameter("book_name");
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";

		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		int count = bookDao.bookCount(book_name);
		
		List<BookDto> bookList = null;
		if (count > 0)
			bookList = bookDao.bookList(book_name, startRow, endRow);
		
		mav.addObject("book_name", book_name);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);

		mav.setViewName("/book/search_list.tiles");
	}
}
