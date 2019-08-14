package com.java.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dto.AdminMemberDto;
import com.java.admin.service.AdminMemberService;
import com.java.aop.IlgumAspect;



/**
 * @author 최선권
 * @date 2019.08.09
 * @description 관리자 회원관리 시스템 컨트롤러
 */ 

@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemberService memberService; 

	//회원목록페이지
	@RequestMapping(value="/admin/AdminMemberList.do", method=RequestMethod.GET)
	public ModelAndView MemberList(HttpServletRequest request, HttpServletResponse response, AdminMemberDto memberDto) { 
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request); 
		mav.addObject("memberDto", memberDto);
		
		memberService.MemberList(mav); 
		
		return mav;
	}
		
	  //도서상세페이지
	  
	  @RequestMapping(value="/admin/AdminMemberRead.do", method=RequestMethod.GET)
	  public ModelAndView MemberRead(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView mav = new ModelAndView(); 
		  mav.addObject("request",request);
			
		  memberService.MemberRead(mav);
	  
		  return mav;
	  }
	 
}
