package com.java.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.order.dto.OrderDto;
import com.java.order.dto.PayDto;
import com.java.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/order/orderLogin.do", method = RequestMethod.GET)
	public ModelAndView orderLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		orderService.orderLogin(mav);

		return mav;
	}

	@RequestMapping(value = "/order/oneBookOrder.do", method = RequestMethod.GET)
	public ModelAndView oneBookOrder(HttpServletRequest request, HttpServletResponse response, OrderDto orderDto) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("orderDto", orderDto);

		orderService.oneBookOrder(mav);

		return mav;
	}

	@RequestMapping(value = "/order/booksOrder.do", method = RequestMethod.GET)
	public ModelAndView booksOrder(HttpServletRequest request, HttpServletResponse response, OrderDto orderDto) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("orderDto", orderDto);

		orderService.booksOrder(mav);

		return mav;
	}

	@RequestMapping(value = "/order/buserOrderOk.do", method = RequestMethod.GET)
	public ModelAndView buserOrderOk(HttpServletRequest request, HttpServletResponse response, OrderDto orderDto) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("orderDto", orderDto);

		orderService.buserOrderOk(mav);

		return mav;
	}

	@RequestMapping(value = "/order/couponRate.do", method = RequestMethod.GET)
	@ResponseBody
	public double couponRate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		double admin_sale = orderService.couponRate(mav);

		return admin_sale;
	}
}
