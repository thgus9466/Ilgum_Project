package com.java.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void idCheck(ModelAndView mav);

	public void memberJoinOk(ModelAndView mav);
}
