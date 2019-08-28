package com.java.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.order.dao.OrderDao;
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
		String cart_quantity = request.getParameter("cart_quantity");
		System.out.println("수량 : " + cart_quantity);

		mav.addObject("book_isbn", book_isbn);
		mav.addObject("cart_quantity", cart_quantity);

		mav.setViewName("order/orderLogin.tiles");
	}

	@Override
	public void oneBookOrder(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto = (OrderDto) map.get("orderDto");

		List<OrderDto> orderList = new ArrayList<OrderDto>();

		String member_id = (String) request.getSession().getAttribute("member_id");
		String book_isbn = request.getParameter("book_isbn");
		String cart_quantity = request.getParameter("cart_quantity");
		int total_cost = 0;
		int total_price = 0;
		int member_point = 0;

		if (member_id == null) {
			orderDto = orderDao.oneBookOrder(book_isbn);
			orderDto.setCart_quantity(cart_quantity);
			total_price = orderDto.getBook_price();
			total_cost = (int) (total_price * 1.1);
			orderDto.setTotal_price(total_price);
			
			orderList.add(orderDto);

			mav.addObject("total_cost", total_cost);
			mav.addObject("total_price", total_price);
			mav.addObject("orderList", orderList);

			mav.setViewName("order/oneBookOrder.tiles");
			
		} else {

		}
	}
	
	@Override
	public void booksOrder(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto = (OrderDto) map.get("orderDto");
		List<OrderDto> orderList = new ArrayList<OrderDto>();

		int total_cost = 0;
		int total_price = 0;
		String book_isbn[] = request.getParameter("book_isbn").split(",");
		String cart_quantity[] = request.getParameter("cart_quantity").split(",");

		for (int i = 0; i < book_isbn.length; i++) {
			System.out.println("book_isbn: " + book_isbn[i]);
			System.out.println("quantity: " + cart_quantity[i]);

			orderDto = orderDao.oneBookOrder(book_isbn[i]);
			orderDto.setCart_quantity(cart_quantity[i]);
			total_price = total_price + (orderDto.getBook_price() * Integer.parseInt(cart_quantity[i]));
			total_cost =+ (int) (total_price * 1.1);

			orderList.add(orderDto);
		}

		mav.addObject("book_isbn", request.getParameter("book_isbn"));
		mav.addObject("cart_quantity", request.getParameter("cart_quantity"));
		mav.addObject("total_cost", total_cost);
		mav.addObject("total_price", total_price);
		mav.addObject("orderList", orderList);

		mav.setViewName("order/booksOrder.tiles");
	}

	@Override
	public void buserOrderOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto = (OrderDto) map.get("orderDto");
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		orderDto.setMember_phone(request.getParameter("phone1_1")+"-"+request.getParameter("phone1_2")+"-"+request.getParameter("phone1_3"));
		
		int check = 0;
		if(member_id==null) {
			check = orderDao.buserOrderOk(orderDto);
			
		} else {
			
		}
		
		mav.addObject("check", check);
		
		mav.setViewName("order/orderOk.empty");
	}
}
