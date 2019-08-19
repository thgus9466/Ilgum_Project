package com.java.order.service;

import java.util.ArrayList;
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
import com.java.order.dto.NonUserOrderDto;
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
		String order_book_count = request.getParameter("book_quantity");
		
		mav.addObject("book_isbn", book_isbn);
		mav.addObject("book_quantity", order_book_count);
		
		mav.setViewName("order/orderLogin.tiles");
	}

	@Override
	   public void nonMemberOrder(ModelAndView mav) {
	      Map<String, Object> map = mav.getModelMap();
	      HttpServletRequest request = (HttpServletRequest) map.get("request");
	      NonUserOrderDto nonUserOrderDto = (NonUserOrderDto) map.get("nonUserOrderDto");
	      List<NonUserOrderDto> bookList = new ArrayList<NonUserOrderDto>();

	      String book_isbn[] = request.getParameter("book_isbn").split(",");
	      String book_quantity[] = request.getParameter("book_quantity").split(",");

	      for (int i = 0; i < book_isbn.length; i++) {
	         System.out.println("book_isbn: " + book_isbn[i]);
	         System.out.println("quantity: " + book_quantity[i]);
	         nonUserOrderDto = orderDao.nonMemberOrder(book_isbn[i]);
	         nonUserOrderDto.setOrder_book_count(Integer.parseInt(book_quantity[i]));
	         
	         bookList.add(nonUserOrderDto);
	      }
	      System.out.println(bookList.toString());
	      mav.addObject("book_quantity", book_quantity);
	      mav.addObject("bookList", bookList);

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
	public void oneBookOrder(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		BuserOrderDto buserOrderDto = (BuserOrderDto) map.get("buserOrderDto");
		List<BookDto> bookList	= null;
		int total_cost = 0;
		int total_price = 0;
		
		String book_isbn = request.getParameter("book_isbn");
		String order_book_count = request.getParameter("book_quantity");
		System.out.println(order_book_count);
		
		bookList = orderDao.oneBookOrder(book_isbn);
		
		for (int i = 0; i < bookList.size(); i++) {
			int cost = bookList.get(i).getBook_cost();
			int price = bookList.get(i).getBook_price();
			
			total_cost += cost;
			total_price += price;
		}
			
		IlgumAspect.logger.info(IlgumAspect.logMsg + bookList.toString());
		
		mav.addObject("bookList", bookList);
		mav.addObject("total_cost", total_cost);
		mav.addObject("total_price", total_price);
		mav.addObject("book_quantity", order_book_count);
		mav.setViewName("order/oneBookOrder.tiles");
	}
}
