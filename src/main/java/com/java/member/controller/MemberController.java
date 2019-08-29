package com.java.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.service.AdminCouponService;
import com.java.member.dto.MemberDto;
import com.java.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminCouponService couponService;
	
	
	@RequestMapping(value="/member/memberJoin.do", method=RequestMethod.GET)
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/join.tiles");
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

	@RequestMapping(value = "/member/memberJoinOk.do", method = RequestMethod.POST)
	public ModelAndView memberJoinOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		
		memberService.memberJoinOk(mav);
		couponService.couponAuto(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return new ModelAndView("member/login.tiles");
	}
	
	@RequestMapping(value="/member/memberLoginOk.do", method = RequestMethod.POST)
	public ModelAndView memberLoginOk(HttpServletRequest request, HttpServletResponse response
			,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("session",session);
		
		memberService.memberLoginOk(mav);
		couponService.couponUpdate(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public ModelAndView memberLogout(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		memberService.memberLogout(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/memberLoginNaver.do", method=RequestMethod.GET)
	public ModelAndView memberLoginNaver(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/naverLogin.tiles");
	}
	
	@RequestMapping(value="/member/idSearch.do", method=RequestMethod.GET)
	public ModelAndView memberIdSearch(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/idSearch.tiles");
	}
	
	@RequestMapping(value="/member/idSearchOk.do", method=RequestMethod.POST)
	public ModelAndView memberIdSearchOk(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		memberService.memberIdSearchOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/passwordSearch.do", method=RequestMethod.GET)
	public ModelAndView memberPasswordSearch(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("member/passwordSearch.tiles");
	}

	@RequestMapping(value="/member/passwordSearchOk.do", method=RequestMethod.POST)
	public ModelAndView memberPasswordSearchOk(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		memberService.memberPasswordSearchOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/member/storeInfo.do", method = RequestMethod.GET)
	public ModelAndView storeInfo(HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("store/storeInfo.tiles");
		
	}
	
}
