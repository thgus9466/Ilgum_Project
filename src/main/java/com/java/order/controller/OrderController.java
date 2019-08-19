package com.java.order.controller;

import java.util.HashMap;
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

import com.java.member.dto.MemberDto;
import com.java.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/order/orderLogin.do", method=RequestMethod.GET)
	public ModelAndView orderLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		orderService.orderLogin(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/order/memberOrder.do", method=RequestMethod.POST)
	public ModelAndView memberOrder(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		
		orderService.memberOrder(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/order/nonMemberOrder.do", method=RequestMethod.GET)
	public ModelAndView nonMemberOrder(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		orderService.nonMemberOrder(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/order/memberPay.do", method=RequestMethod.POST)
	public ModelAndView memberPay(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("session", session);
		
		return mav;
	}
	
	@RequestMapping(value="/order/nonMemberOrder.do", method=RequestMethod.GET)
	public ModelAndView nonMemberOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("session", session);
		orderService.nonMemberOrder(mav);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/order/selectAddress.do", method=RequestMethod.POST)
	public Map<String, Object> selectAddress(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		
		return map;
	}
}
