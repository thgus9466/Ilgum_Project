package com.java.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.member.dto.MemberDto;
import com.java.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/memberJoin.do", method=RequestMethod.GET)
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/join");
	}
	
	@RequestMapping(value = "/member/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.idCheck(mav);

		Map<String, Object> map = mav.getModelMap();
		int check = (Integer) map.get("check");

		return String.valueOf(check);
	}

	@RequestMapping(value = "/member/memberJoinOk.do", method = RequestMethod.GET)
	public ModelAndView memberJoinOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);

		memberService.memberJoinOk(mav);

		return mav;
	}
	
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/login");
	}
	
	
}
