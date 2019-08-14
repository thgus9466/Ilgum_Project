package com.java.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.member.dto.MemberDto;
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
	public ModelAndView readUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.readUpdate(mav);
		return mav;
	}
	
	@RequestMapping(value="/mypage/updateOk.do", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		mypageService.update(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/mypage/deliver.do", method = RequestMethod.GET)
	public ModelAndView deliver(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mypageService.DeliverList(mav);
		
		return mav;
	}

	//상담문의 글 작성
	@RequestMapping(value = "/mypage/write.do", method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.boardWrite(mav);
		return mav;
	}
	//상담문의 글 작성 확인
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
	//관리자 답변글 보기
	@RequestMapping(value = "/mypage/readReply.do", method = RequestMethod.GET)
	public ModelAndView qReadReply(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.qReadReply(mav);

		return mav;
	}
	
	@RequestMapping(value = "/mypage/delete.do", method = RequestMethod.GET)
	public ModelAndView qDelete(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.qDelete(mav);

		return mav;
	}
	
	@RequestMapping(value = "/mypage/interest.do", method = RequestMethod.GET)
	public ModelAndView interest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.interest(mav);

		return mav;
	}
	
	@RequestMapping(value = "/mypage/withdrawal.do", method = RequestMethod.GET)
	public ModelAndView withdrawal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		mypageService.withdrawal(mav);

		return mav;
	}
}
