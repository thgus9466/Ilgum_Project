package com.java.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.book.dto.BookDto;
import com.java.order.dao.OrderDao;

@Component
public class OrderServiceImp implements OrderService {
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void orderLogin(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String book_isbn = request.getParameter("book_isbn");
		
		mav.addObject("book_isbn", book_isbn);
		mav.setViewName("order/orderLogin.tiles");
	}

	@Override
	public void nonMemberOrder(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<BookDto> bookList = null;
		
		String book_isbn = request.getParameter("book_isbn");
		bookList = orderDao.nonMemberOrder(book_isbn);
		
		mav.addObject("bookList", bookList);
		mav.setViewName("order/nonMemOrder.tiles");
	}

	@Override
	public void memberPay(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		
		
		
	}
}
