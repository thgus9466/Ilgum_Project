package com.java.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dto.AdminQuestionDto;
import com.java.admin.service.AdminQuestionService;
import com.java.aop.IlgumAspect;



/**
 * @author 최선권
 * @date 2019.08.12
 * @description 관리자 상담관리 시스템 컨트롤러
 */ 

@Controller
public class AdminQuestionController {
	@Autowired
	private AdminQuestionService questionService; 

	//상담글페이지목록
	@RequestMapping(value="/admin/AdminQuestionList.do", method=RequestMethod.GET)
	public ModelAndView QuestionList(HttpServletRequest request, HttpServletResponse response, AdminQuestionDto questionDto) { 
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request); 
		mav.addObject("questionDto", questionDto);
		
		questionService.QuestionList(mav); 
		
		return mav;
	}

	//상담글 상세보기
	@RequestMapping(value="/admin/AdminQuestionRead.do", method=RequestMethod.GET)
	public ModelAndView QuestionRead(HttpServletRequest request,
	HttpServletResponse response) { ModelAndView mav = new ModelAndView();
	mav.addObject("request",request);
	
	questionService.QuestionRead(mav);
	
	return mav; 
	
	}
	
	//상담글 상세보기
	@RequestMapping(value="/admin/AdminQuestionReadReply.do", method=RequestMethod.GET)
	public ModelAndView QuestionReadReply(HttpServletRequest request,
			HttpServletResponse response) { ModelAndView mav = new ModelAndView();
			mav.addObject("request",request);
			
			questionService.QuestionReadReply(mav);
			
			return mav; 
			
	}
	
	//상담글 답변달기
	@RequestMapping(value="/admin/AdminQuestionWrite.do", method=RequestMethod.GET)
	public ModelAndView QuestionWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		questionService.QuestionWrite(mav);
		
		return mav;
	}
	
	//상담글 수정하기
	@RequestMapping(value="/admin/AdminQuestionWriteReply.do", method=RequestMethod.GET)
	public ModelAndView QuestionUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		questionService.QuestionUpdate(mav);
		
		return mav;
	}
	
	//상담글 답변등록 확인
	@RequestMapping(value="/admin/AdminQuestionWriteOk.do", method=RequestMethod.POST)
	public ModelAndView QuestionWriteOk(HttpServletRequest request, HttpServletResponse response,AdminQuestionDto questionDto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("컨트롤러로 이동");
		mav.addObject("questionDto",questionDto);
		
		questionService.QuestionReplyOk(mav);
		
		return mav;
	}
}

