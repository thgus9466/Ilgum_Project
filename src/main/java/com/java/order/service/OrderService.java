package com.java.order.service;

import org.springframework.web.servlet.ModelAndView;

public interface OrderService {
	public void orderLogin(ModelAndView mav);
	public void nonMemberOrder(ModelAndView mav);
	public void oneBookOrder(ModelAndView mav);
	public void memberOrder(ModelAndView mav);
	public void memberPay(ModelAndView mav);
	public void memberOrderOk(ModelAndView mav);
}
