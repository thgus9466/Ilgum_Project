package com.java.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value = "/book/bookDetail.do", method = RequestMethod.GET)
	public ModelAndView bookDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		bookService.bookDetail(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/book/bookPay.do", method = RequestMethod.GET)
	public ModelAndView bookPay(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		
		if (id != null) {
			IlgumAspect.logger.info(IlgumAspect.logMsg + session.isNew() + ", id:" + id);
			
		} else {
			IlgumAspect.logger.info(IlgumAspect.logMsg + session.isNew() + ", id:" + id);
			mav.setViewName("redirect:/member/memberLogin.do");
			
			return mav;
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/book/search_list.do", method = RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		bookService.bookList(mav);

		return mav;
	}
}
