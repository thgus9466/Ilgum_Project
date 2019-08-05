package com.java.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.IlgumAspect;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;

@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public void idCheck(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String id = request.getParameter("userid");
		String checkId = memberDao.idCheck(id);
		
		int check = 0;
		if(checkId != null) check = 1;

		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
	}

	@Override
	public void memberJoinOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");

		memberDto.setMember_email(request.getParameter("member_email1")+request.getParameter("member_email2"));
		memberDto.setMember_phone1(request.getParameter("phone1_1")+request.getParameter("phone1_2")+request.getParameter("phone1_3"));
		memberDto.setMember_phone2(request.getParameter("phone2_1")+request.getParameter("phone2_2")+request.getParameter("phone2_3"));

		memberDto.setMember_point(0);
		memberDto.setMember_level("AA");
		
		int check = memberDao.memberInsert(memberDto);
		IlgumAspect.logger.info(IlgumAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("member/joinOk");
	}

	@Override
	public void memberLoginOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("member_id", request.getAttribute("member_id"));
		hMap.put("member_password", request.getAttribute("member_password"));
		
		String member_level = memberDao.memberLoginOk(hMap);
		
		System.out.println(member_level);
		
		mav.addObject("member_level", member_level);
		mav.setViewName("member/loginOk");
	}
}
