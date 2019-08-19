package com.java.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.book.dto.BookDto;
import com.java.member.dto.MemberDto;
import com.java.order.dao.OrderDao;
import com.java.order.dto.BuserOrderDto;
import com.java.order.dto.OrderDto;

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
		int total_price = 0;
		int book_cost = 0;
		
		String book_isbn = request.getParameter("book_isbn");
		int book_quantity = Integer.parseInt(request.getParameter("book_quantity"));
		IlgumAspect.logger.info(IlgumAspect.logMsg + book_quantity);
		bookList = orderDao.nonMemberOrder(book_isbn);
		
		for (int i = 0; i < bookList.size(); i++) {
			int cost = bookList.get(i).getBook_cost();
			int price = bookList.get(i).getBook_price();
			book_cost += cost;
			total_price += price;
		}
		
		mav.addObject("bookList", bookList);
		mav.addObject("book_cost", book_cost);
		mav.addObject("total_price", total_price);
		mav.addObject("book_quantity", book_quantity);
		mav.setViewName("order/nonMemOrder.tiles");
	}

	@Override
	public void memberPay(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		
	}

	@Override
	public void memberOrder(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		List<BookDto> memberBook = null;
		
		String book_isbn = request.getParameter("book_isbn");
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		int book_quantity = Integer.parseInt(request.getParameter("book_quantity"));
		int count = orderDao.orderLogin(member_id, member_password);
		int book_cost = 0;
		int total_price = 0;
		
		if (count > 0) {
			request.getSession().setAttribute("login", member_id);
			IlgumAspect.logger.info(IlgumAspect.logMsg + request.getSession().getAttribute("login"));
			memberBook = orderDao.memberBook(book_isbn);
			memberDto = orderDao.selectMember(member_id);
			
			for (int i = 0; i < memberBook.size(); i++) {
				int cost = memberBook.get(i).getBook_cost();
				int price = memberBook.get(i).getBook_price();
				book_cost += cost;
				total_price += price;
			}
			
			mav.addObject("book_quantity", book_quantity);
			mav.addObject("memberBook", memberBook);
			mav.addObject("memberDto", memberDto);
			mav.addObject("member_id", request.getSession().getAttribute("login"));
			mav.addObject("book_cost", book_cost);
			mav.addObject("total_price", total_price);
			mav.setViewName("order/memberOrder.tiles");
		} else {
			mav.setViewName("redirect:order/orderLogin.tiles");
		}
	}

	@Override
	public void memberOrderOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto = (OrderDto) map.get("orderDto");
		
	}

	@Override
	public void nonMemberPay(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		BuserOrderDto BuserOrderDto = (BuserOrderDto) map.get("BuserOrderDto");
		
		IlgumAspect.logger.info(IlgumAspect.logMsg + BuserOrderDto.toString());
		
		int count = orderDao.nonMemberPay(BuserOrderDto);
		
		if (count > 0) mav.setViewName("order/NonMemOrderOk.tiles");
	}
}
