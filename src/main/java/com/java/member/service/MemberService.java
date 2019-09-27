package com.java.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void idCheck(ModelAndView mav);

	public void memberJoinOk(ModelAndView mav);
	
	public void memberLoginOk(ModelAndView mav);
	
	public void memberLogout(ModelAndView mav);
	
	public void memberIdSearchOk(ModelAndView mav);

	public void memberPasswordSearchOk(ModelAndView mav);

	public void googleJoin(ModelAndView mav);
}
