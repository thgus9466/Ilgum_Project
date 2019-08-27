package com.java.mypage.service;

import org.springframework.web.servlet.ModelAndView;

public interface MypageService {

	public void readMypage(ModelAndView mav);

	public void readUpdate(ModelAndView mav);

	public void update(ModelAndView mav);

	public void DeliverList(ModelAndView mav);	
	
	public void boardWrite(ModelAndView mav);

	public void boardWriteOk(ModelAndView mav);

	public void qList(ModelAndView mav);

	public void qRead(ModelAndView mav);

	public void qReadReply(ModelAndView mav);

	public void qDelete(ModelAndView mav);
	
	public void interest(ModelAndView mav);
	
	public void interestUpdate(ModelAndView mav);

	public void withdrawal(ModelAndView mav);
	
	public void cartInsert(ModelAndView mav);
	
	public void cartDel(ModelAndView mav);
	
	public void cartList(ModelAndView mav);
	
	public void recommand(ModelAndView mav);

	
}
