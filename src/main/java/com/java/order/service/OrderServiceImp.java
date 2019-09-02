package com.java.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dto.AdminCouponDto;
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
		List<AdminCouponDto> couponList = new ArrayList<AdminCouponDto>();

		String member_id = (String) request.getSession().getAttribute("member_id");
		String book_isbn = request.getParameter("book_isbn");
		String cart_quantity = request.getParameter("cart_quantity");
		int total_cost = 0;
		int total_price = 0;
		int member_point = 0;

		orderDto = orderDao.oneBookOrder(book_isbn);
		orderDto.setCart_quantity(cart_quantity);
		total_price = orderDto.getBook_price();
		total_cost = (int) (total_price * 1.1);
		orderDto.setTotal_price(total_price);

		orderList.add(orderDto);

		if (member_id != null)
			member_point = orderDao.getPoint(member_id);

		couponList = orderDao.getCoupon(member_id);

		mav.addObject("total_cost", total_cost);
		mav.addObject("total_price", total_price);
		mav.addObject("member_point", member_point);
		mav.addObject("orderList", orderList);
		mav.addObject("couponList", couponList);

		mav.setViewName("order/oneBookOrder.tiles");
	}

	@Override
	public void booksOrder(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto = (OrderDto) map.get("orderDto");
		List<OrderDto> orderList = new ArrayList<OrderDto>();
		List<AdminCouponDto> couponList = new ArrayList<AdminCouponDto>();

		int total_cost = 0;
		int total_price = 0;
		String book_isbn[] = request.getParameter("book_isbn").split(",");
		String cart_quantity[] = request.getParameter("cart_quantity").split(",");

		for (int i = 0; i < book_isbn.length; i++) {

			orderDto = orderDao.oneBookOrder(book_isbn[i]);
			orderDto.setCart_quantity(cart_quantity[i]);
			total_price = total_price + (orderDto.getBook_price() * Integer.parseInt(cart_quantity[i]));
			total_cost = +(int) (total_price * 1.1);

			orderList.add(orderDto);
		}

		String member_id = (String) request.getSession().getAttribute("member_id");
		int member_point = 0;
		if (member_id != null)
			member_point = orderDao.getPoint(member_id);

		couponList = orderDao.getCoupon(member_id);

		mav.addObject("book_isbn", request.getParameter("book_isbn"));
		mav.addObject("cart_quantity", request.getParameter("cart_quantity"));
		mav.addObject("total_cost", total_cost);
		mav.addObject("total_price", total_price);
		mav.addObject("member_point", member_point);
		mav.addObject("orderList", orderList);
		mav.addObject("couponList", couponList);

		mav.setViewName("order/booksOrder.tiles");
	}

	@Override
	public void buserOrderOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto = (OrderDto) map.get("orderDto");
		String member_id = (String) request.getSession().getAttribute("member_id");

		orderDto.setMember_phone(request.getParameter("phone1_1") + "-" + request.getParameter("phone1_2") + "-"
				+ request.getParameter("phone1_3"));

		int check = 0;
		if (member_id == null) {
			orderDto.setMember_id(RandomBuser_id(10));

			check = orderDao.buserOrderOk(orderDto);

		} else {
			orderDto.setMember_id(member_id);

			String admin_couponnumber = request.getParameter("admin_couponnumber");
			String member_couponnumber = "null";
			if (admin_couponnumber != "") {
				member_couponnumber = orderDao.getMember_couponNumber(member_id, admin_couponnumber);

				orderDao.updateCouponState(member_id, member_couponnumber);
			}
			orderDto.setMember_couponnumber(member_couponnumber);

			int member_point = orderDao.getPoint(member_id);
			int used_point = Integer.parseInt(request.getParameter("used_point"));
			int total_price = Integer.parseInt(request.getParameter("total_price"));

			orderDto.setMember_point(member_point - used_point);
			orderDto.setUsed_point(used_point);

			member_point = (int) ((member_point - used_point) + (total_price * 0.05));
			orderDao.setMember_point(member_id, member_point);

			check = orderDao.userOrderOk(orderDto);
		}

		mav.addObject("check", check);

		mav.setViewName("order/orderOk.empty");
	}

	// 비유저 아이디 생성기
	public String RandomBuser_id(int length) {

		char[] charaters = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
				's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		StringBuffer sb = new StringBuffer();
		Random rn = new Random();
		for (int i = 0; i < length; i++) {
			sb.append(charaters[rn.nextInt(charaters.length)]);
		}
		return sb.toString();

	}

	@Override
	public double couponRate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String admin_couponNumber = request.getParameter("admin_couponNumber");
		String couponRate = orderDao.couponRate(admin_couponNumber);

		double admin_sale = 0.0;
		if (couponRate != null)
			admin_sale = Double.parseDouble(couponRate);

		return admin_sale;
	}
}
