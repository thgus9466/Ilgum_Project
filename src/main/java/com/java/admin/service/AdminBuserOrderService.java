package com.java.admin.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 최선권
 * @date 2019.08.19
 * @description 비회원주문관리
 */ 

@Component
public interface AdminBuserOrderService {

	public void UserOrderList(ModelAndView mav);
	public void UserOrderRead(ModelAndView mav);
	public void UserOrderUpdateOk(ModelAndView mav);
	public void UserOrderDeleteOk(ModelAndView mav);
}