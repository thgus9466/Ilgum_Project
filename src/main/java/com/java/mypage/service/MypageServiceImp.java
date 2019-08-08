package com.java.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.member.dto.MemberDto;
import com.java.mypage.dao.MyPageDao;

@Component
public class MypageServiceImp implements MypageService {
	@Autowired
	private MyPageDao mypageDao;

	@Override
	public void readMypage(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = (String) request.getSession().getAttribute("login");
		IlgumAspect.logger.info(IlgumAspect.logMsg + id);
		
		MemberDto memberDto = mypageDao.readMypage(id);
		IlgumAspect.logger.info(IlgumAspect.logMsg +memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("mypage/main.tiles");	
	}

}
