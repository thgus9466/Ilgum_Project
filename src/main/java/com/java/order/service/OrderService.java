package com.java.order.service;

import org.springframework.web.servlet.ModelAndView;

public interface OrderService {
	public void orderLogin(ModelAndView mav);
	public void nonMemberOrder(ModelAndView mav);
	public void memberPay(ModelAndView mav);
}
