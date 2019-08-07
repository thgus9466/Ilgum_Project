package com.java.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.mypage.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value="/mypage/main.do", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("mypage/main.tiles");
	}
	
	@RequestMapping(value="/mypage/update.do", method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("mypage/update.tiles");
	}
	
	@RequestMapping(value="/mypage/deliver.do", method = RequestMethod.GET)
	public ModelAndView deliver(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("mypage/main.tiles");
	}
}
