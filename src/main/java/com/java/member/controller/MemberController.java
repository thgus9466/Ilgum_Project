package com.java.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/memberJoin.do", method=RequestMethod.GET)
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/join");
	}
	
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/login");
	}
}
