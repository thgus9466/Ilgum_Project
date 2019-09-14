package com.java.order.service;

import org.springframework.web.servlet.ModelAndView;

public interface OrderService {
	public void orderLogin(ModelAndView mav);
	
	public void oneBookOrder(ModelAndView mav);
	
	public void booksOrder(ModelAndView mav);
	
	public void buserOrderOk(ModelAndView mav);
	
	public double couponRate(ModelAndView mav);
}
