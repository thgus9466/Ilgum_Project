package com.java.admin.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 최선권
 * @date 2019.08.09
 * @description 관리자 도서관리 시스템 서비스
 */ 

@Component
public interface AdminUserOrderService {

	public void UserOrderList(ModelAndView mav);
	
}