package com.java.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.service.AdminBuserOrderService;
import com.java.admin.service.AdminUserOrderService;
import com.java.aop.IlgumAspect;
import com.java.order.dto.BuserOrderDto;
import com.java.order.dto.UserOrderDto;



/**
 * @author 최선권
 * @date 2019.08.18
 * @description 주문관리 컨트롤러
 */ 

@Controller
public class AdminUserOrderController {
	@Autowired
	private AdminUserOrderService userOrderService; 

	@Autowired
	private AdminBuserOrderService buserOrderService; 

	/********************************/
	/*       회원 주문관리페이지                        */
	/********************************/

	//회원주문관리페이지목록
	@RequestMapping(value="/admin/AdminUserOrderList.do", method=RequestMethod.GET)
	public ModelAndView AdminUserList(HttpServletRequest request, HttpServletResponse response, UserOrderDto userOrderDto) { 
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request); 
		mav.addObject("userOrderDto", userOrderDto);
		
		userOrderService.UserOrderList(mav); 
		return mav;
	}

	//주문관리 상세보기
	@RequestMapping(value="/admin/AdminUserOrderRead.do", method=RequestMethod.GET)
	public ModelAndView userOrderRead(HttpServletRequest request,HttpServletResponse response) { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
	
		userOrderService.UserOrderRead(mav);
	
		return mav; 
	
	}

	//회원 주문내역 수정하기
	@RequestMapping(value="/admin/AdminUserOrderUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView UserOrderUpdateOk(HttpServletRequest request, HttpServletResponse response,UserOrderDto userOrderDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userOrderDto",userOrderDto);
		mav.addObject("request",request);
		
		userOrderService.UserOrderUpdateOk(mav);
		
		return mav;
	}
	
	//회원 주문정내역 삭제
	@RequestMapping(value="/admin/AdminUserOrderDeleteOk.do", method=RequestMethod.GET)
	public ModelAndView UserOrderDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		userOrderService.UserOrderDeleteOk(mav);
		
		return mav;
	}
	
	/********************************/
	/*       비회원 주문관리페이지                     */
	/********************************/

	//비회원주문관리페이지목록
	@RequestMapping(value="/admin/AdminBuserOrderList.do", method=RequestMethod.GET)
	public ModelAndView AdminBuserList(HttpServletRequest request, HttpServletResponse response, BuserOrderDto buserOrderDto) { 
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request); 
		mav.addObject("buserOrderDto", buserOrderDto);
		
		buserOrderService.UserOrderList(mav); 
		return mav;
	}
	//비회원주문관리 상세보기
	@RequestMapping(value="/admin/AdminBuserOrderRead.do", method=RequestMethod.GET)
	public ModelAndView BuserOrderRead(HttpServletRequest request,HttpServletResponse response) { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
	
		buserOrderService.UserOrderRead(mav);
	
		return mav; 
	
	}

	//비회원 주문내역 수정하기
	@RequestMapping(value="/admin/AdminBuserOrderUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView BuerOrderUpdateOk(HttpServletRequest request, HttpServletResponse response,BuserOrderDto buserOrderDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("buserOrderDto",buserOrderDto);
		mav.addObject("request",request);
		
		buserOrderService.UserOrderUpdateOk(mav);
		
		return mav;
	}
	
	//비회원 주문정내역 삭제
	@RequestMapping(value="/admin/AdminBuserOrderDeleteOk.do", method=RequestMethod.GET)
	public ModelAndView BuserOrderDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		buserOrderService.UserOrderDeleteOk(mav);
		
		return mav;
	}

	public static void main(String[] arg) {
		String i = "Hello World!";
		System.out.println(i);
	}
}



