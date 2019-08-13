package com.java.mypage.service;

import org.springframework.web.servlet.ModelAndView;

public interface MypageService {

	public void readMypage(ModelAndView mav);

	public void readUpdate(ModelAndView mav);

	public void update(ModelAndView mav);

	public void DeliverList(ModelAndView mav);	
	
	
	
	
}
