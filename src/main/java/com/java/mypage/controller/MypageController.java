package com.java.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.mypage.dto.QuestionDto;
import com.java.mypage.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value="/mypage/main.do", method = RequestMethod.GET)
	public ModelAndView readMypage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.readMypage(mav);
		return mav;
	}
	
	@RequestMapping(value="/mypage/update.do", method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("mypage/update.tiles");
	}
	
	@RequestMapping(value="/mypage/deliver.do", method = RequestMethod.GET)
	public ModelAndView deliver(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("mypage/main.tiles");
	}
	
	@RequestMapping(value = "/mypage/write.do", method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.boardWrite(mav);
		return mav;
	}

	@RequestMapping(value = "/mypage/writeOk.do", method = RequestMethod.GET)
	public ModelAndView writeOk(HttpServletRequest request, HttpServletResponse response, QuestionDto questionDto) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("questionDto", questionDto);

		mypageService.boardWriteOk(mav);
		return mav;
	}
	
	@RequestMapping(value = "/mypage/question.do", method = RequestMethod.GET)
	public ModelAndView qList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.qList(mav);

		return mav;
	}
		
	@RequestMapping(value = "/mypage/read.do", method = RequestMethod.GET)
	public ModelAndView qRead(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.qRead(mav);

		return mav;
	}
		
	@RequestMapping(value = "/mypage/delete.do", method = RequestMethod.GET)
	public ModelAndView qDelete(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.qDelete(mav);

		return mav;
	}
}
