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
import com.java.book.dto.UserBookStar;
import com.java.book.service.BookService;
import com.java.member.dto.MemberDto;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value = "/book/bookDetail.do", method = RequestMethod.GET)
	public ModelAndView bookDetail(HttpServletRequest request, HttpServletResponse response,
			UserBookStar userBookStar) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("userBookStar", userBookStar);
		
		bookService.bookDetail(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/book/bookPay.do", method = RequestMethod.GET)
	public ModelAndView bookPay(HttpServletRequest request, HttpServletResponse response, HttpSession session, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("session", session);
		mav.addObject("memberDto", memberDto);
		
		bookService.bookPay(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/book/search_list.do", method = RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		bookService.bookList(mav);

		return mav;
	}
	
	@RequestMapping(value="/book/bestSeller.do", method= RequestMethod.GET)
	public ModelAndView bestSeller(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		bookService.bestSeller(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value="/book/monthBook.do", method= RequestMethod.GET)
	public ModelAndView monthBook(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		bookService.monthBook(mav);
		
		return mav;

	}
	
	@RequestMapping(value="/book/newBook.do", method= RequestMethod.GET)
	public ModelAndView newBook(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		bookService.newBook(mav);
		
		return mav;
	}
		
	@RequestMapping(value="/book/category1.do", method= RequestMethod.GET)
	public ModelAndView category1(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		bookService.category1(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/writeOk.do", method= RequestMethod.POST)
	public ModelAndView memberWrite(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		bookService.memberWriteOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/delete.do", method= RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("session", session);
		bookService.memberDelete(mav);
		
		return mav;
	}
}
