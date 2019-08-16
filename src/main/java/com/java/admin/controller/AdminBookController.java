package com.java.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dto.AdminBookDto;
import com.java.admin.dto.AdminCouponDto;
import com.java.admin.service.AdminBookService;
import com.java.admin.service.AdminCouponService;
import com.java.aop.IlgumAspect;



/**
 * @author 최선권
 * @date 2019.08.08
 * @description 관리자 도서관리 시스템 컨트롤러
 */ 

@Controller
public class AdminBookController {
	@Autowired
	private AdminBookService bookService; 

	@Autowired
	private AdminCouponService couponService;

	//도서추가페이지
	@RequestMapping(value="/admin/AdminBookInsert.do", method=RequestMethod.GET)
	public ModelAndView bookWrite(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("admin/AdminBookInsert.empty");
	}

	
	//도서추가시 아이디 중복확인
	@RequestMapping(value = "/admin/isbnCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		bookService.isbnCheck(mav);

		Map<String, Object> map = mav.getModelMap();
		int check = (Integer) map.get("check");
		return String.valueOf(check);
	}
	
	//도서추가확인	
	@RequestMapping(value="/admin/writeOk.do", method=RequestMethod.POST)
	public ModelAndView  bookWriterOk(HttpServletRequest request, 
				HttpServletResponse response, AdminBookDto bookDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("bookDto", bookDto);
		mav.addObject("request", request);
		bookService.bookWriteOk(mav);
		return mav;
	}

	
	//도서목록페이지
	@RequestMapping(value="/admin/AdminBook.do", method=RequestMethod.GET)
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response, AdminBookDto bookDto) { 
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request); 
		mav.addObject("bookDto", bookDto);
		
		bookService.bookList(mav); 
		
		return mav;
	}
		
	//도서상세페이지
	@RequestMapping(value="/admin/AdminBookRead.do", method=RequestMethod.GET)
	public ModelAndView bookRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		bookService.bookRead(mav);
		
		return mav;
	}
	
	
	//도서수정페이지
	@RequestMapping(value="/admin/AdminBookUpdate.do", method=RequestMethod.GET)
	public ModelAndView boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		bookService.bookUpdate(mav);
		
		return mav;
	}

	//도서 수정완료
	@RequestMapping(value="/admin/AdminBookUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView boardUpdateOk(HttpServletRequest request, HttpServletResponse response,AdminBookDto bookDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		
		bookService.bookUpdateOk(mav);
		
		return mav;
	}
	
}